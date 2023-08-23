<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.kiwe.db.*" %>
<%
    //인코딩 및 보내온 데이터 받기
    //인코딩 3줄
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
    //데이터 받기 3개 author, title, content
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String content = request.getParameter("content");

    //db 접속
    Connection conn = null;
    PreparedStatement pstmt = null;

    DBC con = new MariaDBCon();
    conn=con.connect();
    if ( conn != null) {
        System.out.println("DB 연결 성공");
    }
    int cnt =0;

    //sql 구문 처리,,,insert,,,,,,
    String sql = "insert into board(title, content, author) values (?,?,?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setString(3, author);
    cnt=pstmt.executeUpdate();

    String script = "<script>";
    script += "history.go(-1)";
    script += "</script>";
    if (cnt >0) {
        response.sendRedirect("/board/boardList.jsp");
    } else {
        out.print(script);
    }

    con.close(pstmt,conn);
%>