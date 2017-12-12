<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '154566895162260',
      cookie     : true,
      xfbml      : true,
      version    : 'v2.11'
    });
      
    FB.AppEvents.logPageView();   
      
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
  

  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }
  
  

//Facebook login with JavaScript SDK
  function fbLogin() {
      FB.login(function (response) {
          if (response.authResponse) {
              // Get and display the user profile data
              getFbUserData();
          } else {
              document.getElementById('status').innerHTML = 'User cancelled login or did not fully authorize.';
          }
      }, {scope: 'email'});
  }

  // Fetch the user profile data from facebook
  function getFbUserData(){
      FB.api('/me', {locale: 'ko_KR', fields: 'id,first_name,last_name,email,link,gender,locale,picture'},
      function (response) {
    	  
          document.getElementById('fbLink').setAttribute("onclick","fbLogout()");
          document.getElementById('fbLink').innerHTML = 'Logout from Facebook';
          document.getElementById('status').innerHTML = 'Thanks for logging in, ' + response.first_name + '!';
          document.getElementById('userData').innerHTML = '<p><b>FB ID:</b> '+response.id+'</p><p><b>Name:</b> '+response.first_name+' '+response.last_name+'</p><p><b>Email:</b> '+response.email+'</p><p><b>Gender:</b> '+response.gender+'</p><p><b>Locale:</b> '+response.locale+'</p><p><b>Picture:</b> <img src="'+response.picture.data.url+'"/></p><p><b>FB Profile:</b> <a target="_blank" href="'+response.link+'">click to view profile</a></p>';
          //location.href="${pageContext.request.contextPath}/member/snsLogin?id="+response.id+"&email="+response.email+"&pic="+response.picture.data.url;

          document.getElementById('id').setAttribute("value", response.id);
          document.getElementById('email').setAttribute("value", response.email);
          document.getElementById('pic').setAttribute("value", response.picture.data.url);         
          document.getElementById('snsFrm').submit();
      });
  }

  // Logout from facebook
  function fbLogout() {
      FB.logout(function() {
          document.getElementById('fbLink').setAttribute("onclick","fbLogin()");
          document.getElementById('fbLink').innerHTML = '<img src="fblogin.png"/>';
          document.getElementById('userData').innerHTML = '';
          document.getElementById('status').innerHTML = 'You have successfully logout from Facebook.';
      });
  }
</script>
<title>Insert title here</title>
</head>
<body>
<h2>로그인</h2>
<!--
	c:if
	authentication-failure-url 이동시 사용 코드
	if test="{param.fail='fail'}"
	로그인 실패했습니다. ID 와 PASS를 확인하세요.
	c:if
-->
<c:if test="${not empty requestScope.errorMessage}">
	<span style="color:red">${requestScope.errorMessage }</span>
</c:if>
<!--j_spring_security_check의 기본값은 login  -->
<!-- Display login status -->
<div id="status"></div>

<!-- Facebook login or logout button -->
<a href="javascript:void(0);" onclick="fbLogin()" id="fbLink">페이스북으로 로그인</a>

<!-- Display user profile data -->

<form action="${pageContext.request.contextPath}/member/snsLogin" id="snsFrm" method="post">
<!-- <div id="userData"></div> -->
<input type="hidden" name="id" id="id"/>
<input type="hidden" name="email" id="email"/>
<input type="hidden" name="pic" id="pic"/>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>



<form action="${pageContext.request.contextPath}/j_spring_security_check" method="post">
	
	<table style="width:350px">
		<tr>
			<td width="70px">ID</td>
			<td><input type="text" name="userId" size="30"></td>
		</tr>
		<tr>
			<td>PASSWORD</td>
			<td><input type="password" name="password" size="31"></td>
		</tr>
		<tr>		
		    <td><input type="text" id="userData"/></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="로그인"></td>
		</tr>
		
	
	</table>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	
</form>
<form action="${pageContext.request.contextPath}/member/findIdByEmail?${_csrf.parameterName}=${_csrf.token}"
		id="findIdForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<a href="${pageContext.request.contextPath}/member/findId">아이디</a>&nbsp;|&nbsp;
		<a href="${pageContext.request.contextPath}/member/ExistId">비밀번호 찾기</a>
</form>

</body>
</html>
