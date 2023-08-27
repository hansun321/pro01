<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.kiwe.db.*" %>
<%@ page import="com.kiwe.dto.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.Date" %>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();
    if (conn != null) {
        System.out.println("DB 연결 성공");
    }

    String sql = "select * from weekcrew order by wid desc";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    List<Weekcrew> wcList = new ArrayList<>();
    while (rs.next()) {
        Weekcrew wc = new Weekcrew();
        wc.setWid(rs.getInt("wid"));
        wc.setName(rs.getString("name"));
        wc.setEmail(rs.getString("email"));
        wc.setContent(rs.getString("content"));
        wc.setContent2(rs.getString("content2"));
        wcList.add(wc);
    }

    con.close(rs, pstmt, conn);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 목록</title>
    <%@ include file="../../head.jsp" %>
    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="../../google.css">
    <link rel="stylesheet" href="../../fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="../../common.css">
    <link rel="stylesheet" href="../../hd.css">
    <style>
        /* 본문 영역 스타일 */

        .contents { clear:both; min-height:1700px;
            background-image: url("../../weekcrew/images/library.jpg");
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
        .tb1 th .kick{ display: none; }

        .tb1 td {line-height:32px;
            border-bottom:1px solid #f5be8b;
            border-top:1px solid #f5be8b; }
        .tb1 .kick { width:5%; text-align: center; }

        .tb1 .item8 { width:5%; text-align: center;  max-width: 100px;
            padding: 0 20px;
            overflow: hidden;}
        .tb1 .item9 { width:10%; text-align: center;
            max-width: 150px;
            padding: 0 20px;
            overflow: hidden;}
        .tb1 .item10 { width:35%; text-align: center;
            overflow: hidden;
            max-width: 200px;}
        .tb1 .item11 { width:35%; text-align: center;
            overflow: hidden;
            max-width: 200px;}
        .tb1 .item12 { width:15%; text-align: center;
            overflow: hidden;
            max-width: 200px;}

        h3 {
            clear: both;
            text-align: center;
            line-height: 50px;
            height: 50px;
            font-size: 38px;
            /* padding: 5px 20px; */
            margin: 50px auto 0px auto;
            color: #f5be8b;}
    </style>

    <link rel="stylesheet" href="../../ft.css">
    <style>
        .btn_group { clear:both; width:800px; margin:20px auto; }
        .btn_group:after { content:""; display:block; width:100%; clear: both; }
        .btn_group p {text-align: center;   line-height:3.6; }
        .inbtn {
            display: block;
            border-radius: 100px;
            min-width: 56px;
            text-align: center;
            line-height: 21px;
            background-color: #f5be8b;
            color: #fff;
            font-size: 14px;
            margin: auto;
            border-color: #f5be8b;
        }
    </style>

    <link rel="stylesheet" href="../../jquery.dataTables.css">
    <script src="../../jquery.dataTables.js"></script>

</head>
<body>
<div class="container">
    <div class="wrap">
        <header class="hd" id="hd">
            <%@ include file="../../header.jsp" %>
        </header>
        <div class="contents" id="contents">
            <div class="breadcrumb">
                <p><a href="">HOME</a> &gt; <span>관리자 페이지</span> &gt; <span>윜크루 지원 관리</span></p>
            </div>
            <section class="page" id="page1">
                <div class="page_wrap">
                    <h2 class="page_tit">윜크루 지원 관리</h2>
                    <div class="weekcrew">
                        <table class="tb1" id="myTable2">
                            <thead>
                            <tr>
                                <th class="item8">이름</th>
                                <th class="item9">이메일</th>
                                <th class="item10">지원 문항 1</th>
                                <th class="item11">지원 문항 2</th>
                                <th class="item12">관리</th>
                            </tr>
                            </thead>
                            <tbody>

                            <%
                                for (Weekcrew w : wcList) {
                            %>
                            <tr>
                                <td class="item8"><%=w.getName() %></td>
                                <td class="item9"><%=w.getEmail() %></td>
                                <td class="item10"><%=w.getContent() %></td>
                                <td class="item11"><%=w.getContent2() %></td>
                                <td class="item12 kick"><button class="inbtn" onclick="administerWC('<%=w.getWid() %>')">삭제</button></td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                        <script>
                            $(document).ready( function () {
                                $('#myTable').DataTable({
                                    order:[[0, "desc"]],
                                });
                            });
                        </script>
                        <script>
                            function administerWC(wid) {
                                window.location.href = "/member/admin/deleteWeekcrew.jsp?wid="+wid;
                            }
                        </script>
                    </div>
                </div>
            </section>
        </div>
        <footer class="ft" id="ft">
            <%@ include file="../../footer.jsp" %>
        </footer>
    </div>
</div>
</body>
</html>