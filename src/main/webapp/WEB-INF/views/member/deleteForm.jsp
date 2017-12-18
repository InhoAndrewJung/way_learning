<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ include file="../include/common.jsp" %>
<link rel="stylesheet" href="${path}/resources/css/member/findIdProc.css">
<script type="text/javascript">
function submit(){
	document.getElementById("deleteForm").submit();
}
function toMain() {
	 location.href = "${pageContext.request.contextPath}";
}
</script>

<div class="container">
	<%-- <div class="logo"><img src="${path}/resources/img/google.png" id="image_logo" onclick="toMain()"></div> --%>
    <h2 class="mypage_title">탈퇴하기</h2>

	<form name="deleteForm" method="post" action="${pageContext.request.contextPath}/member/deleteProc"	id="deleteForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<sec:authorize access="isAuthenticated()">
			<sec:authentication var="mvo" property="principal" />
			<input type="hidden" name="userId" value="${mvo.userId}">
		</sec:authorize>
			<div class="container-body">

				<div class="body">

					<div class="title">
					정말로 떠나실 건가요 ??
					</div>
				</div>
			</div>

			<div class="container-footer">
				<p onclick="submit()" class="yes">YES..</p><br>
				<p onclick="toMain()" class="no">Not Yet!</p>
			</div>
	</form>

</div>
</body>
</html>