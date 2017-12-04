<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>아이디 찾기</title>

</head>
<div class="col-sm-10 text-center">
	<h2 class="title">아이디 찾기</h2>
	<hr>
	<p>* 이메일로 인증</p>
	<form
		action="${pageContext.request.contextPath}/member/findIdProc?${_csrf.parameterName}=${_csrf.token}"
		id="findIdForm">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}"> 
		email <input type="text" name="email"><br><br>
		<button type="submit" id="findId">아이디 찾기</button>
		<button type="reset">취소</button>
	</form>
</div>
</body>
</html>
