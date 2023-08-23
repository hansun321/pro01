<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.kiwe.dto.*" %>
<%@ page import="com.kiwe.db.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
    int bno = Integer.parseInt(request.getParameter("bno"));
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    int mode = Integer.parseInt(request.getParameter("mode"));

    Connection conn = null;
    PreparedStatement pstmt = null;
    int cnt=0;
    System.out.println(mode);

    DBC con = new MariaDBCon();
    conn = con.connect();
    if (conn != null) {
        System.out.println("DB 연결 성공");
    }

    String sql = "update board set title=?, content=? where bno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setInt(3, bno);
    cnt = pstmt.executeUpdate();

    if ( cnt>0){
        if (mode==0) {
            response.sendRedirect("/member/admin/adminBoard.jsp");
        } else {
            response.sendRedirect("/board/boardList.jsp");
        }
    } else {
        response.sendRedirect("/board/updateBoard.jsp?=bno"+bno);
    }
    con.close( pstmt, conn);
%>