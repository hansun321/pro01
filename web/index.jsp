<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>키위(kiwe)</title>
    <%@ include file="head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="google.css">
    <link rel="stylesheet" href="fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="common.css">
    <link rel="stylesheet" href="hd.css">
    <style>
        /* 본문 영역 스타일 */.contents {
            clear: both;
        }

        .contents::after {
            content: "";
            clear: both;
            display: block;
            width: 100%;
        }

        .vs {
            clear: both;
            width: 100%;
            min-height: 600px;
            position: relative;
            overflow: hidden;
        }

        .img_box {
            position: relative;
            width: 100%;
            height: 600px;
            overflow: hidden;
        }

        .img_box li {
            visibility: hidden;
            opacity: 0;
            transition-duration: 0.7s;
            transition-delay: 0.1s;
            width: 100%;
            height: 600px;
        }

        .img_box li .bg_box {
            margin-top: 40px;
            width: 100vw;
            height: 600px;
            background-repeat: no-repeat;
            background-position: center center;
            background-size: cover;
            position: absolute;
            left: 0;
            top: 0;
            z-index: 5;
        }

        .img_box li.active .bg_box {
            z-index: 6;
        }

        .img_box li.item1 .bg_box {
            background-image: url("./images/girls.jpg");
        }

        .img_box li.item2 .bg_box {
            background-image: url("./images/mom.jpg");
        }

        .img_box li .vs_tit1 {
            color: white;
            position: absolute;
            top: 180px;
            left: 100px;
            z-index: 10;
            font-weight: 300;
            font-size: 60px;
            line-height: 1.3;
            text-align: left;
        }

        .img_box li .vs_tit2 {
            color:white;
            position: absolute;
            top: 180px;
            right: 100px;
            z-index: 10;
            font-weight: 300;
            font-size: 60px;
            line-height: 1.3;
            text-align: right;
        }

        .scroll_button img {
            width: 100%;
            height: 60px;
            object-fit: contain;
        }

        .img_box li .vs_tit strong {
            font-weight: 500;
        }

        .img_box li.active {
            visibility: visible;
            opacity: 1;
        }

        .btn_box li .vs_btn {
            margin-top: -50px;
            display: block;
            width: 12px;
            height: 12px;
            background-color: rgba(255, 255, 255, 0.8);
            border: 2px solid #fff;
            position: absolute;
            top: 100px;
            left: 100px;
            z-index: 14;
            cursor: pointer;
            border-radius: 50%;
        }

        .btn_box li.item2 .vs_btn {
            left: 132px;
        }

        .btn_box li.active .vs_btn {
            background-color: #fff;
            border: 2px solid #333;
        }

        .vs_ra {
            display: none;
        }

        .play_btn {
            margin-top: -60px;
            display: block;
            width: 50px;
            height: 55px;
            position: absolute;
            top: 98px;
            left: 164px;
            z-index: 14;
            cursor: pointer;
            color: #fff;
            border: 0;
            background-color: transparent;
            font-weight: 900;
        }

        .play_btn:after {
            content: "| |";
        }

        .play_btn.active:after {
            content: "▶";
        }

        .page::after {
            content: "";
            display: block;
            width: 100%;
            clear: both;
        }

        .pic_lst li {
            width: 280px;
            margin-right: 26px;
            height: 400px;
            float: left;
            background-repeat: no-repeat;
            background-position: center center;
            filter: brightness(90%);
            margin-top: 30px;
            transition: 0.4s;
            box-shadow: 12px 12px 12px #999;
            overflow: hidden;
        }

        .pic_lst li:hover {
            filter: brightness(140%);
            margin-top: -10px;
        }

        .pic_lst li a {
            display: block;
            width: 256px;
            height: 376px;
            margin: 11px;
            border: 1px solid #fff;
            color: #fff;
        }

        .pic_lst li:last-child {
            margin-right: 0;
        }

        .pic_lst li.item1 {
            background-image: url("./images/img_social_main01.jpg");
        }

        .pic_lst li.item2 {
            background-image: url("./images/img_social_main02.jpg");
        }

        .pic_lst li.item3 {
            background-image: url("./images/img_social_main03.jpg");
        }

        .pic_lst li.item4 {
            background-image: url("./images/img_social_main04.jpg");
        }

        .pic_content img {
            max-width: 100%;
            border-radius: 10px;
        }

        .pic_lst li:hover a .pic_arrow {
            margin-left: 20px;
        }

        .pic_arrow::after {
            content: "";
            display: block;
            width: 10px;
            height: 10px;
            position: absolute;
            right: 0;
            top: 0;
            border-bottom: 1px solid #fff;
            transform-origin: 100% 100%;
            transform: rotate(45deg);
            display: none;
        }

        .pic_lst li:hover a .pic_arrow::after {
            display: block;
        }

        #page2 .page_wrap {
            width: 100%;
        }

        .cate_lst li {
            width: 380px;
            margin: 30px;
        }

        .thumb_list li {
            width: calc(25% - 20px);
            margin: 10px;
            padding: 20px;
            background-color: #f0f0f0;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .ico_box .ico {
            display: inline-block;
            width: 30px;
            height: 30px;
            background-color: #333;
            color: #fff;
            text-align: center;
            line-height: 30px;
            border-radius: 50%;
            margin-right: 10px;
            font-size: 20px;
        }

        .thumb_date {
            display: inline-block;
            font-size: 14px;
            color: #888;
        }

        .ico_box .ico_text {
            margin-left: 70px;
            line-height: 25px;
            display: inline-block;
            vertical-align: top;
            max-width: calc(100% - 40px); /* Adjust the width based on the icon width and margin */
            font-size: 18px;
            color: #333;
        }

        .cate_lst li {
            margin-left: 14px;
            margin-right: 14px;
            padding-top: 32px;
            height: 270px;
        }

        .cate_tit li a {
            display: block;
        }

        .sl-btn-box .btn {
            display: block;
            width: 48px;
            height: 48px;
            font-size: 32px;
            color: #fff;
            background-color: #333;
            text-align: center;
            line-height: 48px;
            font-weight: 700;
            cursor: pointer;
            position: absolute;
            left: 100px;
        }

        .sl-btn-box .btn.next {
            top: 100px;
        }

        .sl-btn-box .btn.prev {
            top: 148px;
        }

        /*
        추가
         */
        .main-section {
            position: relative;
            width: 100%;
        }

        .main-section__inner {
            position: relative;
            margin: 0 auto;
            width: 1440px;
            padding: 0 20px;
            box-sizing: border-box;
        }

        @media screen and (min-width: 1024px) and (max-width: 1280px) {
            .main-section__inner {
                padding-left: 1.56vw;
                padding-right: 1.56vw;
                width: auto;
            }
        }

        .main-section__2 {
            min-height: 160px;
            margin-top: 40px;
            margin-bottom: 40px;
        }

        @media screen and (min-width: 1024px) and (max-width: 1280px) {
            .main-section__2 {
                margin-top: 3.13vw;
            }
        }

        .main-section__2 .main-event__wrap {
            margin: 0 auto;
        }

        .main-section__2 .main-event__list {
            display: flex;
            justify-content: space-between;
        }

        .main-section__2 .main-event__list:after {
            content: '';
            clear: both;
            display: block;
        }

        .main-section__2 .main-event__item {
            display: block;
            opacity: 0;
            position: relative;
            -webkit-transform: translateY(100px);
            -moz-transform: translateY(100px);
            transform: translateY(100px);
            transition: all .8s ease-in-out;
            width: 440px;
            margin-left: 40px;
        }

        @media screen and (min-width: 1024px) and (max-width: 1280px) {
            .main-section__2 .main-event__item {
                width: 32.81vw;
                margin-left: 1.56vw;
            }
        }

        .main-section__2 .main-event__item:first-child {
            margin-left: 0;
        }

        .main-section__2 .main-event__link {
            z-index: 0;
            display: table;
            overflow: hidden;
            position: relative;
            top: 0;
            transition: top .3s ease-in-out;
            padding: 0 40px;
            width: 440px;
            height: 160px;
            border-radius: 30px;
            vertical-align: middle;
            box-sizing: border-box;
        }

        @media screen and (min-width: 1024px) and (max-width: 1280px) {
            .main-section__2 .main-event__link {
                padding-left: 3.13vw;
                padding-right: 3.13vw;
                width: 30.94vw;
                height: 9.38vw;
            }
        }

        .main-section__2 .main-event__link:focus, .main-section__2 .main-event__link:hover {
            top: -20px;
            box-shadow: 0px 5px 15px 5px rgba(0, 0, 0, 0.2);
        }

        @media screen and (min-width: 1024px) and (max-width: 1280px) {
            .main-section__2 .main-event__link:focus, .main-section__2 .main-event__link:hover {
                top: -1.56vw;
            }
        }

        .main-section__2 .main-event__image {
            z-index: -1;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 160px;
        }

        @media screen and (min-width: 1024px) and (max-width: 1280px) {
            .main-section__2 .main-event__image {
                height: 12.5vw;
            }
        }

        .main-section__2.active .main-event__item {
            opacity: 1;
            transform: translateY(0);
        }

        .main-section__2.active .main-event__item:nth-child(2) {
            transition-delay: .2s;
        }

        .main-section__2.active .main-event__item:nth-child(3) {
            transition-delay: .2s;
        }
    </style>
    <link rel="stylesheet" href="ft.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <figure class="vs">
            <ul class="img_box">
                <li class="item1 active">
                    <input type="radio" name="vs_ra" id="vs_ra1" class="vs_ra" checked>
                    <div class="bg_box"></div>
                    <h2 class="vs_tit1">우리 아이들의 <br> 행복한 내일을 위해<br>
                        <strong>kiwe가 <br> 끊임 없는 노력을 하겠습니다.</strong></h2>
                </li>
                <li class="item2">
                    <input type="radio" name="vs_ra" id="vs_ra2" class="vs_ra">
                    <div class="bg_box"></div>
                    <h2 class="vs_tit2">아이들의 성적으로 <br>확실하게 이어지는<br>
                        <strong>kiwe만의 맞춤형 교육으로 <br> 초대합니다!</strong>
                    </h2>
                </li>
            </ul>
            <ul class="btn_box">
                <li class="item1 active"><label for="vs_ra1" class="vs_btn"></label></li>
                <li class="item2"><label for="vs_ra2" class="vs_btn"></label></li>
            </ul>
            <button type="button" class="play_btn"></button>
        </figure>

        <script>
            $(function () {
                $(".btn_box li .vs_btn").click(function () {
                    var par = $(this).parents("li").index();
                    $(".img_box li").removeClass("active");
                    $(".img_box li").eq(par).addClass("active");
                    $(".btn_box li").removeClass("active");
                    $(".btn_box li").eq(par).addClass("active");
                });
                var sw = 1;
                var int1 = setInterval(function () {
                    if (sw == 1) {
                        autoplay(1);
                        sw = 0;
                    } else {
                        autoplay(0);
                        sw = 1;
                    }
                }, 3500);

                function autoplay(n) {
                    $(".img_box li").removeClass("active");
                    $(".img_box li").eq(n).addClass("active");
                    $(".btn_box li").removeClass("active");
                    $(".btn_box li").eq(n).addClass("active");
                }

                $(".play_btn").click(function () {
                    if ($(this).hasClass("active")) {
                        $(this).removeClass("active");
                        sw = 1;
                        int1 = setInterval(function () {
                            if (sw == 1) {
                                autoplay(1);
                                sw = 0;
                            } else {
                                autoplay(0);
                                sw = 1;
                            }
                        }, 3500);
                    } else {
                        $(this).addClass("active");
                        sw = 0;
                        clearInterval(int1);
                    }
                });
            });
        </script>
    </div>
    <section class="main-section main-section__2 active">
        <div class="main-section__inner">
            <div class="main-event__wrap">
                <ul class="main-event__list setBannerWrap">
                    <li class="main-event__item">
                        <a href="./company/company.jsp" class="main-event__link">
                            <div class="main-event__image" aria-hidden="true">
                                <img src="./images/intro.png" alt="회사소개">
                            </div>
                        </a>
                    </li><li class="main-event__item">
                    <a href="./qna/qnaList.jsp" class="main-event__link">
                        <div class="main-event__image" aria-hidden="true">
                            <img src="./images/center.png" alt="고객센터">
                        </div>
                    </a>
                </li><li class="main-event__item">
                    <a href="./employment/weekcrew.jsp" class="main-event__link">
                        <div class="main-event__image" aria-hidden="true">
                            <img src="./images/recruitment.png" alt="인재채용">
                        </div>
                    </a>
                </li></ul>
            </div>
        </div>
    </section>

</div>
<%@ include file="footer.jsp" %>
</body>
</html>