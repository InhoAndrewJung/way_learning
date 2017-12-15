<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../../include/common.jsp"%>
<%@ include file="../../include/header.jsp"%>

<link rel="stylesheet" href="${path}/resources/css/board/board.css">

<script type="text/javascript">
var courseNo = ${list[0].COURSE_NO}
<c:if test="${not empty param.cno}">
courseNo = ${param.cno}
</c:if>
function content_submit(){
	var f=document.write_form;
	if(f.duplicate.value == 'true'){
		alert("이미 있는 강의 번호입니다.")
		return;
	}
	f.submit();
}
function selectedCourse(){
	courseNo=$('#courseNo').val();
	selectedOrder()
}
function selectedOrder(){
	var lectureOrder=$('#lectureOrder').val();
	$.ajax({
		type: "post",
		url: "${pageContext.request.contextPath}/lectureBoard/isLectureOrderExist",
		data:"${_csrf.parameterName}=${_csrf.token}&courseNo="+courseNo+"&lectureOrder="+lectureOrder,
		success: function(result){
			if(result == 1){
				alert("이미 존재하는 강의번호 입니다.")
			$('#duplicate').val("true");
			}else{
				$('#duplicate').val("false");
			}
		}
	});
}
</script>


<script src="${path}/ckeditor/ckeditor.js"></script>
<div class="common-container">
	<form action="${pageContext.request.contextPath}/lectureBoard/insertLecture?${_csrf.parameterName}=${_csrf.token}" method="post" name="write_form" enctype="multipart/form-data">
		<div class="titleName" style="margin-bottom:40px;">
			<img src="${path}/resources/img/write-page.png" id="image_title">새 강의
		</div>
		<div class="common-card">
			<div class="body-head">
				<select class="title" style="float:left;border: none;" name="courseNo" id="courseNo" onchange="selectedCourse()">
				<c:forEach var="row" items="${list}">
					<c:choose>
						<c:when  test="${not empty param.cno && param.cno==row.COURSE_NO}">
							<option value="${row.COURSE_NO}" selected=selected>${row.COURSE_NAME}</option>
						</c:when>
						<c:otherwise>
							<option value="${row.COURSE_NO}">${row.COURSE_NAME}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				</select>
				<div class="title"><input class="lecture-order-input" type="number" name="lectureOrder" id="lectureOrder" min="1" max="15" onchange="selectedOrder()">강</div>
				<div class="title">강의명<input class="text_title" type="text" name="lectureName" maxlength="50" size="50" placeholder="강의명을 입력해주세요"></div>
				<input type="hidden" name="duplicate" id="duplicate" value="true"/>
			</div>
			<hr>
			<div>
				<textarea class="input-blue" id="content" name="content"rows="10" cols="80" ></textarea>
					<script>
					 CKEDITOR.replace( 'content', {
							extraPlugins: 'autogrow,youtube',
							autoGrow_minHeight: 400,
							autoGrow_maxHeight: 10000,
							autoGrow_bottomSpace: 50,
							filebrowserUploadUrl : "${pageContext.request.contextPath}/lectureBoard/imageUpload",
							removePlugins: 'resize',
						} );
					</script>
					<hr>
					</div>
					<div style="text-align:right;padding:20px;">
						<img src="${pageContext.request.contextPath}/resources/img/check.png" onclick="content_submit()" class="image_check">
					</div>
				</div>
			</div>
	</form>

<%@ include file="../../include/footer.jsp"%>
