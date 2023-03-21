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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
		$(document).ready(function(){
			$('input[name="apw"], input[name="apwChk"]').keyup(function(){
				var apw = $('input[name="apw"]').val();
				var apwChk = $('input[name="apwChk"]').val();
				if(apw == apwChk){
					$('#apwChkResult').text('비밀번호 일치');
				}else{
					$('#apwChkResult').text('비밀번호 불일치');
				}
			});// mpw key up 이벤트
		});
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
						<input type="text" name="aid" required="required">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="apw" required="required">
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type="password" name="apwChk" required="required">
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