<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/common.jsp"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function logout() {
		document.getElementById("logoutFrm").submit();
	}
</script>

<title>Insert title here</title>
</head>


<body>
	<div class="row">
		<h2>회원탈퇴가 되었습니다.</h2>
	</div>
	<br>
	<p class="lead col">다시 만나길 기원해요 :-)</p>
	<div>
		<a href="javascript:logout();">메인화면으로 이동합니다.</a>
	</div>
	<form id="logoutFrm" action="${path}/member/logout" method="post"style:"display:none">
		<input type="hidden" name="${_csrf.parameterName }"
			value="${_csrf.token }">
	</form>
</body>
</html>