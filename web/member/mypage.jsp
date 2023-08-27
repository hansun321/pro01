<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.kiwe.db.*" %>
<%@ page import="com.kiwe.dto.*" %>
<%
    String id = (String )session.getAttribute("id"); //세션의 id 불러오기 (이미 로그인 했으니까 getparameter 아니고 세션으로!)

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    Member mem = new Member(); //마이페이지에 담길 회원 객체 생성
    DBC con = new MariaDBCon();
    conn = con.connect();
    if(conn != null){
        System.out.println("DB 연결 성공");
    }

    try {
        String sql = "select * from member where id=?"; //db에서 로그인한 회원의 정보를 검색하는 쿼리
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery(); //실제 검색은 요기서
        if(rs.next()){ //해당 회원의 정보를 DB에서 로딩하여 회원 객체의 필드의 값으로 저장
            mem.setId(rs.getString("id"));
            mem.setPw(rs.getString("pw"));
            mem.setName(rs.getString("name"));
            mem.setEmail(rs.getString("email"));
            mem.setTel(rs.getString("tel"));
            mem.setRegdate(rs.getString("regdate"));
            mem.setPoint(rs.getInt("point"));
        } else {
            response.sendRedirect("/member/login.jsp");
        }
    } catch(SQLException e) {
        System.out.println("SQL 구문이 처리되지 못했습니다.");
    } finally {
        con.close(rs, pstmt, conn);
    }
%>
<%
    String path0 = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
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
        .wrap { background-color: #ffffff; }
        .contents { clear:both; min-height:1200px;
            background-image: url("../weekcrew/images/library.jpg");
            background-repeat: no-repeat; background-position:center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 1000px; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }
        .tb1 { width:600px; margin:100px auto; }
        .tb1 th { width: 100px; background-color: #f5be8b; height: 48px; margin-top: 50px; margin-bottom: 50px; color:#fff;}
        .tb1 td {  width: 300px;  line-height: 48px; padding-top:24px; padding-bottom:24px; padding-left: 20px; color: #f5be8b;
            max-width: 200px;
            overflow: hidden;}
        .tb1 .th1:first-child {border-radius: 50% 0 0 0;}
        .tb1 .th2 {border-radius: 0 0 0 50%;}

        .inbtn { display: inline-block; margin: 10px; padding: 10px 30px;
            border-radius: 100px; background-color: #f5be8b; color: #fff; }
    </style>

    <link rel="stylesheet" href="../ft.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="">HOME</a> &gt; <span>마이페이지</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">나의 정보</h2>
                <hr>
                    <table class="tb1">
                        <tbody>
                        <tr>
                            <th class="th1">아이디</th>
                            <td><%=mem.getId() %></td>
                        </tr>
                        <tr>
                            <th>비밀번호</th>
                            <td><%=mem.getPw().substring(0,2) %>
                                <%
                                    for (int i=0; i<mem.getPw().length()-2; i++) {
                                        out.print("*");
                                    }
                                %>
                            </td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td><%=mem.getName() %></td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td><%=mem.getEmail() %></td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><%=mem.getTel() %></td>
                        </tr>
                        <tr>
                            <th>가입일자</th>
                            <td><%=mem.getRegdate() %></td>
                        </tr>
                        <tr>
                            <th class="th2">포인트</th>
                            <td><%=mem.getPoint() %></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <a href="/member/modify.jsp" class="inbtn">회원정보수정</a>
                                <a href="javascript:withdraw('<%=mem.getId() %>')" class="inbtn">회원탈퇴</a>
                                <a href="/" class="inbtn">메인으로</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
    <script>
        function withdraw(memId) {
            var flag = confirm("정말로 탈퇴하시겠습니까?");
            if (flag) {
                location.href = "/member/delMember.jsp?id="+memId+"&mode=1";
            }
        }
    </script>
</body>
</html>