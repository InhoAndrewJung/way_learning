<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
  
<%@ include file="./include/common.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="/resources/css/board.css">
<title>Insert title here</title>

<style type="text/css">
	a{text-decoration:  none;}
</style>
<script type="text/javascript">
	function logout() {
		document.getElementById("logoutFrm").submit();
	}
</script>

</head>
<body>
<h2>Spring Security를 이용한 Register Member</h2>
<sec:authorize access="isAnonymous()">
<ul>
	<li><a href="${path}/member/registerForm">회원 가입 하기</a></li>
	<li><a href="${path}/member/loginForm">로그인 하기</a></li>
	

</ul>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
	<sec:authentication var="mvo" property="principal" /> 
	<b>${mvo.userId}님 환영합니다.</b><p>

	<b>${mvo}님 환영합니다.</b><p>
	
	<!-- 
		authentication의 getPrincipal().getName() ::
		Principal은 Provider 에서 Authentication에 넣어준 VO(생성자의 첫 매개변수)
	 -->		
</sec:authorize>
<p></p>
<!-- 인증됬으면 -->
	<sec:authorize access="isAuthenticated()">
		<!-- 관리자인 경우 -->
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<li><a href="${path}/member/enterCafe">ADMIN Cafe Enterance</a></li>
			
		</sec:authorize>
		
		<!--  일반 회원이거나 관리자인 두 경우. 두개 이상의 role을 비교할때 hasAnyRole()-->
		<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')">
			<li><a href="${path}/member/updateForm">정보 수정 폼</a></li>
<<<<<<< HEAD
			<li><a href="${pageContext.request.contextPath}/board/tech/write"><img alt="게시판 글쓰기" src="${pageContext.request.contextPath}/img/write_btn.jpg" border="0"></a><li>
			<li><a href="${pageContext.request.contextPath}/board/tech/list">게시판목록<img alt="게시판 목록" src="${pageContext.request.contextPath}/img/list_btn.jpg" border="0"></a><li>
			<li><a href="${pageContext.request.contextPath}/board/qna/list">Q&A<img alt="게시판 목록" src="${pageContext.request.contextPath}/img/list_btn.jpg" border="0"></a><li>

=======
			<li><a href="${pageContext.request.contextPath}/board/tech/write"></a><li>
			<li><a href="${pageContext.request.contextPath}/board/qna/list">qna게시판목록</a><li>
			<li><a href="${pageContext.request.contextPath}/board/tech/list">tech게시판목록</a><li>
			<li><a href="${pageContext.request.contextPath}/question/general/getList">제너럴 문제 리스트</a><li>
			<li><a href="${pageContext.request.contextPath}/question/essay/getList">에세이 문제 리스트</a><li>
			<li><a href="${pageContext.request.contextPath}/question/essay/makeQuestion">에세이 만들기</a><li>
			<li><a href="${pageContext.request.contextPath}/member/showMyRecord">내가 푼 문제 기록</a><li>
			<li><a href="${pageContext.request.contextPath}/member/myFavoriteList">내 좋아요 목록 링크</a><li>
			<li><a href="${pageContext.request.contextPath}/member/showAllRanking">전체 랭킹보기</a><li>
>>>>>>> master
		</sec:authorize>
		<li><a href="javascript:logout();">로그아웃</a></li>
	</sec:authorize>
<p>

<!--  
1. 로그아웃은 스프링 시큐러티 4부터는 로그아웃시 post 방식으로 이동하며 
  /logout url로 요청한다(따로 정의하지 않으면...)
2. _csrf 를 요청 파라미터로 보내야 한다.
-->
<form id="logoutFrm" action="${path}/member/logout" method="post" style:"display:none">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
</form>
</body>
</html>