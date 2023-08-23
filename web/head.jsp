<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Author" content="천재교육 콘텐츠 제작팀">
<meta http-equiv="Publisher" content="천재교육 김기태">
<meta http-equiv="Copyright" content="copyright@chunjae.co.kr">
<title>천재교육</title>

<!-- 검색엔진 최적화(SEO) -->
<meta name="Subject" content="천재교육, 천재IT교육센터">
<meta name="Keywords" content="천재교육, 천재 IT, 교육 교재, 교과서, 스마트 교육">
<meta name="Description" content="천재교육은 교과서 제작, 교육 교재 제작, 초등, 중등, 고등 교육에 대한 교재와 교육을 실시하는 기관입니다.">
<!-- <meta name="Robots" content="noindex, nofllow"> -->
<meta name="robots" content="index,follow">

<!-- 오픈 그래프(Open graph)-->
<meta property="og:type" content="website">
<meta property="og:title" content="천재교육">
<meta property="og:description" content="앞선 생각으로 더 큰 미래의 교육을 준비하는 기업">
<meta property="og:image" content="<%=path %>/images/chunjae_logo.png">
<meta property="og:url" content="<%=path %>">

<!-- 트위터 -->
<meta name="twitter:card" content="picture">
<meta name="twitter:title" content="천재교육">
<meta name="twitter:description" content="앞선 생각으로 더 큰 미래의 교육을 준비하는 기업">
<meta name="twitter:image" content="https://kktlove.github.io/web01/images/chunjae_logo.png">

<!-- 모바일 앱의 iOS 인 경우
<meta property="al:ios:url" content="ios 앱 url">
<meta property="al:ios:app_store_id" content="ios 앱스토어 ID" />
<meta property="al:ios:app_name" content="ios 앱 이름" />
-->

<!-- 모바일 앱의 Android 인 경우
<meta property="al:android:url" content="안드로이드 앱 URL" />
<meta property="al:android:app_name" content="안드로이드 앱 이름" />
<meta property="al:android:package" content="안드로이드 패키지 이름" />
<meta property="al:web:url" content="안드로이드 앱 URL" />
-->

<!-- 파비콘 설정 -->
<!-- 16x16, 24x24, 32x32, 48x48, 64x64, 96x96, 114x114, 128x128, 256x256 등을 활용-->
<!-- 표준 파비콘 -->
<link rel="shortcut icon" href="<%=path %>/images/favicon.ico">
<!-- 애플 계열 모바일 -->
<link rel="apple-touch-icon-precomposed" href="<%=path %>/images/apple-touch-icon.png">
<!-- IE 계열 브라우저 -->
<meta name="msapplication-TileColor" content="#FFFFFF">
<meta name="msapplication-TileImage" content="<%=path %>/images/logo_48.png">
<!-- 파이어폭스, 오페라, 또는 구형 크롬/사파리 -->
<link rel="icon" href="<%=path %>/images/logo_16.png" sizes="16x16">
<link rel="icon" href="<%=path %>/images/logo_32.png" sizes="32x32">
<link rel="icon" href="<%=path %>/images/logo_48.png" sizes="48x48">
<link rel="icon" href="<%=path %>/images/logo_64.png" sizes="64x64">
<script>
    document.oncontextmenu = function() { return false; }
    document.ondragstart = function() { return false; }
    document.onselectstart = function() { return false; }
    //document.onkeydown = function() { return false; }
</script>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
%>




<%--<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>--%>
<%--<%--%>
<%--    String scheme = request.getScheme();       // http or https--%>
<%--    String serverName = request.getServerName(); // example.com or any other domain--%>
<%--    int serverPort = request.getServerPort();   // Port number--%>

<%--    String path = scheme + "://" + serverName;--%>
<%--    if ((scheme.equals("http") && serverPort != 80) || (scheme.equals("https") && serverPort != 443)) {--%>
<%--        path += ":" + serverPort;--%>
<%--    }--%>
<%--%>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>윜(Week)</title>--%>
<%--    <meta http-equiv="X-UA-Compatible" content="IE=edge">--%>
<%--    <meta http-equiv="Author" content="Week 콘텐츠 제작팀">--%>
<%--    <meta http-equiv="Publisher" content="Week 교육센터">--%>
<%--    <meta http-equiv="Copyright" content="copyright@week.co.kr">--%>

<%--    <!-- 검색엔진 최적화(SEO) -->--%>
<%--    <meta name="Subject" content="Week">--%>
<%--    <meta name="Keywords" content="Week, 교육 교재, 교과서, 스마트 교육">--%>
<%--    <meta name="Description" content="Week는 초등, 중등, 고등 교육에 대한 교재와 교육을 실시하는 기관입니다.">--%>
<%--    <!-- <meta name="Robots" content="noindex, nofllow"> -->--%>
<%--    <meta name="robots" content="index,follow">--%>

<%--    <!-- 오픈 그래프(Open graph)-->--%>
<%--    <meta property="og:type" content="website">--%>
<%--    <meta property="og:title" content="Week">--%>
<%--    <meta property="og:description" content="앞선 생각으로 더 큰 미래의 교육을 준비하는 기업">--%>
<%--    <meta property="og:image" content="<%=path %>/images/weeklogo.png">--%>
<%--    <meta property="og:url" content="<%=path %>">--%>

<%--    <!-- 트위터 -->--%>
<%--    <meta name="twitter:card" content="picture">--%>
<%--    <meta name="twitter:title" content="Week">--%>
<%--    <meta name="twitter:description" content="앞선 생각으로 더 큰 미래의 교육을 준비하는 기업">--%>
<%--    <meta name="twitter:image" content="https://kktlove.github.io/web01/images/chunjae_logo.png">--%>

<%--    <!-- 모바일 앱의 iOS 인 경우--%>
<%--    <meta property="al:ios:url" content="ios 앱 url">--%>
<%--    <meta property="al:ios:app_store_id" content="ios 앱스토어 ID" />--%>
<%--    <meta property="al:ios:app_name" content="ios 앱 이름" />--%>
<%--    -->--%>

<%--    <!-- 모바일 앱의 Android 인 경우--%>
<%--    <meta property="al:android:url" content="안드로이드 앱 URL" />--%>
<%--    <meta property="al:android:app_name" content="안드로이드 앱 이름" />--%>
<%--    <meta property="al:android:package" content="안드로이드 패키지 이름" />--%>
<%--    <meta property="al:web:url" content="안드로이드 앱 URL" />--%>
<%--    -->--%>

<%--    <!-- 파비콘 설정 -->--%>
<%--    <!-- 16x16, 24x24, 32x32, 48x48, 64x64, 96x96, 114x114, 128x128, 256x256 등을 활용-->--%>
<%--    <!-- 표준 파비콘 -->--%>
<%--    <link rel="shortcut icon" href="<%=path %>/images/week_korean.png">--%>
<%--    <!-- 애플 계열 모바일 -->--%>
<%--    <link rel="apple-touch-icon-precomposed" href="<%=path %>/images/logo_64.png">--%>
<%--    <!-- IE 계열 브라우저 -->--%>
<%--    <meta name="msapplication-TileColor" content="#FFFFFF">--%>
<%--    <meta name="msapplication-TileImage" content="<%=path %>/images/logo_48.png">--%>
<%--    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">--%>

<%--    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->--%>
<%--    <link rel="stylesheet" href="<%=path %>/google.css">--%>
<%--    <link rel="stylesheet" href="<%=path %>/fonts.css">--%>

<%--    <!-- 필요한 플러그인 연결 -->--%>
<%--    <script src="https://code.jquery.com/jquery-latest.js"></script>--%>
<%--    <link rel="stylesheet" href="<%=path %>/common.css">--%>
<%--    <link rel="stylesheet" href="<%=path %>/hd.css">--%>
<%--    <link rel="stylesheet" href="<%=path %>/ft.css">--%>
<%--</head>--%>

<%--<!-- 파이어폭스, 오페라, 또는 구형 크롬/사파리 -->--%>
<%--<link rel="icon" href="<%=path %>/images/logo_16.png" sizes="16x16">--%>
<%--<link rel="icon" href="<%=path %>/images/logo_32.png" sizes="32x32">--%>
<%--<link rel="icon" href="<%=path %>/images/logo_48.png" sizes="48x48">--%>
<%--<link rel="icon" href="<%=path %>/images/logo_64.png" sizes="64x64">--%>
<%--<script>--%>
<%--document.oncontextmenu = function() { return false; }--%>
<%--document.ondragstart = function() { return false; }--%>
<%--document.onselectstart = function() { return false; }--%>
<%--//document.onkeydown = function() { return false; }--%>
<%--</script>--%>
<%--<%@ include file="encoding.jsp" %>--%>
<%--<%@ include file="header.jsp" %>--%>

