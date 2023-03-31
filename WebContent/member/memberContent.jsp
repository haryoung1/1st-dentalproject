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
<link href="${conPath }/css/consultingList.css" rel="stylesheet">
<style>
p {
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<h3>회원목록</h3>
		<hr>
		<br>
		<table>
			<caption>INFORMATION</caption>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<th>회원사진</th>
				<td>
					<img src="${conPath }/memberPhotoUp/${mDto.mphoto}" alt="${mDto.mname }사진" width="150">
				</td>
			</tr>
			<tr>
				<th>회원 ID</th>
				<td>
					<input type="text" name="mid" value="${mDto.mid }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="mname" value="${mDto.mname }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="email" name="memail" value="${mDto.memail }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td colspan="2">
					<input type="text" name="mbirth" id="mbirth" value="${mDto.mbirth }" id="birth" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td colspan="2">
					<input type="text" name="maddress" value="${mDto.maddress }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>
					<fmt:formatDate value="${mDto.mrdate }" pattern="YY-MM-dd" />
				</td>
			</tr>
		</table>
		<br>
		<p>
			<input type="button" value="이전" onclick="history.go(-1)" class="btn">
		</p>
	</div>
	<br>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>