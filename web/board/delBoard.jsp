<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.kiwe.db.*" %>
<%@ page import="com.kiwe.dto.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");

    int bno = Integer.parseInt(request.getParameter("bno"));
    int mode = Integer.parseInt(request.getParameter("mode"));

    Connection conn = null;
    PreparedStatement pstmt = null;

    DBC con = new MariaDBCon();
    conn = con.connect();
    if (conn != null) {
        System.out.println("DB 연결 성공");
    }

    String sql = "delete from board where bno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, bno);
    int cnt = pstmt.executeUpdate();

    if ( cnt >0 ){
        if (mode==0) {
            response.sendRedirect("/board/boardList.jsp");
        } else {
            response.sendRedirect("/member/admin/adminBoard.jsp");
        }
    } else {
        response.sendRedirect("/board/getBoard.jsp?bno="+bno);
    }

    con.close(pstmt,conn);

%>