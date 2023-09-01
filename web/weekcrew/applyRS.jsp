<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>윜크루 되면</title>

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
        .wrap { background-color: #ffffff; min-height: 100vh; }
        .contents { clear:both; min-height:460px;}
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 460px; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: 460px; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:260px; color:#8CC63E;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }

        .tb1 { width:800px; margin:50px auto; }
        .tb1 th { width:150px; line-height:32px; padding-top:8px; padding-bottom:8px;
            border-top:1px solid #333; border-bottom:1px solid #333;
            background-color:deepskyblue; color:#fff; }
        .tb1 td { width:650px; line-height:32px; padding-top:8px; padding-bottom:8px;
            border-bottom:1px solid #333;
            padding-left: 14px; border-top:1px solid #333; }

        .indata { display:inline-block; width:600px; height: 48px; line-height: 48px;
            padding:14px; font-size:18px; }
        .indata2 { width: 600px; padding: 14px; font-size:18px; }
        .btn { margin-left: 41%; }
        .btn .inbtn { display:block;  border-radius:100px;
            width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #8CC63E; color:#fff; font-size: 18px; }
    </style>

    <link rel="stylesheet" href="../ft.css">
    <style>
        .btn_group { clear:both; width:800px; margin:20px auto; }
        .btn_group:after { content:""; display:block; width:100%; clear: both; }
        .btn_group p {text-align: center;   line-height:3.6; }
    </style>
</head>
<body>
<div class="wrap">
    <div class="contents" id="contents">
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">윜크루 지원 완료!</h2>
                <div class="btn">
                    <a href="/" class="inbtn">메인으로</a>
                </div>
            </div>
        </section>
    </div>
</div>
</body>
</html>
