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
<link href="${conPath}/css/member/login.css" rel="stylesheet">
<style>
.p1 {
	text-align: center;
}
</style>
<script>
	function click1() {
		answer = confirm("충분히 확인을 하셨나요 ?");
		if (answer === true) {

		} else {
			document.write(window.history.back());
		}
	};
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div class="login-form">
		<form action="${conPath }/withdrawal.do" method="post">
			<h3>회원탈퇴</h3>
			<br>
			<p>
				<input type="text" class="text-field" readonly="readonly"
					placeholder="이름 : ${member.mname }">
			</p>
			<p>
				<input type="text" class="text-field" readonly="readonly"
					placeholder="ID : ${member.mid }">
			</p>
			<br>
			<p class="p1">
				<button class="submit-btn" onclick="click1()">회원탈퇴</button>
				<input class="submit-btn" type="button" value="이전"
					onclick="history.go(-1)" />
			</p>
			<p class="links">
				<a href="#" onclick="click1()">신중히 생각하고 결정 해주세요</a>
			</p>
		</form>
	</div>
	<br>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>