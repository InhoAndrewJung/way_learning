<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@include file="../include/common.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/member/myPage.css">
<link rel="stylesheet" href="${path}/resources/css/mycourse.css">
<link rel="stylesheet" href="${path}/resources/css/board/board.css">
<script>
showCourse(${list[0].courseNo})
function showCourse(courseNo){
  console.log(typeof courseNo)
  if(typeof courseNo == 'undefined') console.log('empty')
  else {
    $.ajax({
        type: "post",
        url: "${path}/course/showCourse?courseNo="+courseNo,
        data:"${_csrf.parameterName}=${_csrf.token}",
        success: function(result){
        $("#showContent").html(result);
      }
    });
  }
}
</script>
<section class="page_block">
	<style type="text/css">
	.mypage_content {
		margin-top: 50px;
		position: relative;
		display: inline-block;
		vertical-align: top;
		text-align: center;
		margin-bottom: 30px;
		width: 68%;
    max-width: 600px;
	}
	.nav_mypage_list {
		margin-top:50px;
	}
	</style>
  <section class="nav_lesson_list nav_mypage_list">
		<h1 style="color:white;"></h1>
		<ul>
      <c:forEach var="cvo" items="${list}">
        <li onclick="showCourse(${cvo.courseNo})">${cvo.courseName}</li>
      </c:forEach>
		</ul>
	</section>
	<section class="mypage_content" id="showContent">
	</section>
</section>

<%@ include file="../include/footer.jsp"%>
