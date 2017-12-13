<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>회원탈퇴</title>


</head>
<body>

<div align="center">


	<form name="deleteForm" method="post"
		action="${pageContext.request.contextPath}/member/deleteProc"
		id="deleteForm">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}">
		<sec:authorize access="isAuthenticated()">
			<sec:authentication var="mvo" property="principal" />
			<input type="hidden" name="userId" value="${mvo.userId}">
		</sec:authorize>
		<h2 align="center">회원탈퇴 페이지</h2>
		<hr>
		<table width="260" border="1" align="center">
			<tr>
				<td colspan="2" align="center"><b>회원 탈퇴</b></td>
			</tr>
			<tr>
				<td>정말 탈퇴 하시겠습니까?</td>
			</tr>

			<td colspan="2" align="center"><input type="submit" value="회원탈퇴">
			 <input type="button" value="취소 "></td>
			</tr>
			
		</table>
	</form>

	<a href="${path}/"> 메인페이지로 이동</a>
	</div>

</body>
</html>