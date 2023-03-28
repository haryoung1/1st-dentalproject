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
<style>
#wrap {
	width: 1000px;
	margin: 0 auto;
	overflow: hidden;
}

#intro .intro2 {
	float: center;
	width: 700px;
	height: 250x;
	text-align: center;
	line-height: 350px;
	margin-left: 7px;
	margin: 6px;
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<div class="intro2">
			<p>
				<img src="image/소개22.PNG">
			</p>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>