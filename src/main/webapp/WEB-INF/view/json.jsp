<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>json</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	
	<link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&amp;display=swap" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            vertical-align: middle;
        }
        
        .main-title {
            font-family: 'Do Hyeon', sans-serif;
            vertical-align: middle;
            text-align: left;
        }
        
        .data-info {
        	vertical-align: middle;
            text-align: right;
        }
        
        .sub-title {
       		vertical-align: middle;
            text-align: center;
        }
        
        .table td {
            vertical-align: middle;
            text-align: center;
        }
    </style>
</head>
<body>
	<div class="container">
		<table class="table table">
			<thead>
				<tr class="thead-dark">
					<th colspan="4" class="main-title">
						<h2>코로나 NOW</h2>
					</th>
					<th colspan="4" class="data-info">
						<font size="2">단위: 명</font>
					</th>
				</tr>
				<tr class="thead-light sub-title">
					<th>지역</th>
					<th>신규 확진자<br>(전일대비)</th>
					<th>총 확진자</th>
					<th>총 완치자</th>
					<th>총 사망자</th>
					<th>발생률(%)</th>
					<th>해외유입<br>(전일대비)</th>
					<th>지역발생<br>(전일대비)</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach var="i" items="${data.seoul}">
						<td>${i}</td>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="i" items="${data.busan}">
						<td>${i}</td>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="i" items="${data.daegu}">
						<td>${i}</td>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="i" items="${data.incheon}">
						<td>${i}</td>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="i" items="${data.gwangju}">
						<td>${i}</td>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="i" items="${data.daejeon}">
						<td>${i}</td>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="i" items="${data.ulsan}">
						<td>${i}</td>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="i" items="${data.sejong}">
						<td>${i}</td>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="i" items="${data.gyeonggi}">
						<td>${i}</td>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="i" items="${data.gangwon}">
						<td>${i}</td>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="i" items="${data.chungbuk}">
						<td>${i}</td>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="i" items="${data.chungnam}">
						<td>${i}</td>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="i" items="${data.jeonbuk}">
						<td>${i}</td>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="i" items="${data.jeonnam}">
						<td>${i}</td>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="i" items="${data.gyeongbuk}">
						<td>${i}</td>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="i" items="${data.gyeongnam}">
						<td>${i}</td>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="i" items="${data.jeju}">
						<td>${i}</td>
					</c:forEach>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>