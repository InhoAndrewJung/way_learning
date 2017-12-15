<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@include file="../include/common.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/member/myPage.css">
<script>
showContent('updateForm');
function showContent(page){
$.ajax({
		type: "post",
		url: "${path}/member/"+page,
		data:"${_csrf.parameterName}=${_csrf.token}",
		success: function(result){
			$("#showContent").html(result);
		}
	});
}
function showActiveMember(){
	$.ajax({
		type: "post",
		url: "${path}/admin/selectActiveMember",
		data:"${_csrf.parameterName}=${_csrf.token}",
		success: function(result){
				$("#showContent").html(result);
		}
	});
}
function showAllCourse(){
	$.ajax({
		type: "post",
		url: "${path}/admin/selectAllCourseList",
		data:"${_csrf.parameterName}=${_csrf.token}",
		success: function(result){
			$("#showContent").html(result);
		}
	});
}
</script>
<section class="page_block">
	<style type="text/css">
	.mypage_content {
		margin-top: 50px;
		position: relative;
		display: inline-block;
		vertical-align: top;
		text-align: left;
		margin-bottom: 30px;
		width: 68%;
    max-width: 600px;
	}
	.nav_mypage_list {
		margin-top:50px;
	}
	</style>
	<section class="nav_lesson_list nav_mypage_list">
		<h1>MYPAGE</h1>
		<ul>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
			<li onclick="showActiveMember()" id="showActive" >활동멤버 선택</li>
			<li onclick="showAllCourse()"  id="showAll">강의 승인 선택</li>
			</sec:authorize>
			<li onclick="showContent('showMyRecord')">내가 푼 문제 기록</li>
			<li onclick="showContent('showAllRanking')">전체 랭킹보기</li>
			<li onclick="showContent('myFavoriteList')">내 좋아요 목록 링크</li>
			<li onclick="showContent('showMyLectureRecord')">나의 강의 기록 보기 </li>
			<li onclick="showContent('updateForm')">정보 수정 폼</li>
			<li onclick="showContent('deleteForm')">회원 탈퇴</li>
		</ul>
	</section>
	<section class="mypage_content" id="showContent">
	</section>
</section>

<%@ include file="../include/footer.jsp"%>
