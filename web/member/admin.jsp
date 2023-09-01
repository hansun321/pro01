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

    String sql = "select * from member where id !='admin' ";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    List<Member> memList = new ArrayList<>();
    while (rs.next()) {
        Member m = new Member();
        m.setId(rs.getString("id"));
        m.setPw(rs.getString("pw"));
        m.setName(rs.getString("name"));
        m.setEmail(rs.getString("email"));
        m.setTel(rs.getString("tel"));
        m.setRegdate(rs.getString("regdate"));
        m.setPoint(rs.getInt("point"));
        memList.add(m);
    }

    pstmt.close();
    sql="select * from weekcrew order by wid desc";
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

        .contents { clear:both; min-height:1800px;
            background-image: url("../images/bk.jpg");
            background-repeat: no-repeat; background-position:center -250px; height: 1400px; }
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
            border-top:1px solid #8CC63E; border-bottom:1px solid #8CC63E;
            background-color: #8CC63E; color:#fff; }
        .tb1 td {line-height:32px;
            border-bottom:1px solid #8CC63E;
            border-top:1px solid #8CC63E; }

        .tb1 .item1 { width:10%; text-align: center; }
        .tb1 .item2 { width:10%; text-align: center; max-width: 50px; overflow: hidden;}
        .tb1 .item3 { width:10%; text-align: center; }
        .tb1 .item4 { width:20%; text-align: center; }
        .tb1 .item5 { width:20%; text-align: center; }
        .tb1 .item6 { width:20%; text-align: center; }
        .tb1 .item7 { width:20%; text-align: center; }

        .tb1 .item8 { width:5%; text-align: center;  max-width: 100px;
            padding: 0 20px;
            overflow: hidden;}
        .tb1 .item9 { width:15%; text-align: center;
            max-width: 150px;
            padding: 0 20px;
            overflow: hidden;}
        .tb1 .item10 { width:40%; text-align: center;
            overflow: hidden;
            max-width: 200px;}
        .tb1 .item11 { width:40%; text-align: center;
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
            color: #8CC63E;}
    </style>

    <link rel="stylesheet" href="../ft.css">
    <style>
        .btn_group { clear:both; width:800px; margin:20px auto; }
        .btn_group:after { content:""; display:block; width:100%; clear: both; }
        .btn_group p {text-align: center;   line-height:3.6; }
    </style>

</head>
<body>
<div class="container">
    <div class="wrap">
        <header class="hd" id="hd">
            <%@ include file="../header.jsp" %>
        </header>
        <div class="contents" id="contents">
            <div class="breadcrumb">
                <p><a href="">HOME</a> &gt; <span>관리자 페이지</span></p>
            </div>
            <section class="page" id="page1">
                <div class="page_wrap">
                    <h2 class="page_tit">관리자 페이지</h2>
                    <div class="member">
                        <h3 class="mem">회원 정보</h3>
                        <table class="tb1" id="myTable">
                            <thead>
                            <tr>
                                <th class="item1">아이디</th>
                                <th class="item2">비밀번호</th>
                                <th class="item3">이름</th>
                                <th class="item4">전화번호</th>
                                <th class="item5">이메일</th>
                                <th class="item6">가입일자</th>
                                <th class="item7">점수</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
                                for (Member m : memList) {
                                    Date d = ymd.parse(m.getRegdate()); //날짜데이터로 변경
                                    String date = ymd.format(d); //형식을 포함한 문자열로 변경
                            %>
                            <tr>
                                <td class="item1"><%=m.getId() %></td>
                                <td class="item2"><%=m.getPw().substring(0,2) %>
                                    <%
                                        for (int i=0; i<m.getPw().length()-2; i++) {
                                            out.print("*");
                                        }
                                    %>
                                </td>
                                <td class="item3"><%=m.getName() %></td>
                                <td class="item4"><%=m.getTel() %></td>
                                <td class="item5"><%=m.getEmail() %></td>
                                <td class="item6"><%=date %></td>
                                <td class="item7"><%=m.getPoint()%></td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                    <div class="weekcrew">
                        <h3 class="wc">윜크루 지원 현황</h3>
                        <table class="tb1" id="myTable2">
                            <thead>
                            <tr>
                                <th class="item8">이름</th>
                                <th class="item9">이메일</th>
                                <th class="item10">지원 문항 1</th>
                                <th class="item11">지원 문항 2</th>
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
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
        </div>
    </div>
<%@ include file="../footer.jsp" %>
</div>
</body>
</html>