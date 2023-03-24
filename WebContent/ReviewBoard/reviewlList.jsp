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
#wrap .left {
	text-align: left;
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
											var mrno = $(this).children().eq(0)
													.text();
											if (!isNaN(mrno)) {
												location.href = '${conPath }/reviewContent.do?rvno='
														+ rvno
														+ '&pageNum=${pageNum}';
											}
										});
					});
</script>
</head>
<body>
	<%-- 	<c:if test="${not empty medicalWriteResult}"> <!--  글쓰기 성공 -->
		<script>
			alert('${medicalWriteResult}')
		</script>
	</c:if> --%>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<table>
			<tr>
				<td><c:if test="${not empty member }">
						<a href="${conPath }/reviewlWriteView.do">글쓰기</a>
					</c:if> <c:if test="${empty member and empty admin }">
						<a href="${conPath }/loginView.do?next=boardWriteView.do"> 글
							작성을 위해 로그인을 해주세요. </a>
					</c:if></td>
			</tr>
		</table>
		<h2>후기게시판★</h2>
		<hr>
		<br>
		<table>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>글제목</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			<c:if test="${totCnt == 0 }">
				<tr>
					<td colspan="5">해당 페이지의 글이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${totCnt != 0 }">
				<c:forEach items="${reviewList }" var="review">
					<tr>
						<td>${review.rvno }</td>
						<td>${review.mid }${review.aid }</td>
						<td>${review.rvtitle } 
							<c:if test="${not empty review.rvfilename }">
								<img src="https://cdn-icons-png.flaticon.com/512/5088/5088374.png" width="10">
							</c:if>
						</td>
						<td>${review.rvhit }</td>
						<td>
							<fmt:formatDate value="${review.rvrdate }" pattern="yy년MM월dd일(E)" />
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<!-- 페이징처리 -->
		<div class="paging">
			<c:if test="${startPage > BLOCKSIZE }">
				[ <a href="${conPath }/reviewlList.do?pageNum=${startPage-1}">
					이전 </a> ]
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i == pageNum }">
					<b> [ ${i } ] </b>
				</c:if>
				<c:if test="${i != pageNum }">
					[ <a href="${conPath }/reviewlList.do?pageNum=${i}"> ${i } </a> ]
				</c:if>
			</c:forEach>
			<c:if test="${endPage<pageCnt }">
			  [ <a href="${conPath }/reviewlList.do?pageNum=${endPage+1}"> 다음
				</a> ]
			</c:if>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>