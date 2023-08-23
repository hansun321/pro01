<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.kiwe.db.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset-UTF-8");
    response.setCharacterEncoding("UTF-8");

    String title = request.getParameter("title");
    String link = request.getParameter("link");
    String resdate = request.getParameter("resdate");

    Connection conn = null;
    PreparedStatement pstmt = null;

    int cnt = 0;

    DBC con = new MariaDBCon();
    conn = con.connect();
    String sql = "insert into masscom(title, link, resdate) values(?, ?, ?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, link);
    pstmt.setString(3, resdate);
    cnt=pstmt.executeUpdate();

    String script = "<script>";
    script += "history.go(-1)";
    script += "</script>";
    if (cnt > 0) {
        response.sendRedirect("/masscom/masscomList.jsp");
    } else {
        out.print(script);
    }

    con.close(pstmt, conn);
%>