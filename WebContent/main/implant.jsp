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
<link href="${conPath }/css/implant.css" rel="stylesheet">
<style>
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<div id="imp1">
			<p>
				<img src="image/im.png">
				<img src="image/im2.png">
				<img src="image/im3.png">
			</p>
		</div>
<!-- 		<div id="imp2">
			<p>
				<img src="image/im2.png">
			</p>
		</div>
		<div id="imp3">
			<p>
				<img src="image/im3.png">
			</p>
		</div> -->
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>