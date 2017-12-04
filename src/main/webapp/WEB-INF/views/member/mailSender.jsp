<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script>
	function passCheck() {
		alert("임시 비밀번호가 전송되었습니다. 이메일에서 확인해주세요");
	}
</script>

<body>

	<h2>본인확인 이메일로 인증</h2>
	<hr>
	<p>* 본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 임시 비밀번호를 받을 수 있습니다.</p>
	<form action="${pageContext.request.contextPath}/member/mailSender?
	${_csrf.parameterName}=${_csrf.token}" id="ExistIdForm" method="post"
	 name="mailSenderForm"	id="mailSenderForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 
		<input type="hidden" name="userId" value="${userId}"> 
		<input type="hidden" name="result" value="${result}"> 
		이메일: <input type="text" name="email"
			id="InputEmail" >
		<p></p>
		<button type="submit"  value="sendEmail"
			onclick="passCheck()">임시 비밀번호 받기</button>
	</form>


</body>
</html>