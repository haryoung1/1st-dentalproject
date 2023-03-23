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
<link href="${conPath }/css/main.css" rel="stylesheet">
<style>
</style>
</head>
</head>
<body>
	<c:if test="${not empty adminloginErrorMsg }"> <!-- 관리자 ID / PW 실패시 -->
		<script>
			alert('${adminloginErrorMsg}');
			history.back();
		</script>
	</c:if>
	<c:if test="${not empty loginErrorMsg }"> <!-- 멤버 id / pw 실패시 -->
		<script>
			alert('${loginErrorMsg}');
			history.back();
		</script>
	</c:if>
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
					<p class="p1">
						<img src="image/임플란트.png"> <span class="imtext1">[임플란트]</span>
					</p>
					<p class="p2">
						<img src="image/치아교정.png"> <span class="imtext2">[치아교정]</span>
					</p>
					<p class="p3">
						<img src="image/치아미백.PNG"> <span class="imtext3">[치아미백]</span>
					</p>
				</div>
				<!-- hit 끝-->
				<div class="md_product">
					<p class="p4">
						<img src="image/보철치료.png"> <span class="imtext3">[보철
							/ 충치]</span>
					</p>
					<p>
						<img src="image/진료안내.png">
					</p>
					<p>
						<img src="image/길.png"> <a href="${conPath }/map.do">찾아오시는
							길 →</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>