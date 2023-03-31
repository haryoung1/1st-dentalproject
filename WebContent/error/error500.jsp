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
<link href="css/error/500.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
	<div class="error-header"></div>
	<div class="container ">
		<section class="error-container text-center">
			<h1>500</h1>
			<div class="error-divider">
				<h2>ooops!!</h2>
				<p class="description">SOMETHING WENT WRONG.</p>
			</div>
			<a href="${conPath}/main.do" class="return-btn"><i class="fa fa-home"></i>Home</a>
		</section>
	</div>
</body>
</html>