<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/common.jsp"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
<link rel="stylesheet" href="${path}/resources/css/member/updateForm.css">
</head>
<body>
<div class="container">
	<div class="logo"><img src="${path}/resources/img/google.png" id="image_logo" onclick="toMain()"></div>
	<div class="update_result-container">
		<div class="update_result-container-body">
		
				<div class="update_result-body">
			
					<div class="update_result-title">
						회원탈퇴 완료!
					</div>
					<div class="update_result-message">
						다시 만나길 기다다릴께요 <br> 건강하세요 :-)
					</div>
				</div>
			</div>
			
			<div class="update_result-container-footer">
				<a href="javascript:logout();">
					<img src="/learning/resources/img/ok-arrow.png" class="update_result-image_main">
				</a>		
			</div>
		<form id="logoutFrm" action="${path}/member/logout" method="post" style:"display:none">
			<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token }">
		</form>
	</div>
</div>
</body>
</html>