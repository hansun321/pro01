<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>윜(Week)</title>
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
        /* 본문 영역 스타일 */
        .contents {
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
            background-image: url("./images/boy.jpg");
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


        .parent-container {
            display: flex;
            justify-content: center;
        }


        .scroll_button_wrap {
            margin-top: 40px;
            display:flex;
            justify-content:center;
            width:100%;
            align-items : center;
        }

        .scroll_button {
            gap: 10px;
            border: 2px solid #996633;
            border-radius: 20px;
            padding: 10px 20px;
            background-color: #fffcf2;
            height: 200px;
            width: 40%;
        }
        .scroll_button:nth-child(1){
            margin-right: 10px;
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

        .vs_tit {
            font-size: 60px;
            color: #fff;
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

        .page {
            clear: both;
            width: 100vw;
            position: relative;
        }

        .page::after {
            content: "";
            display: block;
            width: 100%;
            clear: both;
        }

        .page_wrap {
            clear: both;
            width: 1200px;
            height: auto;
            margin: 0 auto;
        }

        .page_tit {
            font-size: 55px;
            text-align: center;
            padding-top: 1.75em;
        }

        #page1 {
            background-position: 15vw 63vh;
            background-repeat: no-repeat;
        }

        .pic_lst {
            clear: both;
            width: 1200px;
            margin: 60px auto;
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

        .pic_lst {
            display: flex;
            justify-content: space-between; /* Distribute items evenly */
            flex-wrap: wrap; /* Allow items to wrap */
        }

        .pic_item1,
        .pic_item {
            flex: 1 1 calc(50% - 10px); /* Divide into two columns with a bit of margin */
            margin-bottom: 20px; /* Add some spacing between items */
        }

        .pic_content {
            height: 450px;
            width: 83%;
            border: 4px solid #996633;
            border-radius: 10px;
            padding: 10px;
            text-align: center;
        }

        .pic_content img {
            max-width: 100%;
            border-radius: 10px;
        }

        .pic_tit {
            margin-top: 10px;
        }

        .additional_text {
            text-align: center;
            margin-top: -22px;
            font-size: 25px;
        }

        .pic_com {
            padding-left: 20px;
            padding-top: 20px;
            font-size: 17px;
        }

        .pic_tit {
            padding-left: 20px;
            padding-top: 20px;
            font-size: 18px;
        }

        .pic_arrow {
            display: block;
            width: 110px;
            height: 10px;
            border-bottom: 1px solid #fff;
            margin-top: 20px;
            margin-left: -12px;
            transition: 0.4s;
            position: relative;
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

        .slide_box::-webkit-scrollbar {
            display: none;
        }

        .slide_box {
            clear: both;
            width: calc(100vw - 350px);
            height: 400px;
            margin-left: 350px;
            -ms-overflow-style: none;
            scrollbar-width: none;
        }

        .page_com {
            line-height: 40px;
            font-size: 25px;
            text-align: center;
            padding-bottom: 30px;
            padding-top: 30px;
        }

        .circle-box {
            display: flex;
            line-height: 30px;
            text-align: center;
            position: relative;
            width: 380px; /* 원하는 크기로 조정 */
            height: 220px; /* 원하는 크기로 조정 */
            margin: 0 auto;
            border-radius: 50%; /* 동그라미 모양 */
            background-color: #F5DA81;
            color: white;
            overflow: hidden;
            align-items: center;
            justify-content: center;
        }

        .cate_lst {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            margin-top: 20px; /* 원하는 간격을 설정하세요. */
        }

        .cate_lst li {
            width: 380px;
            margin: 30px;
        }


        /*.card_lst {*/
        /*    width: 4000px;*/
        /*}*/

        /*.card_lst > li {*/
        /*    width: 320px;*/
        /*    height: 400px;*/
        /*    float: left;*/
        /*    margin-right: 50px;*/
        /*    box-shadow: 5px 5px 30px #888;*/
        /*    border-radius: 6px;*/
        /*    overflow: hidden;*/
        /*}*/

        /*.card_lst > li:first-child {*/
        /*    margin-left: 30px;*/
        /*}*/

        /*.card_lst li .thumb_box {*/
        /*    width: 320px;*/
        /*    height: 210px;*/
        /*    background-repeat: no-repeat;*/
        /*    background-position: center center;*/
        /*    background-size: cover;*/
        /*}*/

        /*.card_lst li a {*/
        /*    display: block;*/
        /*    width: 320px;*/
        /*    height: 220px;*/
        /*}*/

        /*.card_lst li.item2 .thumb_box {*/
        /*    background-image: url("./images/thumb1.png");*/
        /*}*/

        /*.card_lst li.item3 .thumb_box {*/
        /*    background-image: url("./images/thumb2.png");*/
        /*}*/

        /*.card_lst li.item4 .thumb_box {*/
        /*    background-image: url("./images/thumb3.png");*/
        /*}*/

        /*.card_lst li.item5 .thumb_box {*/
        /*    background-image: url("./images/thumb4.png");*/
        /*}*/

        /*.card_lst li.item6 .thumb_box {*/
        /*    background-image: url("./images/thumb5.png");*/
        /*}*/

        /*.card_lst li.item7 .thumb_box {*/
        /*    background-image: url("./images/thumb6.png");*/
        /*}*/

        /*.thumb_tit {*/
        /*    margin-left: 220px;*/
        /*    height: 42px;*/
        /*    box-sizing: border-box;*/
        /*    font-size: 25px;*/
        /*    color: #333;*/
        /*    padding: 14px;*/
        /*    padding-bottom: 0;*/
        /*    text-overflow: ellipsis;*/
        /*    overflow: hidden;*/
        /*    display: -webkit-box;*/
        /*    -webkit-box-orient: vertical;*/
        /*    -webkit-line-clamp: 2;*/
        /*    margin-bottom: 60px;*/
        /*}*/

        /*.ico_box {*/
        /*    height: 53px;*/
        /*    clear: both;*/
        /*    margin-top: 30px;*/
        /*    border-top: 1px solid #eee;*/
        /*    padding-top: 30px;*/
        /*}*/

        /*.ico {*/
        /*    display: block;*/
        /*    width: 30px;*/
        /*    height: 30px;*/
        /*    background-repeat: no-repeat;*/
        /*    float: left;*/
        /*    margin-left: 14px;*/
        /*}*/

        /*.ico.item1 {*/
        /*    background-position: -71px -60px;*/
        /*}*/

        /*.ico.item2 {*/
        /*    background-position: -142px -121px;*/
        /*}*/


        .thumb_list {
            display: flex;
            flex-wrap: wrap;
            list-style: none;
            padding: 0;
            margin-left: 250px;
        }

        .thumb_list li {
            width: calc(25% - 20px);
            margin: 10px;
            padding: 20px;
            background-color: #f0f0f0;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .thumb_tit {
            text-align: center;
            font-size: 22px;
            margin-top: 15px;
        }

        .ico_box {
            margin-top: 15px;
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


        .thumb_date {
            display: inline-block;
            font-size: 14px;
            color: #888;
        }


        .cate_tit {
            text-align: center;
            padding-left: 32px;
            font-size: 45px;
            line-height: 2;
            padding-top: 24px;
            padding-bottom: 24px;
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

        .bd_content {
            width: auto;
            padding-right: 24px;
        }

        .bd_date {
            padding-top: 18px;
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
                        <strong>Week가 <br> 끊임 없는 노력을 하겠습니다.</strong></h2>
                </li>
                <li class="item2">
                    <input type="radio" name="vs_ra" id="vs_ra2" class="vs_ra">
                    <div class="bg_box"></div>
                    <h2 class="vs_tit2">아이들의 성적으로 <br>확실하게 이어지는<br>
                        <strong>Week만의 맞춤형 교육으로 <br> 초대합니다!</strong>
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

        <div>
            <h2 class="scroll_button_wrap">
                <button type="button" class="scroll_button" data-target="page1">
                    <img src="images/weekly.png?v=1" alt="weeklyLogo">
                    <p>바로가기</p>
                </button>
                <button type="button" class="scroll_button" data-target="page2">
                    <img src="images/weekend.png?v=1" alt="weekendLogo">
                    <p>바로가기</p>
                </button>
            </h2>
        </div>


        <section class="page" id="page1">
            <h2 class="page_tit">&quot;Week는 지금&quot;</h2>
            <div class="pic_lst">
                <div class="pic_item1">
                    <a href="">
                        <div class="pic_content">
                            <img src="images/book.jpg" alt="도서">
                            <p class="pic_com">초등 교육을 위한 매거진 행복한 교육 8월호</p>
                            <h3 class="pic_tit">자녀에게 어떤 책이 도움이 될까? 부모와 아이와 함께 읽어요!</h3>
                        </div>
                    </a>
                </div>

                <div class="pic_item">
                    <a href="">
                        <div class="pic_content">
                            <img src="images/game.jpg" alt="">
                            <p class="pic_com">2학기 준비, 어떻게 하고 계세요?</p>
                            <h3 class="pic_tit">Week 교육과 함께! 게임으로 즐겁게! <br></h3>
                        </div>
                    </a>
                </div>
            </div>
            <p class="additional_text">Week의 꿀팁 가득한 SNS 콘텐츠를 소개합니다!</p>
            <div class="pic_lst">
                <div class="pic_item">
                    <a href="">
                        <div class="pic_content">
                            <img src="images/thinkkid.jpg" alt="">
                            <p class="pic_com">5~6세 학부모님 주목해주세요!</p>
                            <h3 class="pic_tit">유아기에 생기는 친구가 궁금하다면?</h3>
                        </div>
                    </a>
                </div>
                <div class="pic_item">
                    <a href="">
                        <div class="pic_content">
                            <img src="images/textbook.jpg" alt="평가문제집">
                            <p class="pic_com">Week 자습서 & 평가문제집 신간 출시!</p>
                            <h3 class="pic_tit">주요과목부터 예체능까지!, Week 자습서로 끝내자!<br></h3>
                        </div>
                    </a>
                </div>
            </div>
        </section>
        <section class="page" id="page2">
            <div class="page_wrap">
                <h2 class="page_tit">사회공헌</h2>
                <p class="page_com">Week는 기업과 사회, 환경이 공존하는 <br> 아름다운 세상을 꿈꾸고 있습니다!</p>
                <ul class="thumb_list">
                    <li class="item2">
                        <a href="">
                            <div class="thumb_box"></div>
                            <p class="thumb_tit">학습봉사</p>
                            <div class="ico_box">
                                <span class="ico_text">직접 아이들을 지도하고 상호소통하며 <br> 용기와 희망을 전하고 있습니다.</span>
                            </div>
                        </a>
                    </li>
                    <li class="item3">
                        <a href="">
                            <div class="thumb_box"></div>
                            <p class="thumb_tit">지역사회후원</p>
                            <div class="ico_box">
                                <span class="ico_text">Week의 강력한 의지와 사명감으로 <br> 따뜻한 나눔을 실천하고 있습니다.</span>
                            </div>
                        </a>
                    </li>
                    <li class="item4">
                        <a href="">
                            <div class="thumb_box"></div>
                            <p class="thumb_tit">학회지원</p>
                            <div class="ico_box">
                                <span class="ico_text">대한민국 미래 교육의 발전을 위해 <br> 최선의 역할을 다하겠습니다.</span>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>

            <br><br><br><br><br>

            <%--            <div class="slide_box">--%>
            <%--                <ul class="card_lst">--%>
            <%--                    <li class="item1">--%>
            <h3 class="cate_tit">언론보도</h3>
            <p class="additional_text">최신 소식을 통해 Week의 보도자료를 소개합니다!</p>
            <ul class="cate_lst">
                <li>
                    <div class="circle-box">
                        <a href="">
                            <p class="bd_content">운필력 키우는 한글 글쓰기, <br> 유아학습지로 창의력과 표현력을 기른다.</p>
                            <p class="bd_date">2023-07-13</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="circle-box">
                        <a href="">
                            <p class="bd_content">Week, <br> 스마트 더블케어 "윜"패스 출시</p>
                            <p class="bd_date">2023-07-18</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="circle-box">
                        <a href="">
                            <p class="bd_content">엄마들의 만국 공통 걱정은? <br> 행복한 교육에서 확인</p>
                            <p class="bd_date">2023-07-20</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="circle-box">
                        <a href="">
                            <p class="bd_content">즐거운 방학! <br> 어떻게 보내야할까?</p>
                            <p class="bd_date">2023-07-30</p>
                        </a>
                    </div>
                </li>
            </ul>
        </section>
        <footer class="ft" id="ft">
            <%@ include file="footer.jsp" %>
        </footer>
    </div>
</div>
</body>
</html>


<%--<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>--%>
<%--<%@ include file="head.jsp" %>--%>
<%--<div class="contents" id="contents">--%>
<%--    <figure class="vs">--%>
<%--        <ul class="img_box">--%>
<%--            <li class="item1 active">--%>
<%--                <input type="radio" name="vs_ra" id="vs_ra1" class="vs_ra" checked>--%>
<%--                <div class="bg_box"></div>--%>
<%--                <h2 class="vs_tit1">우리 아이들의 <br> 행복한 내일을 위해<br>--%>
<%--                    <strong>Week가 <br> 끊임 없는 노력을 하겠습니다.</strong></h2>--%>
<%--            </li>--%>
<%--            <li class="item2">--%>
<%--                <input type="radio" name="vs_ra" id="vs_ra2" class="vs_ra">--%>
<%--                <div class="bg_box"></div>--%>
<%--                <h2 class="vs_tit2">아이들의 성적으로 <br>확실하게 이어지는<br>--%>
<%--                    <strong>Week만의 맞춤형 교육으로 <br> 초대합니다!</strong>--%>
<%--                </h2>--%>
<%--            </li>--%>
<%--        </ul>--%>
<%--        <ul class="btn_box">--%>
<%--            <li class="item1 active"><label for="vs_ra1" class="vs_btn"></label></li>--%>
<%--            <li class="item2"><label for="vs_ra2" class="vs_btn"></label></li>--%>
<%--        </ul>--%>
<%--        <button type="button" class="play_btn"></button>--%>
<%--    </figure>--%>

<%--    <script>--%>
<%--        $(function () {--%>
<%--            $(".btn_box li .vs_btn").click(function () {--%>
<%--                var par = $(this).parents("li").index();--%>
<%--                $(".img_box li").removeClass("active");--%>
<%--                $(".img_box li").eq(par).addClass("active");--%>
<%--                $(".btn_box li").removeClass("active");--%>
<%--                $(".btn_box li").eq(par).addClass("active");--%>
<%--            });--%>
<%--            var sw = 1;--%>
<%--            var int1 = setInterval(function () {--%>
<%--                if (sw == 1) {--%>
<%--                    autoplay(1);--%>
<%--                    sw = 0;--%>
<%--                } else {--%>
<%--                    autoplay(0);--%>
<%--                    sw = 1;--%>
<%--                }--%>
<%--            }, 3500);--%>

<%--            function autoplay(n) {--%>
<%--                $(".img_box li").removeClass("active");--%>
<%--                $(".img_box li").eq(n).addClass("active");--%>
<%--                $(".btn_box li").removeClass("active");--%>
<%--                $(".btn_box li").eq(n).addClass("active");--%>
<%--            }--%>

<%--            $(".play_btn").click(function () {--%>
<%--                if ($(this).hasClass("active")) {--%>
<%--                    $(this).removeClass("active");--%>
<%--                    sw = 1;--%>
<%--                    int1 = setInterval(function () {--%>
<%--                        if (sw == 1) {--%>
<%--                            autoplay(1);--%>
<%--                            sw = 0;--%>
<%--                        } else {--%>
<%--                            autoplay(0);--%>
<%--                            sw = 1;--%>
<%--                        }--%>
<%--                    }, 3500);--%>
<%--                } else {--%>
<%--                    $(this).addClass("active");--%>
<%--                    sw = 0;--%>
<%--                    clearInterval(int1);--%>
<%--                }--%>
<%--            });--%>
<%--        });--%>
<%--    </script>--%>

<%--    <div>--%>
<%--        <h2 class="scroll_button_wrap">--%>
<%--            <button type="button" class="scroll_button" data-target="page1">--%>
<%--                <img src="images/weekly.png?v=1" alt="weeklyLogo">--%>
<%--                <p>바로가기</p>--%>
<%--            </button>--%>
<%--            <button type="button" class="scroll_button" data-target="page2">--%>
<%--                <img src="images/weekend.png?v=1" alt="weekendLogo">--%>
<%--                <p>바로가기</p>--%>
<%--            </button>--%>
<%--        </h2>--%>
<%--    </div>--%>


<%--    <section class="page" id="page1">--%>
<%--        <h2 class="page_tit">&quot;Week는 지금&quot;</h2>--%>
<%--        <div class="pic_lst">--%>
<%--            <div class="pic_item1">--%>
<%--                <a href="">--%>
<%--                    <div class="pic_content">--%>
<%--                        <img src="images/book.jpg" alt="도서">--%>
<%--                        <p class="pic_com">초등 교육을 위한 매거진 행복한 교육 8월호</p>--%>
<%--                        <h3 class="pic_tit">자녀에게 어떤 책이 도움이 될까? 부모와 아이와 함께 읽어요!</h3>--%>
<%--                    </div>--%>
<%--                </a>--%>
<%--            </div>--%>

<%--            <div class="pic_item">--%>
<%--                <a href="">--%>
<%--                    <div class="pic_content">--%>
<%--                        <img src="images/game.jpg" alt="">--%>
<%--                        <p class="pic_com">2학기 준비, 어떻게 하고 계세요?</p>--%>
<%--                        <h3 class="pic_tit">Week 교육과 함께! 게임으로 즐겁게! <br></h3>--%>
<%--                    </div>--%>
<%--                </a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <p class="additional_text">Week의 꿀팁 가득한 SNS 콘텐츠를 소개합니다!</p>--%>
<%--        <div class="pic_lst">--%>
<%--            <div class="pic_item">--%>
<%--                <a href="">--%>
<%--                    <div class="pic_content">--%>
<%--                        <img src="images/thinkkid.jpg" alt="">--%>
<%--                        <p class="pic_com">5~6세 학부모님 주목해주세요!</p>--%>
<%--                        <h3 class="pic_tit">유아기에 생기는 친구가 궁금하다면?</h3>--%>
<%--                    </div>--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            <div class="pic_item">--%>
<%--                <a href="">--%>
<%--                    <div class="pic_content">--%>
<%--                        <img src="images/textbook.jpg" alt="평가문제집">--%>
<%--                        <p class="pic_com">Week 자습서 & 평가문제집 신간 출시!</p>--%>
<%--                        <h3 class="pic_tit">주요과목부터 예체능까지!, Week 자습서로 끝내자!<br></h3>--%>
<%--                    </div>--%>
<%--                </a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </section>--%>
<%--    <section class="page" id="page2">--%>
<%--        <div class="page_wrap">--%>
<%--            <h2 class="page_tit">사회공헌</h2>--%>
<%--            <p class="page_com">Week는 기업과 사회, 환경이 공존하는 <br> 아름다운 세상을 꿈꾸고 있습니다!</p>--%>
<%--            <ul class="thumb_list">--%>
<%--                <li class="item2">--%>
<%--                    <a href="">--%>
<%--                        <div class="thumb_box"></div>--%>
<%--                        <p class="thumb_tit">학습봉사</p>--%>
<%--                        <div class="ico_box">--%>
<%--                            <span class="ico_text">직접 아이들을 지도하고 상호소통하며 <br> 용기와 희망을 전하고 있습니다.</span>--%>
<%--                        </div>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li class="item3">--%>
<%--                    <a href="">--%>
<%--                        <div class="thumb_box"></div>--%>
<%--                        <p class="thumb_tit">지역사회후원</p>--%>
<%--                        <div class="ico_box">--%>
<%--                            <span class="ico_text">Week의 강력한 의지와 사명감으로 <br> 따뜻한 나눔을 실천하고 있습니다.</span>--%>
<%--                        </div>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li class="item4">--%>
<%--                    <a href="">--%>
<%--                        <div class="thumb_box"></div>--%>
<%--                        <p class="thumb_tit">학회지원</p>--%>
<%--                        <div class="ico_box">--%>
<%--                            <span class="ico_text">대한민국 미래 교육의 발전을 위해 <br> 최선의 역할을 다하겠습니다.</span>--%>
<%--                        </div>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </div>--%>

<%--        <br><br><br><br><br>--%>

<%--        &lt;%&ndash;            <div class="slide_box">&ndash;%&gt;--%>
<%--        &lt;%&ndash;                <ul class="card_lst">&ndash;%&gt;--%>
<%--        &lt;%&ndash;                    <li class="item1">&ndash;%&gt;--%>
<%--        <h3 class="cate_tit">언론보도</h3>--%>
<%--        <p class="additional_text">최신 소식을 통해 Week의 보도자료를 소개합니다!</p>--%>
<%--        <ul class="cate_lst">--%>
<%--            <li>--%>
<%--                <div class="circle-box">--%>
<%--                    <a href="">--%>
<%--                        <p class="bd_content">운필력 키우는 한글 글쓰기, <br> 유아학습지로 창의력과 표현력을 기른다.</p>--%>
<%--                        <p class="bd_date">2023-07-13</p>--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--            </li>--%>
<%--            <li>--%>
<%--                <div class="circle-box">--%>
<%--                    <a href="">--%>
<%--                        <p class="bd_content">Week, <br> 스마트 더블케어 "윜"패스 출시</p>--%>
<%--                        <p class="bd_date">2023-07-18</p>--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--            </li>--%>
<%--            <li>--%>
<%--                <div class="circle-box">--%>
<%--                    <a href="">--%>
<%--                        <p class="bd_content">엄마들의 만국 공통 걱정은? <br> 행복한 교육에서 확인</p>--%>
<%--                        <p class="bd_date">2023-07-20</p>--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--            </li>--%>
<%--            <li>--%>
<%--                <div class="circle-box">--%>
<%--                    <a href="">--%>
<%--                        <p class="bd_content">즐거운 방학! <br> 어떻게 보내야할까?</p>--%>
<%--                        <p class="bd_date">2023-07-30</p>--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--            </li>--%>
<%--        </ul>--%>
<%--    </section>--%>
<%--<%@ include file="footer.jsp" %>--%>