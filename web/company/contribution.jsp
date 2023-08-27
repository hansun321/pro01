<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사회공헌</title>

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
        .wrap { background-color: #ffffff;}
        .contents { clear:both; height:1700px;
            background-image: url("../images/bg_visual_overview.jpg");
            background-repeat: no-repeat; background-position:center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1500px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }
        .inner1 {
            margin: 30px auto;
            width: 1200px;
            box-sizing: border-box;
        }
        .btn-group {
            display: flex;
        }
        .btn-group .button {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0 2.333rem;
            min-width: 12.5rem;
            height: 4.166rem;
            font-size: 1.333rem;
            line-height: 1;
            border: 2px solid #cdcdcd;
            -webkit-border-radius: 2.083rem;
            -moz-border-radius: 2.083rem;
            border-radius: 2.083rem;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            -webkit-transition: all .15s ease-in .05s;
            -moz-transition: all .15s ease-in .05s;
            -ms-transition: all .15s ease-in .05s;
            -o-transition: all .15s ease-in .05s;
            transition: all .15s ease-in .05s;
        }
        .btn-group.tab-group {
            justify-content: center;
        }
        .tab-group .active {
            border-color: #f5be8b;
            background: #ffffff;
            color: #222;
            margin: 0 0.416rem;
            font-size: 1.5rem;
            font-weight: 700;
        }
        .tab-group .btn_tab {
            margin: 0 0.416rem;
            font-size: 1.5rem;
            font-weight: 700;
            color: #cdcdcd;
            background: #fff;
        }
        .inner { clear: both; margin: 30px 18%; overflow: hidden; }
        .inner > div {
            float: left; margin-left: 50px;
        }
        .img-area > p {
            font-size: 20px; font-weight: bold; padding: 20px 20px 20px 7px;
        }
        .inner span { margin: 0 240px; line-height: 100px;   font-weight: bold;     }

    </style>

    <link rel="stylesheet" href="../ft.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp"%>
    </header>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="">HOME</a>  &gt <span>회사소개</span> &gt <span>사회공헌</span> </p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">사회공헌</h2>
                <hr>
                <div class="inner1">
                    <div class="btn-group tab-group type3">
                        <a ui-sref="textbook01" ui-sref-opts="{reload: true}" class="button btn_tab" href="/company/company.jsp">윜이란?</a>
                        <a ui-sref="textbook02" ui-sref-opts="{reload: true}" class="button btn_tab" href="/company/company.jsp#scroll">윜 스토리</a>
                        <a ui-sref="textbook03" ui-sref-opts="{reload: true}" class="button active scroll_move" href="/company/contribution.jsp">사회공헌</a>
                        <!-- <a href="#" class="button btn_tab">XR</a> -->
                    </div>
                </div>
                <script>
                    $(document).ready(function($) {
                        $(".scroll_move").click(function(event){
                            event.preventDefault();
                            $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
                        });
                    });
                </script>
                <div class="inner">
                    <span>우리 아이들의 행복한 내일을 위해 Week가 끊임 없는 노력을 하겠습니다.</span>
                        <div class="img-area">
                            <img src="/weekcrew/images/img_contribution1.jpg" alt="week 도서 기증">
                            <p>✅ 해외아동 도서 및 교육 지원</p>
                        </div>
                        <div class="img-area">
                            <img src="/weekcrew/images/img_contribution4.jpg" alt="천재교육 도서 기증 &amp; 학습봉사 발대식">
                            <p>✅ Week 도서 기증</p>
                        </div>
                        <div class="img-area">
                            <img src="/weekcrew/images/img_contribution2.jpg" alt="">
                            <p>✅ 대한교육협회 지원</p>
                        </div>
                        <div class="img-area">
                            <img src="/weekcrew/images/img_contribution3.jpg" alt="">
                            <p>✅ 지역사회 교육 후원</p>
                        </div>
                </div>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>
