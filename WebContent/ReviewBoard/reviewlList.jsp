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

#right {
	text-align: right;
	margin: 20px;
}

.btn {
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color: #ffffff;
	border-radius: 6px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	cursor: pointer;
	color: #666666;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 6px 24px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #ffffff;
}

.btn:hover {
	background: linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	background-color: #f6f6f6;
}

.btn:active {
	position: relative;
	top: 1px;
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
											var rvno = $(this).children().eq(0)
													.text();
											if (!isNaN(rvno)) {
												location.href = '${conPath }/reviewContent.do?rvno='
														+ rvno
														+ '&pageNum=${pageNum}';
											}
										});
					});
</script>
</head>
<body>
	<c:if test="${not empty reviewResult}">
		<!--  글쓰기 성공 -->
		<script>
			alert('${reviewResult}')
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<br>
		<h2>후기&nbsp;게시판</h2>
		<hr>
		<br> <br>
		<table>
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회</th>
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
						<td>${review.rvtitle }<c:if
								test="${not empty review.rvfilename }">
								<img
									src="https://cdn-icons-png.flaticon.com/512/5088/5088374.png"
									width="10">
							</c:if>
						<td>${review.mid }</td>
						<td><fmt:formatDate value="${review.rvrdate }"
								pattern="yyyy-MM-dd(E)" /></td>
						<td>${review.rvhit }<c:if test="${review.rvhit > 10 }">
								<img src="${conPath }/image/hot.gif">
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<br>
		<div class="paging">
			<!-- 페이징처리 -->
			<c:if test="${startPage > BLOCKSIZE }">
				[ <a href="${conPath }/reviewList.do?pageNum=${startPage-1}"> 이전
				</a> ]
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i == pageNum }">
					<b> [ ${i } ] </b>
				</c:if>
				<c:if test="${i != pageNum }">
					[ <a href="${conPath }/reviewList.do?pageNum=${i}"> ${i } </a> ]
				</c:if>
			</c:forEach>
			<c:if test="${endPage<pageCnt }">
			  [ <a href="${conPath }/reviewList.do?pageNum=${endPage+1}"> 다음
				</a> ]
			</c:if>
		</div>
		<div id="right">
			<!-- 글등록 버튼 -->
			&nbsp;
			<c:if test="${not empty member }">
				<input type="button" class="btn" value="글쓰기"
					onclick="location='${conPath}/reviewWriteView.do'">
			</c:if>
			<c:if test="${empty member and empty admin }">
				<input type="button" class="btn" value="글쓰기"
					onclick="location='${conPath}/loginView.do?next=reviewWriteView.do'">
			</c:if>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>