<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp" %>
<sec:authorize access="isAuthenticated()">
<sec:authentication var="mvo" property="principal" /> 



 <form method="post" action="${pageContext.request.contextPath}/member/updateMember?${_csrf.parameterName}=${_csrf.token}"  enctype="multipart/form-data">
		
<style>

img{width:100px; height:100px; border-radius: 30% }

</style>		


		<img src="${path}/resources/upload/${mvo.imgProfile}" > <br>
		아이디 : <input type="text" name="userId" value="${mvo.userId}" readonly>
		<br>패스워드 : <input type="text" name="password" >
		<br>이메일 : <input type="text" name="email" value="${mvo.email}" >	
		<br>프로필 사진 :  <input type="file" name="uploadFile" id="uploadFile" />	
	
		<br><input type="submit" value="회원정보수정">
		</form>
</sec:authorize>
<h3>회원정보수정</h3>
		
