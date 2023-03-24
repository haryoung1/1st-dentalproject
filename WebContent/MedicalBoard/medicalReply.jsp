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
<link href="${conPath }/css/noticeList.css" rel="stylesheet">
<style>
#content_form {
	height: 400px;
	margin: 100px auto 0px;
}

.btn {
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_form">
		<form action="${conPath }/medicalReply.do" method="post">
			<input type="hidden" name="mrgroup" value="${originMedical.mrgroup }">
			<input type="hidden" name="mrstep" value="${originMedical.mrstep }">
			<input type="hidden" name="mrindent" value="${originMedical.mrindent }"> 
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<table>
				<caption>${originMedical.mrno }번글답변쓰기폼</caption>
				<tr>
					<td>작성자</td>
					<td>${mrContent.mid }${admin.aid }</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="mrtitle" required="required" value="[답] ${originMedical.mrtitle }">
					</td>
				</tr>
				<tr>
					<td>본문</td>
					<td><textarea rows="3" cols="3" name="mrContent"></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="답변쓰기" class="btn">
						<input type="reset" value="취소" class="btn"> 
						<input type="button" value="목록" class="btn" onclick="location.href='${conPath}/medicalList.do'"></td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>