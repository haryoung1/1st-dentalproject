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
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_form">
		<form action="${conPath }/noticeModify.do" method="post">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="nbno" value="${nContent.nbno }">
			<table>
				<caption>${nContent.nbno }번 글 수정</caption>
				<tr>
					<th>제목</th>
					<td><input type="text" name="nbtitle"
						value="${nContent.nbtitle }" required="required"></td>
				</tr>
				<tr>
					<th>본문</th>
					<td>
						<textarea rows="5" name="nbcontent">${nContent.nbcontent }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="저장" class="btn">
						<input type="reset" value="취소" class="btn" onclick="history.back()"> 
						<input type="button" value="목록" class="btn"
						onclick="location='${conPath}/noticeList.do?pageNum=${param.pageNum }'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>