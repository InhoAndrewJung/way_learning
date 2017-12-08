<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="../include/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${path}/resources/css/findId.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#findIdForm").submit(function(){			
		if($("#findIdForm :input[name=email]").val().trim()==""){
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


</script>
</head>
<body>
<div class="container">
	<div class="logo"><img src="${path}/resources/img/google.png" id="image_logo" onclick="toMain()"></div>
		
	<div class="container-body">
		<form action="${pageContext.request.contextPath}/member/findIdProc?${_csrf.parameterName}=${_csrf.token}" id="findIdForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 
			<div class="body">
				<div class="title">
				Find ID !
				</div>
				<div class="input_email">
					<input name="email" placeholder="E-mail" class="text_email">
				</div>
			</div>
			<div class="container-footer">
				
				<input type="submit" value="" class="image_check">
				<img src="/learning/resources/img/cancel.png" class="image_cancel" onclick="toLogin()">
		
			</div>
		
		</form>
	</div>
		
</div>
</body>
</html>