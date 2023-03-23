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
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<c:if test="${empty member }">
		<script>
			location.href = '${conPath}/loginView.do?next=medicalWriteView.do';
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div id="content_form">
		<form action="${conPath }/medicalWrite.do" method="post">
			<table>
				<caption>글쓰기</caption>
				<tr>
					<td>제목</td>
					<td><input type="text" name="mrtitle" required="required">
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="5" name="mrcontent"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="등록하기" class="btn">
						<input type="reset" value="취소" class="btn"> <input
						type="button" value="목록" class="btn"
						onclick="location.href='${conPath}/noticeList.do'"></td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>