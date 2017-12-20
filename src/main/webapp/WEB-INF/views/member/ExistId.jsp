<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/common.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/member/existId.css">
<script type="text/javascript">
$(document).ready(function(){
	$("#ExistIdForm").submit(function(){			
		if($("#ExistIdForm :input[name=userId]").val().trim()==""){
			alert("ID를 입력하세요");				
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

<c:if test="${result == false}">
	<script type="text/javascript">
		alert("존재하지 않는 아이디 입니다.");
	</script>
</c:if>
<body>

<div class="container">
	<div class="logo"><img src="${path}/resources/img/logo_black.png" id="image_logo" onclick="toMain()"></div>
	
	<form action="${pageContext.request.contextPath}/member/idCheckforPass?${_csrf.parameterName}=${_csrf.token}" id="ExistIdForm">
	<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}">	
	<div class="container-body">
		 
			<div class="body">
				<div class="title">
				Find Password !
				</div>
				<div class="input_userId">
					<input name="userId"  placeholder="ID" class="text_userId">
				</div>
			</div>
			<div class="container-footer">
				
				<input type="image" src="${pageContext.request.contextPath}/resources/img/check.png" class="image_check">
				<img src="/learning/resources/img/cancel.png" class="image_cancel" onclick="toLogin()">
		
			</div>
	</div>
	</form>
</div>
</body>
</html>