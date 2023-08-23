<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.kiwe.dto.Masscom" %>
<%@ page import="com.kiwe.db.*" %>
<%@ page import="java.util.Date" %>
<%@ include file="../encoding.jsp" %>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();
    String sql = "select * from masscom order by mno desc";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    List<Masscom> masscomList = new ArrayList<>();
    while(rs.next()){
        Masscom mc = new Masscom();
        mc.setMno(rs.getInt("mno"));
        mc.setTitle(rs.getString("title"));
        mc.setLink(rs.getString("link"));
        mc.setResdate(rs.getString("resdate"));
        masscomList.add(mc);
    }
    con.close(rs, pstmt, conn);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>언론보도</title>
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
        .contents { clear:both; min-height:100vh;
            background-image: url("../images/bg_visual_overview.jpg");
            background-repeat: no-repeat; background-position:center -250px;}
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: auto; position:relative; }
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
            border-top:1px solid #f5be8b; border-bottom:1px solid #f5be8b;
            background-color:#f5be8b; color:#fff; }
        .tb1 td {line-height:32px; padding-top:8px; padding-bottom:8px;
            border-bottom:1px solid #f5be8b;
            padding-left: 14px; border-top:1px solid #f5be8b; }

        .tb1 .item1 { width:80%; text-align: left; text-indent: 48px; }
        .tb1 .item2 { width:20%; }

        .indata { display:inline-block; width:300px; height: 48px; line-height: 48px;
            text-indent:14px; font-size:18px; }
        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #f5be8b; color:#fff; font-size: 18px; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }
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
            <p><a href="/">HOME</a> &gt; <a href="">윜 News</a> &gt; <span>언론보도</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">언론보도</h2>
                <br><br><hr><br><br>
                <table class="tb1" id="myTable">
                    <thead>
                    <th class="item1">제목</th>
                    <th class="item2">작성일</th>
                    </thead>

                    <tbody>
                    <%
                        SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
                        for(Masscom mc:masscomList) {
                            Date d = ymd.parse(mc.getResdate());  //날짜데이터로 변경
                            String date = ymd.format(d);    //형식을 포함한 문자열로 변경
                    %>
                    <tr>
                        <td class="item1">
                            <%-- 6. 로그인한 사용자만 제목 부분의 a요소에 링크 중 bno 파라미터(쿼리스트링)으로 상세보기를 요청 가능--%>
                            <a href="<%=mc.getLink() %>"><%=mc.getTitle() %></a>
                        </td>
                        <td class="item2"><%=date %></td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
    </div>
</div>
</body>
</html>