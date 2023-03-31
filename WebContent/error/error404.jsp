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
<link href="css/error/404.css" rel="stylesheet">
</head>
<body>
	<div class="error-wrapper">
		<div class="error-container">
			<div class="error">
				<div class="error-title">Error</div>
				<div class="error-number">404</div>
				<div class="error-description">Sorry, The page you were
					looking for doesn't exist</div>
				<div class="error-or">
					<div class="or-line"></div>
					<div class="or">
						<button onclick="location='${conPath}/main.do'">HOME</button>
					</div>
				</div>
				<div class="error-or">
					<div class="or-line"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>