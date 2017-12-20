<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/common.jsp"%>
<%@ include file="../include/header.jsp"%>

<link rel="stylesheet" href="${path}/resources/css/member/myPage.css">
<link rel="stylesheet" href="${path}/resources/css/mycourse.css">
<link rel="stylesheet" href="${path}/resources/css/board/board.css">
<script type="text/javascript">
function content_submit(){
	var f=document.write_form;
	if(f.courseName.value==""){
		alert("코스명을 입력하세요!");
		f.courseName.focus();
		return;
	}

	if(f.tags.value==""){
		alert("태그를 입력하세요!");
		f.tags.focus();
		return;
	}

	/* if(f.content.value==""){
		alert("내용을 입력하세요!");
		f.content.focus();
		return;
	} */
	f.submit();
}

</script>

<style>

.image_check{
	cursor:pointer;
	width: 50px;
    margin-right: 20px;
    float:right;
}

	.mypage_content {
		margin-top: 50px;
		position: relative;
		vertical-align: top;
		text-align: center;
		margin-bottom: 30px;
		max-width: 600px;
		min-width:unset;
	}
	.nav_mypage_list {
		margin-top:50px;
	}

</style>

<div class="common-container mypage_content">
<h2 class="mycourse-title">코스등록</h2>

<form action="${pageContext.request.contextPath}/course/insertCourse?${_csrf.parameterName}=${_csrf.token}" method="post" name="write_form" enctype="multipart/form-data">
	<input type="file" name="uploadFile" id="uploadFile" class="uploadFile" style="display:none;">
	<img id="file_preview" class="mycourse-image common-card" src="${path}/resources/img/logo.png">
	<label for="uploadFile" style="padding:8px;margin-bottom:20px;" class="common-hover-btn">코스 이미지</label>
	<hr>

	<label for="courseName">코스명</label><input class="common-card" type="text" id="courseName" name="courseName" placeholder="코스명을 입력해주세요" size="100">

	<label for="description">코스설명</label>
	<%-- <input class="common-card"  type="text" name="description" maxlength="200" size="200" placeholder="코스 설명을 입력해주세요" value="${cvo.description }"> --%>
	<textarea class="common-card" name="description" id="description" placeholder="코스설명을 입력해주세요"></textarea>



	<label for="tags">태그</label><input class="common-card" type="text" id="tags" name="tags" maxlength="200" size="200" placeholder="코스 태그를 입력해주세요" >

	<input type="button" class="common-btn" value="등록" onclick="content_submit()">
</form>
</div>


<%-- <div align="center">
<br/><br/><br/><br/><br/><br/>
	<font face="HY나무L" size="5"><strong>코스등록 <br>
		<br></strong></font>
	<form
		action="${pageContext.request.contextPath}/course/insertCourse?${_csrf.parameterName}=${_csrf.token}"
		method="post" name="write_form" enctype="multipart/form-data">
		   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 


		<table class="boardTable" style="width:300px;text-align: center">
			<tr class="table-center" style="height:40px">
				<td nowrap>코스이름</td>
				<td><input class="input-blue" type="text" name="courseName"
					placeholder="코스명을 입력해주세요" size="100" ></td>
			</tr>

			<tr class="table-center" style="height:40px">
				<td nowrap>코스 설명</td>
				<td><input  class="input-blue" type="text" name="description" maxlength="200" size="100"
					placeholder="코스 설명을 입력해주세요"></td>
			</tr>
			<tr class="table-center" style="height:40px">
				<td nowrap> 태  그</td>
				<td><input  class="input-blue" type="text" name="tags" maxlength="200" size="100"
					placeholder="코스 태그를 입력해주세요"></td>
			</tr>
			<tr class="table-center" style="height:40px">
				<td nowrap>코스 이미지</td>
				<td><input type="file" name="uploadFile" ></td>
			</tr>


			<tr class="table-center"  style="height:40px">
				<td colspan="2"><img
						src="${pageContext.request.contextPath}/resources/img/check.png"
						onclick="content_submit()" class="image_check"></td>
			</tr>
		</table>
	</form>
	<!-- 메인으로 이동 -->
				<a href="${path}/">
					<img src="${pageContext.request.contextPath}/resources/img/house.png" id="image_list">
				</a>
				
				<a href="${pageContext.request.contextPath}/course/showMyCourseList">내코스보기</a><br><br>
</div> --%>

</html>
