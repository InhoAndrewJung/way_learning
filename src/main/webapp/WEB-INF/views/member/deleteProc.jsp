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


<title>Insert title here</title>
</head>
<script type="text/javascript">
	function toMain() {
		location.href = "${pageContext.request.contextPath}/index";
	}
</script>



<body>



	<div class="row">
		<div class="col">
			<h2>회원탈퇴가 되었습니다.</h2>

		</div>
	</div>
	<br>
	<div class="row">
		<p class="lead col">다시 만나길 기원해요 :-)</p>
		<hr class="my-4">
	</div>
	<div class="row">
		<div class="lead col">
			<input type="button" class="btn btn-primary btn-lg"
				value="3초 후 메인으로 이동합니다." style="width: 300px;" onclick="toMain()">




		</div>
	</div>


</body>
</html>