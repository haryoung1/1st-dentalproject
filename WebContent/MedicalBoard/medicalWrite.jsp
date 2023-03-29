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
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 300,
			minHeight : null,
			maxHeight : null,
			lang : 'ko-KR',
			onImageUpload : function(files, editor, welEditable) {
				sendFile(files[0], editor, welEditable);
			}
		});
	});
</script>

<style>
#wrap {
	height: 700px;
}

#content_form {
	height: 420px;
	margin: 80px auto 0px;
}

#content_form table tr {
	height: 60px;
}

#medical {
	padding: 0.5rem 1rem;
	text-align: center;
	font-weight: 380;
	font-weight: bold;
	border-radius: 4px;
	border: 1px solid #444444;
	margin: 45px;
	width: 150px;
}

.btn {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background: white;
	color: black;
	margin: 0;
	padding: 0.5rem 1rem;
	font-weight: 400;
	font-weight: bold;
	text-align: center;
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
</head>
<body>
	<c:if test="${empty member }">
		<script>
			location.href = '${conPath}/loginView.do?next=medicalWriteView.do';
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<div id="content_form">
			<form action="${conPath }/medicalWrite.do" method="post">
				<div id="medical">진료예약 게시판</div>
				<table>
					<tr>
						<td>제목</td>
						<td><input type="text" name="mrtitle" required="required">
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea id="summernote" name="mrcontent"></textarea></td>
					</tr>
					<tr>
						<td colspan="2">
							<button class="btn">저장하기</button>
							<button class="btn"
								onclick="location.href='${conPath}/medicalList.do'">돌아가기</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>