<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/common.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/member/findIdProc.css">
</head>
<body>
<form action="${pageContext.request.contextPath}/member/findIdByEmail?${_csrf.parameterName}=${_csrf.token}" id="findIdProc">
<div class="container">
	<div class="logo"><img src="${path}/resources/img/google.png" id="image_logo" onclick="toMain()"></div>
	
	<c:choose>
		<c:when test="${findIdResult == 'fail'}">	
			<div class="container-body">
		
					<div class="body">
			
							<div class="title">
							Your ID is<p class="getUserId">${userId}</p>
							</div>
						<div class="go-SignIn">
							<a href="${pageContext.request.contextPath}/member/loginForm"> Go to Sign in !</a>
						</div>
					</div>
			</div>
			
			<div class="container-footer_pass">
				Password?<br>
				<a href="${pageContext.request.contextPath}/member/ExistId"> 
					<img src="/learning/resources/img/keyword.png" class="image_findPass">
				</a>
			</div>
		</c:when>
				
		<c:otherwise>
																		
			<div class="container-body">
		
				<div class="body">
			
					<div class="title">
					Sorry, I can't find it.. <br>Try Again!
					</div>
				</div>
			</div>
			
			<div class="container-footer">
				<a href="${pageContext.request.contextPath}/member/findId" >
					<img src="/learning/resources/img/back-arrow.png" class="image_back">
				</a>		
			</div>
		</c:otherwise>
	</c:choose>
			
	
</div>
		
</form>
</body>
</html>