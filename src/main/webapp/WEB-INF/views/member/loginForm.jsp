<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="../include/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/member/loginForm.css">
<script type="text/javascript">

function goMain() {
	 location.href = "${pageContext.request.contextPath}";
}


/* titleMoving */

/* var helloBox = [
				"안녕하세요",
				"Hello!",
				"こんにちは。","Bonjour",
				"¡Hola!","Guten Tag","Xin chào","Здравствуйте",
				"Ciao","สวัสดีครับ","สวัสดีครับ ","Apa kabar?",
				".مرحبًا",		
				"Сайн байна уу",			
				""
] ;
			
var christmasBox = [
	"메리크리스마스",
	"Merry Christmas!",
	"メリークリスマス!",
	"Joyeux Noël","¡Feliz Navidad",
	"Fröhliche Weihnachten!","Chúc Giáng Sinh Vui Vẻ!","С Рождеством Христовым! ","Buon Natale!","สุขสันต์วันคริสต์มาส!",
	"Selamat Hari Natal",
	"عيد ميلاد مجي!",
	"Мэрри крисмас!",
	""
] ;
var msg="";
var i;

// messageBox.forEach(printMsg(내용, 순서))
helloBox.forEach(printMsg)
//christmasBox.forEach(printMsg)

function printMsg(item, idx) {
	setTimeout(function(){
		
	
	setTimeout(function() {
		var target = document.getElementById("login-card_title");
		target.innerHTML = item
		
	}, idx * 2000)
	},700)
} */

<c:if test="${not empty requestScope.errorMessage}">
alert('${requestScope.errorMessage }');
</c:if>




</script>
</head>

<body>
<!--
	c:if
	authentication-failure-url 이동시 사용 코드
	if test="{param.fail='fail'}"
	로그인 실패했습니다. ID 와 PASS를 확인하세요.
	c:if
-->

<!--j_spring_security_check의 기본값은 login  -->


<div class="container">
	<div class="helloWord" id="helloWord">
		Hello Word!
	</div>


	<div class = "login-card" id="login-card">
		<div class="login-card_header">
			<div class="login-card_logo">
				<img src="${path}/resources/img/logo.png" class="image_logo" onclick="goMain()"/>
			
			</div>	
		
				<div class="animated-words">
					<h4>안녕하세요</h4>
					<h4>Hello!</h4>
					<h4>こんにちは。</h4>
					<h4>Bonjour</h4>
					<h4>¡Hola!</h4>
					<h4>Guten Tag</h4>
					<h4>Xin chào</h4>
					<h4>Здравствуйте</h4>
					<h4>Ciao</h4>
					<h4>สวัสดีครับ","สวัสดีครับ</h4>	
					<h4>Apa kabar?</h4>
					<h4>.مرحبًا</h4>
					<h4>Сайн байна уу</h4>
				</div>
		</div>	
	
		<div class="login-card_content">
			<form action="${pageContext.request.contextPath}/j_spring_security_check" method="post">
						
			<!-- <div class="login-card_divider">	
				<div class="login-card_divider-text">or</div>		
			</div> -->

				
					<div class="form-row">
						<label class="dashboard-form_group">
							<div class="dashboard-form_label"></div>
							
							<input autofocus="autofocus" class="dashboard-form_input_id"
						 value="" name="userId" id="userId" placeholder="ID">
						</label>
					</div>
					
					<div class="form-row">
						<label class="dashboard-form_group">
							<div class="dashboard-form_label"></div>
							
							<div class="login-card_password">
								<input autocomplete="off" class="dashboard-form_input_pass"
									type="password" name="password" id="userPassword" placeholder="Password">
									
								<div class="login-card_tooltip">
									<div class="login-card_tooltip-content">
										<div class="login-card_tooltip-triangle">
										
											
										If you forgot your password you can look it up in your email inbox!
										</div>
										
									</div>
								</div>
							</div>
						</label>
					</div>
					<div class="form-row">
						<input type="submit" name="commit" value="Sign in" class="button full-width"
							data-disable-with="Sign in">
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				</form>
		
				
				<hr>
	
		</div>
		
		
		<div class="login-card_footer">
			<form action="${pageContext.request.contextPath}/member/findIdByEmail?${_csrf.parameterName}=${_csrf.token}"
		id="findIdForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<div class="noRegister">
				
				Not registered? 
				<a href="${path}/member/registerForm">Sign up</a>
			</div>	
		
		
			<div class="forgot">
				Forgot your <a href="${pageContext.request.contextPath}/member/findId" id="forget">ID</a>
				or				 
				  <a href="${pageContext.request.contextPath}/member/ExistId">Password?</a>
			</div>
			</form>
		</div>
	</div>
</div>
	
	
</body>
</html>