<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.kiwe.db.*" %>
<%@ page import="com.kiwe.dto.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");

    int mno = Integer.parseInt(request.getParameter("mno"));

    Connection conn = null;
    PreparedStatement pstmt = null;

    DBC con = new MariaDBCon();
    conn = con.connect();
    if (conn != null) {
        System.out.println("DB 연결 성공");
    }

    String sql = "delete from masscom where mno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, mno);
    int cnt = pstmt.executeUpdate();

    if ( cnt >0 ){
        out.println("<script>alert('기사 삭제 성공.');");
        response.sendRedirect("/member/admin/adminMasscom.jsp");
    } else {
        out.println("<script>alert('기사 삭제 실패.');");
        response.sendRedirect("/member/admin/adminMasscom.jsp");
    }

    con.close(pstmt,conn);

%>