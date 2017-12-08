<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
  
<%@ include file="./include/common.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<style type="text/css">
	a{text-decoration:  none;}
	ul,li{list-style:none;}
</style>
<script type="text/javascript">
	function logout() {
		document.getElementById("logoutFrm").submit();
	}
</script>

<script>

$(document).ready(function() {
$.ajax({
	type: "post",
	url: "${pageContext.request.contextPath}/course/selectAccetpedCourseList",
	data:"${_csrf.parameterName}=${_csrf.token}",
	success: function(result){
		
$('#acceptedCourse').html(result);
		
	
			
			//$('#boardGood'+item).css({'width':500});
			// $('#boardGood'+item).attr('src' ,'/learning/resources/img/arrowUpGood.png');	
		

		
		//alert("likeUp ajax result:"+result);
		
		
		
	}
	
});

});
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
			<li><a href="${path}/admin/main">ADMIN Cafe Enterance</a></li>
			
		</sec:authorize>
		
		<!--  일반 회원이거나 관리자인 두 경우. 두개 이상의 role을 비교할때 hasAnyRole()-->
		<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MEMBER','ROLE_AUTHOR')">
		
			
			
			<b>마이페이지용</b><br>
			<li><a href="${pageContext.request.contextPath}/member/showMyRecord">내가 푼 문제 기록</a><li>
			<li><a href="${path}/member/updateForm">정보 수정 폼</a></li>
			<li><a href="${path}/member/delete">회원 탈퇴</a></li>
			<li><a href="${pageContext.request.contextPath}/member/showAllRanking">전체 랭킹보기</a><li>
			<li><a href="${pageContext.request.contextPath}/member/myFavoriteList">내 좋아요 목록 링크</a><li>
			
			<b>게시판용</b><br>
			<li><a href="${pageContext.request.contextPath}/board/tech/write">tech게시글쓰기</a><li>	
			<li><a href="${pageContext.request.contextPath}/board/tech/list">tech게시판목록</a><li>
			<li><a href="${pageContext.request.contextPath}/board/qna/write">qna게시판 글쓰기</a><li>
			<li><a href="${pageContext.request.contextPath}/board/qna/list">qna게시판목록</a><li>
			
			<b>문제 용</b> <br>
			<li><a href="${pageContext.request.contextPath}/question/general/getList">제너럴 문제 리스트</a><li>
			<li><a href="${pageContext.request.contextPath}/question/general/makeQuestion">제너럴 문제 만들기</a><li>
			<li><a href="${pageContext.request.contextPath}/question/essay/getList">에세이 문제 리스트</a><li>
			<li><a href="${pageContext.request.contextPath}/question/essay/makeQuestion">에세이 만들기</a><li>

			
			
			<b>코스용</b><br>
			<li><a href="${pageContext.request.contextPath}/course/writeCourse">코스등록</a><li>
			<li><a href="${pageContext.request.contextPath}/course/showMyCourseList">내가 등록한 코스 리스트 </a><li>
			
			<b>강의용</b><br>
			<li><a href="${pageContext.request.contextPath}/lectureBoard/writeLecture">강의등록</a><li>
			<li><a href="${pageContext.request.contextPath}/lectureBoard/showLectureList?courseNo=1">내가 등록한 강의 리스트 </a><li>
			
		</sec:authorize>
		<li><a href="javascript:logout();">로그아웃</a></li>
	</sec:authorize>
<p>

<!--  
1. 로그아웃은 스프링 시큐러티 4부터는 로그아웃시 post 방식으로 이동하며 
  /logout url로 요청한다(따로 정의하지 않으면...)
2. _csrf 를 요청 파라미터로 보내야 한다.
-->


<b>승인된 코스 !!!</b>
<div id="acceptedCourse"></div>



<form id="logoutFrm" action="${path}/member/logout" method="post" style:"display:none">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
</form>
</body>
</html>