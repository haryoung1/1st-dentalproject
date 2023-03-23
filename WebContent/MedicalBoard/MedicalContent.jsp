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
	height: 450px;
	margin: 50px auto 0px;
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_form">
		<table>
			<caption>${mrContent.mrno }번글상세보기</caption>
			<tr>
				<th>작성자</th>
				<td>${mrContent.mid }님</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${mrContent.mrtitle }</td>
			</tr>
			<tr>
				<th>본문</th>
				<td>${mrContent.mrcontent }</td>
			</tr>
			<tr>
				<td colspan="2"><c:if
						test="${empty member and not empty admin}">
						<input type="button" value="수정" class="btn"
							onclick="location='${conPath}/medicalModifyView.do?mrno=${mrContent.mrno}&pageNum=${param.pageNum }'">
						<input type="button" value="목록" class="btn"
							onclick="location='${conPath}/medicalList.do?pageNum=${param.pageNum }'">
					</c:if> <c:if test="${empty member and not empty admin}">
						<input type="button" value="삭제" class="btn"
							onclick="location='${conPath}/medicalDelete.do?nbno=${mrContent.mrno}&pageNum=${param.pageNum }'">
					</c:if> <c:if test="${empty admin}">
						<input type="button" value="목록" class="btn"
							onclick="location='${conPath}/medicalList.do?pageNum=${param.pageNum }'">
					</c:if>
			</tr>
		</table>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>