<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 라이브러리 임포트 --%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>
<%@ page import="com.kiwe.db.*" %>
<%@ page import="com.kiwe.dto.*" %>
<%
    //2. DB 연결
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    //3. SQL을 실행하여 결과셋(ResultSet) 받아오기
    String sql = "select * from faq order by fno asc";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    //4. 받아온 결과셋(ResultSet) 을 질문및답변 목록(qnaList)에 불러와 하나의 레코드씩 담기
    List<Faq> faqList = new ArrayList<>();
    while (rs.next()) {
        Faq faq = new Faq();
        faq.setFno(rs.getInt("fno"));
        faq.setQuestion(rs.getString("question"));
        faq.setAnswer(rs.getString("answer"));
        faqList.add(faq);
    }
    con.close(rs, pstmt, conn);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>윜(Week)</title>
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
        .contents { clear:both; min-height:100vh;
            background-image: url("/images/bk.jpg");
            background-repeat: no-repeat; background-position:center -265px; }
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

        .tb1 { width:800px; margin:50px auto; }
        .tb1 th { line-height:32px; padding-top:8px; padding-bottom:8px;
            border-top:1px solid #333; border-bottom:1px solid #333;
            background-color:yellowgreen; color:#fff; }
        .tb1 td {line-height:32px; padding-top:8px; padding-bottom:8px;
            border-bottom:1px solid #333;
            padding-left: 14px; border-top:1px solid #333; }

        .tb1 .item1 { width:10%; text-align: center; }
        .tb1 .item2 { width:65%; }
        .tb1 .item3 { width:10%; text-align: center; }
        .tb1 .item4 { width:15%; text-align: center; }

        .btn_group p {text-align: center;   line-height:3.6; }
        .qnalist { font-size: 18px; }
        .qnalist li { fpadding-top:8px; padding-bottom:8px; line-height: 2; }
        .qnalist li .ans { padding: 16px;  background-color: #f1f1f1; }
        .ans { display:none; }
        .que:after { content:"▼"; padding-left: 36px;}
        .que.on:after { content:"▲"; }
    </style>

    <link rel="stylesheet" href="../ft.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <div class="container">
        <div class="contents" id="contents">
            <div class="breadcrumb">
                <p><a href="/">HOME</a> &gt; <a href="/faq/faqList.jsp">자주하는질문</a></p>
            </div>
            <section class="page" id="page1">
                <div class="page_wrap">
                    <h2 class="page_tit">자주하는질문</h2>
                    <ul class="qnalist">
                        <%
                            int num = 0;
                            for (Faq f : faqList) {
                        %>
                        <li>
                            <div class="que">[<%=++num %>] <%=f.getQuestion() %>
                            </div>
                            <div class="ans"><%=f.getAnswer() %>
                            </div>
                        </li>
                        <% } %>
                    </ul>
                    <script>
                        $(document).ready(function () {
                            $(".qnalist li").click(function () {
                                $(this).find(".ans").slideToggle(500);
                                $(this).find(".que").toggleClass("on");
                            });
                        });
                    </script>
                </div>
            </section>
        </div>
    </div>
<%@ include file="../footer.jsp" %>
</div>
</body>
</html>