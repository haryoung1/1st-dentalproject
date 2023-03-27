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
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<div align="center" id="map">
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ce0aa6a48a5791c924d5fc36b23a1382"></script>
			<script type="text/javascript">
				// 지도 표시
				var mapContainer = document.getElementById('map');
				var options = { //지도를 생성할 때 필요한 기본 옵션
					center : new kakao.maps.LatLng(33.450701, 126.570667),
					level : 3
				//지도의 레벨(확대, 축소 정도)
				};
				var map = new kakao.maps.Map(mapContainer, options); //지도 생성 및 객체 리턴
			</script>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>