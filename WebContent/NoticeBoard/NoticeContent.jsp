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
#content_form {
	height: 450px;
	margin: 50px auto 0px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<div id="content_form">
		<table>
			<caption>${nbContent.nbno }번 글 상세보기</caption>
			<tr>
				<th>작성자</th>
				<td>${nbContent.aid }님</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${nbContent.nbtitle }</td>
			</tr>
			<tr>
				<th>본문</th>
				<td>${nbContent.nbcontent }</td>
			</tr>
			<tr>
				<td colspan="2">
					<c:if test="${admin.aId eq nContent.aid}">
						<button onclick="location='${conPath}/noticeModifyView.do?nbno=${notice.nbno }&pageNum=${param.pageNum }'">수정
						</button>
						<button
							onclick="location='${conPath}/noticeList.do?pageNum=${param.pageNum }'">목록
						</button>
					</c:if>
					<c:if test="${admin.aId eq nContent.aid or not empty admin}">
						<button
							onclick="location='${conPath}/noticeDelete.do?fid=${notice.nbno }&pageNum=${param.pageNum }'">삭제
						</button>
					</c:if>
			</tr>
		</table>
	</div>
</body>
</html>