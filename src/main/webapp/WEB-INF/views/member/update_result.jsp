<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%-- spring security custom tag를 사용하기 위한 선언 --%>
 <%@ include file="../include/common.jsp" %>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="${path}/resources/css/member/updateForm.css">
<body>
<div class="container">
	<div class="logo"><img src="${path}/resources/img/google.png" id="image_logo" onclick="toMain()"></div>
	<div class="update_result-container">
		<div class="update_result-container-body">
		
				<div class="update_result-body">
			
					<div class="update_result-title">
						<sec:authentication property="principal.userId"/> 님!
					</div>
					<div class="update_result-message">
						회원정보 수정완료!
					</div>
				</div>
			</div>
			
		<div class="update_result-container-footer">
				<a href="${pageContext.request.contextPath}/" >
					<img src="/learning/resources/img/ok-arrow.png" class="update_result-image_main">
				</a>		
		</div>
	</div>
</div>
</body>

