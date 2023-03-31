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
		answer = prompt('관리자코드를 입력 하세요.');
		let code = 143;
		if (answer == 143) {
			alert('관리자 탈퇴 완료')

		} else if (code != null) {
			alert('코드가 일치하지 않습니다.')
			document.write(window.history.back());
		}

	};
	/* 	function click1() {
	 answer = confirm("확인을 누르면 탈퇴가 진행 됩니다");
	 if (answer === true) {

	 } else {
	 document.write(window.history.back());
	 }
	 }; */
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div class="login-form">
		<form action="${conPath }/adminwithdrawal.do" method="post">
			<h3>관리자탈퇴</h3>
			<br>
			<p>
				<input type="text" class="text-field" readonly="readonly" placeholder="이름 : ${admin.aname }">
			</p>
			<p>
				<input type="text" class="text-field" readonly="readonly" placeholder="ID : ${admin.aid }">
			</p>
			<br>
			<p class="p1">
				<button class="submit-btn" onclick="click1()">관리자탈퇴</button>
				<input class="submit-btn" type="button" value="이전" onclick="history.go(-1)" />
			</p>
		</form>
	</div>
	<br>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>