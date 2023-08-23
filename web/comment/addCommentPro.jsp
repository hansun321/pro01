<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 라이브러리 로딩 --%>
<%@ page import="java.sql.*" %>
<%@ page import="com.kiwe.db.*" %>
<%@ include file="../encoding.jsp" %>
<%
    //2. 보내온 데이터 받기
    int qno = Integer.parseInt(request.getParameter("qno"));
    String author = (String)session.getAttribute("id");
    String content = request.getParameter("content");

    //3. DB 연결
    Connection conn = null;
    PreparedStatement pstmt = null;
    DBC con = new MariaDBCon();
    conn = con.connect();
    //4. sql 실행 및 실행결과 리턴
    String sql = "insert into comment(qno, author, content) values(?,?,?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, qno);
    pstmt.setString(2, author);
    pstmt.setString(3, content);
    int cnt = pstmt.executeUpdate();
    if (cnt > 0) {
        response.sendRedirect("/qna/getQna.jsp?qno="+qno);
    } else {
        //response.sendRedirect("/qna/updateQna.jsp?qno="+qno);
        out.println("<script>alert('글 수정 실패');</script>");
        out.println("<script>history.go(-1);</script>");
    }
    con.close(pstmt, conn);
%>