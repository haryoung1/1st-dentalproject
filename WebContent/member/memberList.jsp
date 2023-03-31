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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
#wrap td {
	text-align: center;
	font-weight: bold;
}
</style>
<script>
	$(document).ready(function() {
		$('tr').click(function() {
			var mid = $(this).children().eq(1).html();
			if (mid != 'mid') {
				location.href = '${conPath}/MListContent.do?mid=' + mid;
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<h3>회원목록</h3>
		<hr>
		<br>
		<table>
			<tr>
				<th>사진</th>
				<th>이름</th>
				<th>ID</th>
				<th>생년월일</th>
				<th>가입일</th>
				<th>주소</th>
			</tr>
			<c:if test="${memberList.size() eq 0 }">
				<tr>
					<td colspan="4">가입한 회원이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${memberList.size() != 0 }">
				<c:forEach var="dto" items="${memberList }">
					<tr>
						<td colspan="1"><img
							src="${conPath }/memberPhotoUp/${dto.mphoto}"
							alt="${dto.mname }사진" width="120"></td>
						<td>${dto.mname }</td>
						<td>${dto.mid }</td>
						<td><fmt:formatDate value="${dto.mbirth }"
								pattern="YYYY-MM-dd" /></td>
						<td><fmt:formatDate value="${dto.mrdate }" pattern="YY-MM-dd" />
						</td>
						<td>${dto.maddress }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<br>
		<!-- 페이징처리 -->
		<div class="paging">
			<c:if test="${startPage > BLOCKSIZE }">
				[ <a href="${conPath }/memberList.do?pageNum=${startPage-1}"> 이전
				</a> ]
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i eq pageNum }">
					<b> [ ${i } ] </b>
				</c:if>
				<c:if test="${i != pageNum }">
					[ <a href="${conPath }/memberList.do?pageNum=${i}"> ${i } </a> ]
				</c:if>
			</c:forEach>
			<c:if test="${endPage<pageCnt }">
			  [ <a href="${conPath }/memberList.do?pageNum=${endPage+1}"> 다음
				</a> ]
			</c:if>
		</div>
	</div>
	<br>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>