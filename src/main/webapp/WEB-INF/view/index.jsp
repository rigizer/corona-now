<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Corona Map:: Index</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
        }
    </style>
    
    <style>
        .label {
        	margin-bottom: 0px;
        }
        .label * {
       		display: inline-block;
       		vertical-align: top;
       	}
        .label .left {
        	background: url("https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_l.png") no-repeat;
        	display: inline-block;
        	height: 24px;
        	overflow: hidden;
        	vertical-align: top;
        	width: 7px;
        }
        .label .center {
        	background: url(https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_bg.png) repeat-x;
        	display: inline-block;
        	height: 24px;
        	font-size: 12px;
        	line-height: 24px;
        }
        .label .right {
        	background: url("https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_r.png") -1px 0  no-repeat;
        	display: inline-block;
        	height: 24px;
        	overflow: hidden;
        	width: 6px;
        }
    </style>
    
    <style>
        body {
            margin: 0;
        }
        .bottomNav {
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            height: 64px;
            line-height: 64px;
            color: #fff;
            text-align: center;
        }
        .bottomNav {
            bottom: 0;
            background:#111;
        }
        article {
            padding: 0px 3%;
        }
        article .block {
            padding: 20px;
            min-height: 400px;
        }
        article .block p {
            line-height: 22px;
            color: #fff;
            font-size: 16px;
            font-weight: 600;
        }
        article .block:nth-child(2n+1) {
            background: #999;
        }
        article .block:nth-child(2n) {
            background: #222;
        }
        i {
            margin: 25px 25px 0px 0px;
        }
        #map {
            width: 100vw;
            height: 100vh;
            bottom: 64px;
        }
    </style>
</head>
<body>
	<div id="map"></div>
    
    <script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=21b8f1627b4c40e13a1edac86fe2dd78"></script>
    <script>
        let mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
                center: new kakao.maps.LatLng(36.38, 127.51), // 지도의 중심좌표
                level: 13 // 지도의 확대 레벨
            };

        // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
        let map = new kakao.maps.Map(mapContainer, mapOption);

        let locationList = ['서울', '부산', '대구', '인천', '광주', '대전', '울산', '세종', '경기도', '강원도', '충청북도', '충청남도', '전라북도', '전라남도', '경상북도', '경상남도', '제주도']

        let xList = [37.5665734, 35.1801639, 35.8715288, 37.4558168, 35.1597648, 36.3501622, 35.5389027, 36.4799310, 37.2747914, 37.8856501, 36.6353841, 36.6589649, 35.8200679, 34.8160298, 36.5762059, 35.2371214, 33.4889018]
        let yList = [126.978179, 129.074660, 128.601501, 126.706270, 126.851544, 127.385712, 129.311552, 127.289047, 127.009625, 127.730008, 127.491422, 126.673684, 127.110636, 126.462130, 128.505336, 128.691272, 126.498144]
        
        let positions = [];
        
        for (let i = 0; i < locationList.length; i++) {
            positions.push(
                {
                    title: locationList[i],
                    latlng: new kakao.maps.LatLng(xList[i], yList[i])
                }
            );
        }

        // 마커 이미지 주소
        let imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
        for (let i = 0; i < positions.length; i ++) {
            
            // 마커 이미지의 이미지 크기 입니다
            let imageSize = new kakao.maps.Size(24, 35);
            
            // 마커 이미지를 생성합니다    
            let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
            
            // 마커를 생성합니다
            /*
            let marker = new kakao.maps.Marker({
                map: map, // 마커를 표시할 지도
                position: positions[i].latlng, // 마커를 표시할 위치
                title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                image : markerImage // 마커 이미지 
            });
            */
        }

        for (let i = 0; i < locationList.length; i++) {
            let content = '<div class ="label"><span class="left"></span><span class="center">' + locationList[i] + '</span><span class="right"></span></div>';
            let position = new kakao.maps.LatLng(xList[i], yList[i]); 

            let customOverlay = new kakao.maps.CustomOverlay({
                position: position,
                content: content   
            });

            customOverlay.setMap(map);
        }
    </script>

    <nav class="bottomNav">
        <i class="fas fa-map-marked-alt"></i>
        <i class="far fa-credit-card"></i>
        <i class="fas fa-user"></i>
    </nav>
</body>
</html>