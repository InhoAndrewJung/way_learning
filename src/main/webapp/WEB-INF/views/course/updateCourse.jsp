<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/common.jsp"%>

<script type="text/javascript">
function content_submit(){
	var f=document.update_form;
	f.submit();
}
var uploadFile = $('#uploadFile');
uploadFile.on('change', function(){
	if ($(this)[0].files && $(this)[0].files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
			document.getElementById('file_preview').src = e.target.result;
		}
		reader.readAsDataURL($(this)[0].files[0]);
	}
	if(window.FileReader){
		var filename = $(this)[0].files[0].name;
	} else {
		var filename = $(this).val().split('/').pop().split('\\').pop();
	}
	document.getElementById('file_preview').style.display ="block";
});
</script>


<h2 class="mycourse-title">[${cvo.courseName}] 수정</h2>

<form action="${pageContext.request.contextPath}/course/updateCourse?${_csrf.parameterName}=${_csrf.token}" method="post" name="update_form" enctype="multipart/form-data">
	<input type="file" name="uploadFile" id="uploadFile" class="uploadFile" style="display:none;">
	<img id="file_preview" class="mycourse-image common-card" src="${path}/resources/upload/${cvo.courseImage}">
	<label for="uploadFile" style="padding:8px;margin-bottom:20px;" class="common-hover-btn">이미지변경</label>
	<hr>

	<label for="courseName">코스명</label><input class="common-card" type="text" id="courseName" name="courseName" placeholder="코스명을 입력해주세요" size="100" value="${cvo.courseName }">

	<label for="description">코스설명</label>
	<%-- <input class="common-card"  type="text" name="description" maxlength="200" size="200" placeholder="코스 설명을 입력해주세요" value="${cvo.description }"> --%>
	<textarea class="common-card" name="description" id="description">${cvo.description }</textarea>

	<input type="hidden" name="author" value="${cvo.member.userId}"/>
	<input type="hidden" name="courseNo" value="${cvo.courseNo}"/>
	<label for="tags">태그</label><input class="common-card" type="text" id="tags" name="tags" maxlength="200" size="200" placeholder="코스 태그를 입력해주세요"  value="<c:out value="${tag}" ><c:forEach var="tag" items="${tags}"  varStatus="status">${tag} <c:if test="${!status.last}">,</c:if> </c:forEach>	 </c:out>">

	<input type="button" class="common-btn" value="수정" onclick="content_submit()">
</form>
