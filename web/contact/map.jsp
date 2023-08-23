<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
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
        .wrap { background-color: #fffcf2; }
        .contents { clear:both; min-height:100vh;
            background-image: url("../images/bg_visual_overview.jpg");
            background-repeat: no-repeat; background-position:center -250px; height: 910px; }
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

    </style>
    <link rel="stylesheet" href="../ft.css">
    <link rel="stylesheet" type="text/css" href="http://s1.daumcdn.net/svc/attach/U03/cssjs/mapapidoc/1421136453605/service.min.css">
    <style>
        body { background:white; }
        #kk-map {
            position: relative;
            bottom: 10px;
            left: 860px;
            margin: 20px;
        }
        .mapBtn {
            display: inline-block;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }
        .mapBtn:hover {
            background-color: #0056b3;
        }
    </style>
    <script type="text/javascript" src="http://dmaps.daum.net/map_js_init/v3.js"></script>
    <script type="text/javascript" src="http://s1.daumcdn.net/svc/original/U03/cssjs/jquery/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="http://s1.daumcdn.net/svc/original/U0301/cssjs/JSON-js/fc535e9cc8/json2.min.js"></script>
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="/">HOME</a> &gt; <span>오시는길</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">오시는길</h2>
                <div class="maparea">
                    <div id="map" style="margin: 0 auto; text-align: center; width:800px;height:600px; background:white; "></div>
                    <script>
                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                            mapOption = {
                                center: new daum.maps.LatLng(37.4676446,126.8876698), // 지도의 중심좌표
                                level: 2 // 지도의 확대 레벨
                            };
                        var map = new daum.maps.Map(mapContainer, mapOption);
                        // 마커가 표시될 위치입니다
                        var markerPosition  = new daum.maps.LatLng(37.4676446,126.8876698);
                        // 마커를 생성합니다
                        var marker = new daum.maps.Marker({
                            position: markerPosition
                        });
                        // 마커가 지도 위에 표시되도록 설정합니다
                        marker.setMap(map);
                        var iwContent = '<div style="padding:5px;">천재 IT교육센터 본원<br><a href="" style="color:blue" target="_blank"></a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                            iwPosition = new daum.maps.LatLng(37.4676446,126.8876698); //인포윈도우 표시 위치입니다
                        // 인포윈도우를 생성합니다
                        var infowindow = new daum.maps.InfoWindow({
                            position : iwPosition,
                            content : iwContent
                        });
                        // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
                        infowindow.open(map, marker);
                    </script>
                    <script type="text/javascript" src="http://m1.daumcdn.net/tiara/js/td.min.js"></script>
                    <script type="text/javascript">
                        var _tiq = 'undefined' !== typeof _tiq ? _tiq : [];
                        window._tiq = _tiq;
                        _tiq.push(['__trackPageview']);
                    </script>
                    <script type="text/javascript" src="http://s1.daumcdn.net/svc/attach/U03/cssjs/mapapidoc/1421136453605/service.min.js">
                    </script>
                </div>
                <div id="kk-map">
                    <a href="https://map.kakao.com/?urlX=475439&urlY=1104677&urlLevel=3&itemId=8419265&q=%EC%B2%9C%EC%9E%ACit%EA%B5%90%EC%9C%A1%EC%84%BC%ED%84%B0&srcid=8419265&map_type=TYPE_MAP" target="_blank" class="mapBtn">지도 자세히보기</a>
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