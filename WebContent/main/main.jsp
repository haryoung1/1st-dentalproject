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
<link href="${conPath }/css/style.css" rel="stylesheet">
<style>
#content_form {
	width: 800px;
	height: 500px;
	line-height: 500px;
	margin: 0 auto;
	text-align: center;
	font-size: 3em;
}
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
	<div class="gnb">
		<ul>
			<li><a href="${conPath }/noticeList.do">고객센터</a></li>
			<li><a href="${conPath }/joinView.do">회원가입</a></li>
			<li><a href="${conPath }/adminLoginView.do">관리자로그인</a></li>
		</ul>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>