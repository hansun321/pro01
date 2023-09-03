<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>복리후생</title>

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

        .contents { clear:both; min-height:100vh;
            background-image: url("../images/bk.jpg");
            background-repeat: no-repeat; background-position:center -250px; height: 1550px;}
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }
        .row { clear: both; height: 1500px; width: 1200px;}
        .container { clear: both; height: 250px; margin: 50px auto;}
        .container:first-child {padding-top: 50px;}
        .container:last-child {padding-bottom: 50px;}
        .container .img1 {  float: left; }
        .container .txt1 { float: right; width: 700px; padding-top: 30px; }
        .container .txt1 p { vertical-align: middle;}
        .img1_tit { margin-bottom: 20px; font-weight: bold; font-size: large;
        }
        .info_list {
            float: left;
            box-sizing: border-box;
            -webkit-box-sizing: border-box;
        }
        .info_wrap {font-size: 15px;
            line-height: 28px;
            letter-spacing: -0.3px;}
        .info_wrap .info_sub_title {
            font-weight: bold;
        }
        .info_wrap .info_sub_text {
            word-break: keep-all;
            word-wrap: break-word;
            overflow-wrap: break-word;
        }


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
    <header class="hd" id="hd">
        <%@ include file="../header.jsp"%>
    </header>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="">HOME</a> &gt <span>인재채용</span> &gt <span>복리후생</span> </p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">복리후생</h2>
                        <div class="row">
                            <section class="container">
                                <div class="img1">
                                    <p class="img1_tit">Time & Refresh</p>
                                    <img src="images/img_refresh.jpg" alt="" class="img2"/>
                                </div>
                                <div class="txt1">
                                    <div class="info_list">
                                        <dl class="info_wrap">
                                            <dt class="info_sub_title">자기돌봄 휴직</dt>
                                            <dd class="info_sub_text">3년 이상 근속 시 자기개발이나 휴식을 위해 최대 6개월까지 무급 휴직 가능</dd>
                                        </dl>
                                        <dl class="info_wrap">
                                            <dt class="info_sub_title">리프레시 플러스 휴가</dt>
                                            <dd class="info_sub_text">2년 근속 시 재충전을 위해 연차 외에 추가적으로 15일의 유급휴가 부여</dd>
                                        </dl>
                                        <dl class="info_wrap">
                                            <dt class="info_sub_title">워케이션</dt>
                                            <dd class="info_sub_text">익숙한 공간을 떠나 새로운 공간에서의 몰입과 리프레시를 위해
                                                최대 7일간 업무 공간 및 숙박(1인 1실), 식사 등 지원</dd>
                                        </dl>
                                    </div>
                                </div>
                            </section>
                            <section class="container">
                                <div class="img1">
                                    <p class="img1_tit">Work Tools</p>
                                    <img src="images/img_worktools.jpg" alt="" class="img2"/>
                                </div>
                                <div class="txt1">
                                    <div class="info_list">
                                        <dl class="info_wrap">
                                            <dt class="info_sub_title">개인별 업무기기 예산</dt>
                                            <dd class="info_sub_text">노트북, 모니터, 태블릿 등 본인의 업무에 맞게 업무 기기를 자유롭게 선택하여 사용할 수 있도록 2년에 최대 720만 원의 예산 지급</dd>
                                        </dl>
                                        <dl class="info_wrap">
                                            <dt class="info_sub_title">스튜디오</dt>
                                            <dd class="info_sub_text">전문 촬영 장비를 갖춘 사옥 내 12개 스튜디오 완비</dd>
                                        </dl>
                                        <dl class="info_wrap">
                                            <dt class="info_sub_title">문화생활 지원</dt>
                                            <dd class="info_sub_text">공연, 영화, 도서 등 문화생활 지원 (월 20만원)</dd>
                                        </dl>
                                    </div>
                                </div>
                            </section>
                            <section class="container">
                                <div class="img1">
                                    <p class="img1_tit">Meal & Snack</p>
                                    <img src="images/img_mealandsnack.jpg" alt="" class="img2"/>
                                </div>
                                <div class="txt1">
                                    <div class="info_list">
                                        <dl class="info_wrap">
                                            <dt class="info_sub_title">구내 식당</dt>
                                            <dd class="info_sub_text">매일 아침/점심/저녁 건강하고 든든한 한 끼 식사를 무료로 제공하는 구내 식당</dd>
                                        </dl>
                                        <dl class="info_wrap">
                                            <dt class="info_sub_title">Lounge </dt>
                                            <dd class="info_sub_text">전문 바리스타가 내린 커피, 제철 식재료로 만든 착즙 주스, 갓 구운 빵을 임직원 할인가에 이용</dd>
                                        </dl>
                                    </div>
                                </div>
                            </section>
                            <section class="container">
                                <div class="img1">
                                    <p class="img1_tit">Family</p>
                                    <img src="images/img_family.jpg" alt="" class="img2"/>
                                </div>
                                <div class="txt1">
                                    <div class="info_list">
                                        <dl class="info_wrap">
                                            <dt class="info_sub_title">경조사 지원</dt>
                                            <dd class="info_sub_text">결혼, 환갑, 출산, 장례 등 중요한 경조사에 축하와 조의를 전하고 휴가 및 경조비 지원</dd>
                                        </dl>
                                        <dl class="info_wrap">
                                            <dt class="info_sub_title">육아휴직</dt>
                                            <dd class="info_sub_text">법정 육아휴직 1년 외 추가로 1년 더, 총 2년까지 신청할 수 있는 제도
                                            </dd>
                                        </dl>
                                        <dl class="info_wrap">
                                            <dt class="info_sub_title">가족돌봄 휴가</dt>
                                            <dd class="info_sub_text">가족의 간호 및 돌봄이 필요한 경우 최대 90일까지 사용할 수 있는 무급 휴가</dd>
                                        </dl>
                                    </div>
                                </div>
                            </section>
                        </div>
            </div>
        </section>
    </div>
<%@ include file="../footer.jsp" %>
</div>
</body>
</html>
