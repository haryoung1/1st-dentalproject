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
<link href="${conPath}/css/member/join.css" rel="stylesheet">
<style>
#content_form {
	height: 470px;
	margin: 30px auto 0px;
}

#content_form table tr {
	height: 10px;
}

button, .btn {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background: white;
	color: black;
	margin: 0;
	padding: 0.5rem 1rem;
	font-size: 1rem;
	font-weight: 400;
	font-weight: bol text-align: center;
	text-decoration: none;
	border-radius: 4px;
	border: 2px solid #444444;
	display: inline-block;
	width: auto;
	box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px
		rgba(0, 0, 0, 0.06);
	cursor: pointer;
	transition: 0.5s;
}
</style>
<script>
	function click1() {
		answer = confirm ("확인을 누르면 탈퇴가 진행 됩니다");
		if (answer === true) {
			
		} else {
			document.write(window.history.back());
		}
	};
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
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
				<tr>
					<td colspan="2">
						<button class="btn" onclick="click1()">회원탈퇴</button> 
						<input
						class="btn" type="button" value="이전" onclick="history.go(-1)">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>