<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	background-color: #white;
}

footer {
	height: 120px;
	background-color: #3A3A3C;
}

footer #footer_conts, footer #footer_conts a {
	color: white;
	font-weight: blod;
	font-size: 1.0em;
	text-align: center;
}

footer #footer_conts p:first-child {
	font-weight: bold;
	height: 30px;
	line-height: 30px;
}

footer #footer_conts p:last-child {
	color: white;
	float: right;
}
</style>
</head>
<body>
	<footer>
	<div id="wrap">
		<div id="footer_conts">
			<p>상호명 : 치카치카 치과</p>
			<p>사업자등록번호 : 100-10-75391</p>
			<p>서울특별시 어떤구 어떤로 9 좋은빌딩 1-5F</p>
			<p>Copyright© 2023 tj . All rights reserved.</p>
			<p>
				<b><a href="${conPath }/adminLoginView.do">관리자 전용</a></b>
			</p>
		</div>
	</div>
	</footer>
</body>
</html>