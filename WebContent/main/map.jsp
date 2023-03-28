<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/intro.css" rel="stylesheet">
<style>
h2 {
	text-align: center;
}
.location {
	text-align: center;
}
.location p {
	font-size : 1.2em;
	font-weight : bold;
	color: black;
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<br>
	<h2>오시는길</h2>
	<br>
	<div id="wrap">
		<div id="map" style="width: 100%; height: 350px;"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ce0aa6a48a5791c924d5fc36b23a1382&libraries=services"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3 // 지도의 확대 레벨
			};
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('서울특별시 서대문구 신촌로 141', function(result, status) {
			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				var coords = new kakao.maps.LatLng(result[0].y,result[0].x);
			// 결과값으로 받은 위치를 마커로 표시합니다
				var marker = new kakao.maps.Marker({
					map : map,
					position : coords
				});
			// 인포윈도우로 장소에 대한 설명을 표시합니다
				var infowindow = new kakao.maps.InfoWindow({
					content : '<div style="width:150px;text-align:center;padding:6px 0;">치카치카 치과</div>'
				});
				infowindow.open(map, marker);
			// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
			}
		});
		</script>
	</div>
	<br>
	<div class="location">
		<ul>
			<li>
				<img src="image/로고.png">
			</li>
			<li>
				<p>서울특별시 어떤구 어떤로 9 좋은빌딩 1-5F</p>
				<p>TEL : 02)2699-9908</p>
				<p><img src="image/이2.png">치카치카 치과 </p>
			</li>
		</ul>
	</div>
	<br>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>