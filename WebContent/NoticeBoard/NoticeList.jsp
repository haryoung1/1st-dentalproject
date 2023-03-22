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
	height: 470px;
	margin: 30px auto 0px;
}

#content_form table tr {
	height: 10px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$('tr')
								.click(
										function() {
											var nbno = $(this).children().eq(0)
													.text();
											if (!isNaN(nbno)) {
												location.href = '${conPath }/noticeContent.do?nbno='
														+ nbno
														+ '&pageNum=${pageNum}';
											}
										});
					});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<!--  글쓰기 성공 if noticeList -->
	<c:if test="${not empty noticeWriteResult}">
		<script>
			alert('${noticeWriteResult}')
		</script>
	</c:if>
	<div id="wrap">
		<table>
			<tr>
				<td><c:if test="${not empty admin }">
						<a href="${conPath }/noticeWriteView.do">글쓰기</a>
					</c:if> <c:if test="${ empty admin }">
						<a href="${conPath }/adminLoginView.do?next=noticeWriteView.do">
							글쓰기</a>
					</c:if></td>
			</tr>
		</table>
		<h2>공지사항</h2>
		<hr>
		<br>
		<table>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
				<th>IP</th>
			</tr>
			<c:if test="${totCnt eq 0 }">
				<tr>
					<td colspan="5">해당 페이지의 글이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${totCnt != 0 }">
				<c:forEach items="${noticeList}" var="notice">
					<tr>
						<td>${notice.nbno }</td>
						<td>${notice.aid }</td>
						<td>${notice.nbtitle }</td>
						<td><fmt:formatDate value="${notice.nbrdate }" type="date"
								dateStyle="short" /></td>
						<td>${notice.nbip }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<!-- 페이징처리 -->
		<div class="paging">
			<c:if test="${startPage > BLOCKSIZE }">
				[ <a href="${conPath }/noticeList.do?pageNum=${startPage-1}"> 이전
				</a> ]
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i eq pageNum }">
					<b> [ ${i } ] </b>
				</c:if>
				<c:if test="${i != pageNum }">
					[ <a href="${conPath }/noticeList.do?pageNum=${i}"> ${i } </a> ]
				</c:if>
			</c:forEach>
			<c:if test="${endPage<pageCnt }">
			  [ <a href="${conPath }/noticeList.do?pageNum=${endPage+1}"> 다음
				</a> ]
			</c:if>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>