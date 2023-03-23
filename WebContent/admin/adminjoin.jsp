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
<link href="${conPath}/css/member/join.css" rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$(function() {
		$('#aid').keyup(
				function() {
					var aid = $(this).val();
					if (aid.length < 2) {
						$('#aidConfirmResult').html(
								'<p style=color:blue;>아이디는 2글자 이상 입니다');
					} else {
						$.ajax({
							url : '${conPath}/aidConfirm.do',
							type : 'get',
							data : 'aid=' + aid,
							dataType : 'html',
							success : function(data) {
								$('#aidConfirmResult').html(data);
							},
						});
					}
				}); // key up event
		$('#apw, #apwChk').keyup(function() {
			var apw = $('#apw').val();
			var apwChk = $('#apwChk').val();
			if (apw == apwChk) {
				$('#apwChkResult').html('<p style=color:blue;>비밀번호가 일치 합니다');
			} else {
				$('#apwChkResult').html('<b>비밀번호가 일치 하지 않습니다</b>');
			}
		}); // key up event (비번 일치 확인용)

		// "사용 가능한 ID 입니다" (aidConfirmResult), "비밀번호 일치(#apwChkResult)" 가 출력되었을 경우만 submit
		$('form').submit(function() {
			var aidConfirmResult = $('#aidConfirmResult').text().trim();
			var apwChkResult = $('#apwChkResult').text().trim();
			var acodeChkResult = $('#acodeChkResult').text().trim();
			if (aidConfirmResult != '사용가능한 ID 입니다') {
				alert('사용 가능한 id인지 확인하세요')
				return false; // submit 제한
			} else if (apwChkResult != '비밀번호가 일치 합니다') {
				alert('비밀번호를 확인하세요');
				$('input[name="apw"]').focus();
				return false;
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<form action="${conPath }/adminjoin.do" method="post">
		<div id="content_form">
			<table>
				<caption>관리자등록</caption>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="aid" id="aid" required="required">
						<div id="aidConfirmResult">&nbsp; &nbsp; &nbsp;</div></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="apw" id="apw"
						required="required"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="apwChk" id="apwChk"
						required="required">
						<div id="apwChkResult">&nbsp; &nbsp; &nbsp;</div></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="aname" required="required">
					</td>
				</tr>
				<tr>
					<th>관리자코드</th>
					<td><input type="password" name="acode" required="required"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="등록하기" class="btn">
					</td>
				</tr>
			</table>
		</div>
	</form>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>