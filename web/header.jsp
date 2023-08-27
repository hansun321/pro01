<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String sid = null;
    sid = (String) session.getAttribute("id");

    String path8 = request.getContextPath();
%>

<div class="hd_wrap">
    <nav class="tnb">
        <ul class="menu">
            <% if (sid != null) { %>
            <li><a href="<%=path8 %>/member/logout.jsp">로그아웃</a></li>
            <li><a href="<%=path8 %>/member/mypage.jsp">마이페이지</a></li>
            <li><a href="/contact/map.jsp">오시는길</a></li>
            <% if (sid.equals("admin")) { %>
            <li><a href="<%=path8 %>/member/admin/adminMain.jsp">관리자페이지</a></li>
            <% } %>
            <% } else { %>
            <li><a href="<%=path8 %>/member/login.jsp">로그인</a></li>
            <li><a href="<%=path8 %>/member/term.jsp">회원가입</a></li>
            <li><a href="<%=path8 %>/contact/map.jsp">오시는길</a></li>
            <li id="searchLink"><a href="<%=path8 %>/search/search.jsp">검색창</a></li>
            <% } %>
        </ul>
    </nav>
</div>
<div class="hd_wrap">
    <a href="/" class="logo">
        <img src="<%=path8 %>/images/kiwe_logo.png" alt="키위 로고">
    </a>
    <nav class="gnb">
        <ul class="menu">
            <li class="item1">
                <a href="/company/company.jsp" class="dp1">회사소개</a>
                <ul class="sub">
                    <li><a href="/company/company.jsp">'윜'이란?</a></li>
                    <li><a href="/company/company.jsp?#scroll">'윜' 스토리</a></li>
                    <li><a href="/company/contribution.jsp">사회공헌</a></li>
                </ul>
            </li>
            <li class="item2">
                <a href="/business/weekly.jsp" class="dp1">사업영역</a>
                <ul class="sub">
                    <li><a href="/business/weekly.jsp">위클리</a></li>
                    <li><a href="/business/weekend.jsp">위켄드</a></li>
                    <li><a href="/business/weekmarket.jsp">윜마켓</a></li>
                </ul>
            </li>
            <li class="item3">
                <a href="/faq/faqList.jsp" class="dp1">고객센터</a>
                <ul class="sub">
                    <li><a href="/board/boardList.jsp">공지사항</a></li>
                    <li><a href="/faq/faqList.jsp">자주하는 질문</a></li>
                    <li><a href="/qna/qnaList.jsp">1:1 문의</a></li>
                </ul>
            </li>
            <li class="item4">
                <a href="/weekcrew/apply.jsp" class="dp1">인재채용</a>
                <ul class="sub">
                    <li><a href="/weekcrew/apply.jsp">윜크루 되기</a></li>
                    <li><a href="/weekcrew/weekcrew.jsp">윜크루 되면</a></li>
                </ul>
            </li>
        </ul>
    </nav>
</div>