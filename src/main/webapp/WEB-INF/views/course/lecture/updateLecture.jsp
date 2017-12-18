<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../../include/common.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/mycourse.css">

<script type="text/javascript">
function content_submit(){
	var f=document.write_form;
	f.submit();
}
</script>
<style type="text/css">
#cke_content {
	border-radius: 10px;
  overflow: hidden;
}
</style>
<script src="${path}/ckeditor/ckeditor.js"></script>
<div class="mypage_content">
<h1 class="mycourse-title">[${lvo.lectureName }] 수정</h1>
	<form action="${pageContext.request.contextPath}/lectureBoard/updateLecture?${_csrf.parameterName}=${_csrf.token}"
		method="post" name="write_form" enctype="multipart/form-data">

		<label for="lectureName">강의명</label>
		<input class="common-card" type="text" id="lectureName" name="lectureName" placeholder="코스명을 입력해주세요" size="100" value="${lvo.lectureName }">


				<label for="lectureOrder">강의 순서</label>

				<input class="common-card" type="number" name="lectureOrder" id="lectureOrder"  min="1" max="15" value="${lvo.lectureOrder }">


				<hr style="clear:both;">
					<input type="hidden" name="courseNo" value="${lvo.courseNo }" />
					<input type="hidden" name="lectureNo" value="${lvo.lectureNo }" />
				<section class="common-card">
					<textarea name="content" id="content">${lvo.content}</textarea>
				</section>
					<script>
					 CKEDITOR.replace("content", {
						filebrowserUploadUrl : "${pageContext.request.contextPath}/lectureBoard/imageUpload"
					});
					 // CKEDITOR.on('instanceLoaded', function(e) {e.editor.resize(700, 1000)} );
					</script>

			<input type="button" class="common-btn util-width-100" value="확인" onclick="content_submit()" style="margin: 30px auto;display: block;">
	</form>
</div>
