<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 라이브러리 임포트 --%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>
<%@ page import="com.kiwe.db.*" %>
<%@ page import="com.kiwe.vo.*" %>
<%@ include file="../encoding.jsp" %>
<%
    //2. DB 연결
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();
    //3. SQL을 실행하여 결과셋(ResultSet) 받아오기
    String sql = "SELECT * FROM qnalist";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    //4. 받아온 결과셋(ResultSet) 을 질문및답변 목록(qnaList)에 불러와 하나의 레코드씩 담기
    List<Qna> qnaList = new ArrayList<>();
    while (rs.next()) {
        Qna qna = new Qna();
        qna.setQno(rs.getInt("qno"));
        qna.setTitle(rs.getString("title"));
        qna.setContent(rs.getString("content"));
        qna.setAuthor(rs.getString("author"));
        qna.setResdate(rs.getString("resdate"));
        qna.setCnt(rs.getInt("cnt"));
        qna.setLev(rs.getInt("lev"));
        qna.setPar(rs.getInt("par"));
        qna.setName(rs.getString("name"));
        qnaList.add(qna);
    }

    sql = "SELECT qna.qno AS qno, COUNT(comment.cno) as countCmt FROM qna LEFT JOIN comment ON qna.qno = comment.qno GROUP BY qna.qno, qna.title";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    Map<Integer, Integer> cmtMap = new HashMap<>();
    while (rs.next()) {
        cmtMap.put(rs.getInt("qno"), rs.getInt("countCmt"));
    }
    //System.out.println(cmtMap);
    con.close(rs, pstmt, conn);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>묻고 답하기 목록</title>
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
        .contents { clear:both; min-height:130vh;
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
        .tb1 { width:800px; margin:50px auto; }
        .tb1 th { line-height:32px; padding-top:8px; padding-bottom:8px;
            border-top:1px solid #f5be8b; border-bottom:1px solid #f5be8b;
            background-color: #f5be8b; color:#fff; }
        .tb1 td {line-height:32px;
            border-bottom:1px solid #f5be8b;
            border-top:1px solid #f5be8b; }

        .tb1 .item1 { width:10%; text-align: center; }
        .tb1 .item2 { width:55%; }
        .tb1 .item3 { width:10%; text-align: center; }
        .tb1 .item4 { width:15%; text-align: center; }
        .tb1 .item5 { width:10%; text-align: center; }

        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #f5be8b; color:#fff; font-size: 18px; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }
        .reply { padding-left:14px; }
        .reply img { margin:-2px; padding-right: 7px; }
        .replyNum { margin-left: 10px; font-size: 14px; font-weight: 700; color: #dc3545 }

        .dataTables_wrapper {
            position: relative;
            clear: both;
            margin-top: 70px;
        }
    </style>
    <link rel="stylesheet" href="../ft.css">
    <style>
        .btn_group { clear:both; width:800px; margin:20px auto; }
        .btn_group:after { content:""; display:block; width:100%; clear: both; }
        .btn_group p {text-align: center;   line-height:3.6; }
    </style>
    <link rel="stylesheet" href="../jquery.dataTables.css">
    <script src="../jquery.dataTables.js"></script>
</head>
<body>
<div class="container">
    <div class="wrap">
        <header class="hd" id="hd">
            <%@ include file="../header.jsp" %>
        </header>
        <div class="contents" id="contents">
            <div class="breadcrumb">
                <p><a href="/">HOME</a> &gt; <a href="/qna/qnaList.jsp">질문 및 답변</a> &gt; <span>질문 및 답변 목록</span></p>
            </div>
            <section class="page" id="page1">
                <div class="page_wrap">
                    <h2 class="page_tit">질문 및 답변 목록</h2>
                    <table class="tb1" id="myTable">
                        <thead>
                        <tr>
                            <th class="item1">글 번호</th>
                            <th class="item2">글 제목</th>
                            <th class="item3">작성자</th>
                            <th class="item4">작성일</th>
                            <th class="item5">조회수</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            SimpleDateFormat ymd = new SimpleDateFormat("yy-MM-dd");
                            int tot = qnaList.size();
                            for (Qna q : qnaList) {
                                Date d = ymd.parse(q.getResdate());
                                String date = ymd.format(d);
                                int cmtNum = cmtMap.get(q.getQno());
                        %>
                        <tr>
                            <td class="item1"><%=tot %>
                            </td>
                            <td class="item2">
                                <% if (q.getLev() == 0) { %>
                                <a href="/qna/getQna.jsp?qno=<%=q.getQno()%>"><%=q.getTitle() %>
                                </a>
                                <% } else { %>
                                <a class="reply" href="/qna/getQna.jsp?qno=<%=q.getQno()%>">
                                    <img src="../images/icon_reply.png" alt="[답변]"><%=q.getTitle() %>
                                </a>
                                <% } %>

                                <% if (cmtNum > 0) { %>
                                <span class="replyNum"><%=cmtNum %></span>
                                <% } %>
                            </td>
                            <td class="item3"><%=q.getName() %>
                            </td>
                            <td class="item4"><%=date %>
                            </td>
                            <td class="item5"><%=q.getCnt() %>
                            </td>
                        </tr>
                        <%
                                tot--;
                            }
                        %>
                        </tbody>
                    </table>
                    <script>
                        $(document).ready(function () {
                            $("#myTable").DataTable({
                                order: [[0, "desc"]]
                            });
                        });
                    </script>
                    <% if (sid != null) { %>
                    <div class="btn_group">
                        <a href="/qna/addQuestion.jsp?lev=0&par=0" class="inbtn">질문하기</a>
                    </div>
                    <% } %>
                </div>
            </section>
        </div>
    </div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>