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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$(function() {
		$('#aid').keyup(function() {
			var aid = $(this).val();
			if (aid.length < 2) {
				$('#aidConfirmResult').text('아이디는 2글자 이상 입니다');
			} else {
				$.ajax({
					url : '${conPath}/adminConfirm.do.',
					type : 'get',
					data : 'aid=' + aid,
					dataType : 'html',
					success : function(data) {
						$('#aidConfirmResult').html(data);
					},
				});
			}
		}); // key up event
}
</script>
</head>
<body>
	<form action="${conPath }/adminjoin.do" method="post">
		<div id="content_form">
			<table>
				<caption>관리자등록</caption>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="aid" id="aid" required="required">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="apw" id="apw" required="required">
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type="password" name="apwChk" id="apwChk" required="required">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="aname" required="required">
					</td>
				</tr>
				<tr>
					<th>관리자코드</th>
					<td>
						<input type="password" name="acode" required="required">
					</td>
				</tr>
				<tr>
                    <td colspan="2">
                        <input type="submit" value="등록하기" class="btn">
                    </td>
               </tr>
			</table>
		</div>
	</form>
</body>
</html>