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
<link href="${conPath}/css/member/modify.css" rel="stylesheet">
<style>
#content_form {
	height: 470px;
	margin: 30px auto 0px;
}

#content_form table tr {
	height: 10px;
}

.btn {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background-color: #4A5164;
	color: white;
	margin: 0;
	padding: 0.5rem 1rem;
	font-weight: 350;
	font-weight: bold;
	text-align: center;
	text-decoration: none;
	border: 1px solid #444444;
	display: inline-block;
	width: 100px;
	box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px
		rgba(0, 0, 0, 0.06);
	cursor: pointer;
	transition: 0.5s;
}

.p1 {
	text-align: center;
}
</style>
<script>
	function click1() {
		answer = confirm("확인을 누르면 탈퇴가 진행 됩니다");
		if (answer === true) {

		} else {
			document.write(window.history.back());
		}
	};
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<div id="content_form">
			<form action="${conPath }/withdrawal.do" method="post">
				<table>
					<caption>회원 탈퇴</caption>
					<tr>
						<th>이름</th>
						<td>${member.mname }</td>
					</tr>
					<tr>
						<th>ID</th>
						<td>${member.mid }</td>
					</tr>
				</table>
				<br>
				<p class="p1">
					<button class="btn" onclick="click1()">회원탈퇴</button>
					<button class="btn" onclick="history.go(-1)">이전</button>
				</p>
			</form>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>