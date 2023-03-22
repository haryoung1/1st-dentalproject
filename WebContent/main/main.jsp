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
<!--  <link href="${conPath }/css/style.css" rel="stylesheet">-->
<link href="${conPath }/css/main.css" rel="stylesheet">
<style>
</style>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<div id="content">
			<div class="section1">
				<div class="slide_banner">
					<p>
						<img src="image/mainview.jpg">
					</p>
				</div>
			</div>
			<!-- section1 끝-->
			<div class="section2">
				<div class="hit_product">
					<p>
						임플란트<img src="image/임플란트.png">
					</p>
					<p>
						<img src="image/치아교정.png">
					</p>
					<p>
						<img src="image/치아미백.PNG">
					</p>
				</div>
				<!-- hit 끝-->
				<div class="md_product">
					<p>
						<img src="image/보철치료.png">
					</p>
					<p>
						<img src="image/진료안내.png">
					</p>
					<p>md_product3</p>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>