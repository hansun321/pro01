<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 라이브러리 불러오기 --%>
<%@ page import="java.sql.*" %>
<%@ page import="com.kiwe.db.*" %>
<%@ page import="com.kiwe.vo.*" %>
<%@ page import="com.kiwe.dto.*" %>
<%@ page import="java.util.*" %>
<%-- 2. 인코딩 및 보내온 데이터 받기 --%>
<%@ include file="/encoding.jsp" %>
<%
    int qno = Integer.parseInt(request.getParameter("qno"));
    //3. DB연결
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();
    //4. sql 실행 및 실행결과 받기
    String sql = "SELECT * FROM qnalist WHERE qno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, qno);
    //5. 실행결과(ResultSet) 인 해당 Qna 1건 qna(질문및답변) 객체에 넣기
    rs = pstmt.executeQuery();
    Qna qna = new Qna();
    if (rs.next()) {
        qna.setQno(rs.getInt("qno"));
        qna.setTitle(rs.getString("title"));
        qna.setContent(rs.getString("content"));
        qna.setAuthor(rs.getString("author"));
        qna.setResdate(rs.getString("resdate"));
        qna.setCnt(rs.getInt("cnt"));
        qna.setName(rs.getString("name"));
        qna.setLev(rs.getInt("lev"));
        qna.setPar(rs.getInt("par"));
    }

    //pstmt.close();
    sql = "update qna set cnt=cnt+1 where qno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, qno);
    pstmt.executeUpdate();

    sql = "select * from comment where qno=? order by cno";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, qno);
    rs = pstmt.executeQuery();
    List<Comment> cmtList = new ArrayList<>();
    while (rs.next()) {
        Comment cmt = new Comment();
        cmt.setCno(rs.getInt("cno"));
        cmt.setQno(rs.getInt("qno"));
        cmt.setAuthor(rs.getString("author"));
        cmt.setResdate(rs.getString("resdate"));
        cmt.setContent(rs.getString("content"));
        cmtList.add(cmt);
    }
    con.close(rs, pstmt, conn);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질문 및 답변 글 상세보기</title>
    <%@ include file="../head.jsp" %>
    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="../google.css">
    <link rel="stylesheet" href="../fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="../common.css">
    <link rel="stylesheet" href="../hd.css">
    <style>
        /* 본문 영역 스타일 */
        .wrap { background-color: #fffcf2; }
        .contents { clear:both; min-height:1100px;
            background-image: url("../images/bg_visual_overview.jpg");
            background-repeat: no-repeat; background-position:center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }
        .frm { clear:both; width:1200px; margin:0 auto; padding-top: 80px; }

        .tb1 { width:800px; margin:50px auto; }
        .tb1 th { line-height:32px; padding-top:8px; padding-bottom:8px;
            border-top:1px solid #fff; border-bottom:1px solid #fff;
            background-color: #f5be8b; color:#fff; }
        .tb1 td {line-height:32px; padding-top:8px; padding-bottom:8px;
            border-bottom:1px solid #fff;
            padding-left: 14px; border-top:1px solid #fff; }

        .indata { display:inline-block; width:300px; height: 48px; line-height: 48px;
            text-indent:14px; font-size:18px; }
        .inbtn { display:block;  border-radius:100px;
            min-width:100px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #f5be8b; color:#fff; font-size: 18px;
            float:left; margin-right: 20px; margin-top: 10px; }
        .inbtn:last-child { float:right; }

        .comment-form { margin: 5px 160px;
            border: 1px solid #ccc; padding: 10px; border-radius: 5px; width: 900px;
        }
        .comment-form textarea {
            width: 98%; padding: 10px; margin-top: 10px;
            border: 1px solid #ccc; border-radius: 5px; font-size: 16px;
            resize: vertical;
        }
        .comment-form button {
            margin-top: 10px; padding: 8px 16px; background-color: #f5be8b;
            color: white; border: none; border-radius: 5px; cursor: pointer;
        }

        .comment-table { width: 77%; border-collapse: collapse; margin: 20px 160px }
        .comment-table th, .comment-table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .comment-table th { background-color: #f5be8b; color: #fff }

        .comment-info { margin-bottom: 10px; }
        .comment-date { margin-left: 20px; font-size: 13px;  color: #777; }
        .comment-write {
            margin-top: 7px; padding: 5px; background-color: #f5be8b; color: #fff;
            border: none;
        }

        .del {
            margin-left: 15px; font-size: 12px; color: #f44336; cursor: pointer;
        }
        .del:hover { text-decoration: underline; }
    </style>
    <link rel="stylesheet" href="../ft.css">
</head>
<body>
<div class="container">
    <div class="wrap">
        <header class="hd" id="hd">
            <%@ include file="../header.jsp"%>
        </header>
        <div class="contents" id="contents">
            <div class="breadcrumb">
                <p><a href="/">HOME</a> &gt; <a href="/qna/qnaList.jsp">질문 및 답변</a> &gt; <span>질문 및 답변 글 상세보기</span></p>
            </div>
            <section class="page" id="page1">
                <div class="page_wrap">
                    <h2 class="page_tit">질문 및 답변 글 상세보기</h2>
                    <hr>
                    <table class="tb1" id="myTable">
                        <tbody>
                        <!-- 6. 해당 글번호에 대한 글 상세내용 출력 -->
                        <tr>
                            <th>유형</th>
                            <td>
                                <% if(qna.getLev()==0) { %>
                                <span>질문</span>
                                <% } else { %>
                                <span>답변</span>
                                <% } %>
                            </td>
                        </tr>
                        <tr>
                            <th>글 제목</th>
                            <td><%=qna.getTitle() %></td>
                        </tr>
                        <tr>
                            <th>글 내용</th>
                            <td><%=qna.getContent() %></td>
                        </tr>
                        <tr>
                            <th>작성자</th>
                            <td>
                                <%=qna.getName() %>
                            </td>
                        </tr>
                        <tr>
                            <th>작성일</th>
                            <td><%=qna.getResdate() %></td>
                        </tr>
                        <tr>
                            <th>조회수</th>
                            <td><%=qna.getCnt() %></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <!-- 7. 용도별 링크 버튼 추가 -->
                                <!-- 현재 글이 질문 글이면,
                                    로그인한 사람만 답변하기,
                                    질문을 등록한 사람(관리자포함)만 질문글 수정,
                                    질문글 삭제 버튼 추가
                                 아니면(답변 글이면),
                                    답변을 등록한 사람(관리자포함)만 답변글 삭제,
                                    답변글 버튼 수정 -->
                                <!-- 모든 사용자 목록 버튼 추가 -->
                                <% if(qna.getLev()==0) { %>
                                <% if(sid!=null) { %>
                                <a href="/qna/addQuestion.jsp?lev=1&par=<%=qna.getQno() %>" class="inbtn">답변하기</a>
                                <% } %>
                                <% if(sid!=null && (sid.equals("admin") || sid.equals(qna.getAuthor()))) { %>
                                <a href="/qna/updateQna.jsp?qno=<%=qna.getQno() %>" class="inbtn">질문 수정하기</a>
                                <a href="/qna/delQna.jsp?qno=<%=qna.getQno() %>&lev=0" class="inbtn">질문 삭제하기</a>
                                <% } %>
                                <% } else { %>
                                <% if(sid!=null && (sid.equals("admin") || sid.equals(qna.getAuthor()))) { %>
                                <a href="/qna/updateQna.jsp?qno=<%=qna.getQno() %>" class="inbtn">답변 수정하기</a>
                                <a href="/qna/delQna.jsp?qno=<%=qna.getQno() %>&lev=1" class="inbtn">답변 삭제하기</a>
                                <% } %>
                                <% } %>
                                <a href="/qna/qnaList.jsp" class="inbtn">목록</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <table class="comment-table">
                        <tr>
                            <th>댓글 목록</th>
                        </tr>
                        <%
                            for (Comment c : cmtList) {
                        %>
                        <tr>
                            <td>
                                <div class="comment-info">
                                    <span><%=c.getAuthor() %></span>
                                    <span class="comment-date"><%=c.getResdate() %></span>
                                    <% if(sid!=null && (sid.equals("admin") || sid.equals(c.getAuthor()))) { %>
                                    <a href="javascript:delComment('<%=c.getQno() %>', '<%=c.getCno() %>')" class="del">삭제</a>
                                    <% } %>
                                </div>
                                <div class="comment-content"><%=c.getContent() %></div>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                    <%
                        boolean isLoggedIn = sid != null;
                    %>
                    <form action="/comment/addCommentPro.jsp" method="post" class="comment-form">
                        <div class="comment-input">
                            <%
                                if(isLoggedIn) {
                            %>
                            <textarea name="content" placeholder="댓글을 입력하세요..." rows="5"></textarea>
                            <%
                                } else {
                            %>
                            <textarea placeholder="댓글 쓰기 권한이 없습니다. 로그인 하시겠습니까?" rows="5" onclick="redirectToLogin()"></textarea>
                            <%
                                }
                            %>
                            <input type="hidden" name="qno" id="qno" value="<%=qno %>">
                        </div>
                        <div class="comment-submit">
                            <% if (isLoggedIn) { %>
                            <input type="submit" class="comment-write" value="댓글 작성">
                            <% }  %>
                        </div>
                    </form>
                </div>
            </section>
        </div>
        <footer class="ft" id="ft">
            <%@ include file="../footer.jsp"%>
        </footer>
    </div>
</div>
    <script>
        function delComment(qno, cno) {
            var flag = confirm("댓글을 삭제하시겠습니까?");
            if (flag) {
                location.href = "/comment/delCommentPro.jsp?qno=" + qno + "&cno=" + cno;
            }
        }

        function redirectToLogin() {
            location.href = "/member/login.jsp";
        }
    </script>
</body>
</html>