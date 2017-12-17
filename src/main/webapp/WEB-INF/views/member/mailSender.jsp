<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/common.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/member/mailSender.css">
</head>
<script type="text/javascript">
$(document).ready(function(){
	$("#ExistIdForm").submit(function(){			
		if($("#ExistIdForm :input[name=email]").val().trim()==""){
			alert("이메일을 입력하세요");				
			return false;
		}
	})	
});//submit


function toMain() {
	 location.href = "${pageContext.request.contextPath}";
}

function toLogin() {
	 location.href = "${pageContext.request.contextPath}/member/loginForm";
}

function passCheck() {
	alert("임시 비밀번호가 전송되었습니다. 이메일에서 확인해주세요");
}

</script>
</head>
<body>
<div class="container">
	<div class="logo"><img src="${path}/resources/img/google.png" id="image_logo" onclick="toMain()"></div>
	<div class="container-body">
	<form action="${pageContext.request.contextPath}/member/mailSender?${_csrf.parameterName}=${_csrf.token}" id="ExistIdForm" method="post" name="mailSenderForm"	id="mailSenderForm">	
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 
	<input type="hidden" name="userId" value="${userId}"> 
	<input type="hidden" name="result" value="${result}"> 	
	
			<div class="body">
				<div class="title">
					임시비밀번호를 보내드릴께요.<p>계정 생성시 등록한 E-mail을</p>입력해주세요!			
				</div>
				<div class="input_email">
					<input name="email" placeholder="E-mail" class="text_email">
				</div>
			</div>
			<div class="container-footer">
				
				<input type="image" src="${pageContext.request.contextPath}/resources/img/check.png" class="image_check" onclick="passCheck()">
				<img src="/learning/resources/img/cancel.png" class="image_cancel" onclick="toLogin()">
		
			</div>
		
		</form>
	</div>
		
</div>
</body>
</html>