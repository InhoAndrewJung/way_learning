<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@ include file="../../include/common.jsp"%>
  <%@ include file="../../include/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/board/board.css">
<!-- EDIT LIBRARY -->
<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/default.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"></script>
<script type="text/javascript">
function content_submit(){
	document.edit_form.submit();
}
/* 수정취소 */
function viewList() {
	 location.href = "${pageContext.request.contextPath}/board/tech/list";
}
</script>
<form method=post action="${pageContext.request.contextPath}/board/tech/updateBoard?${_csrf.parameterName}=${_csrf.token}" name="edit_form"  enctype="multipart/form-data">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  <input type="hidden" name="boardNo" value="${bvo.boardNo}" />
	<div class="common-container">
		<div class="titleName" style="margin-bottom: 40px;">
			<img src="${path}/resources/img/pencil-case.png" id="image_title"> Edit
		</div>
		<div class="common-card">
			<div class="body-head">
				<div class="title">Title<input  name="title" value="${bvo.title}" class="text_title"></div>
				<div class="tag">Tag<input name="tag" class="text_tag" value=" <c:out value="${tag.TAG}"><c:forEach var="tag" items="${tagList}" varStatus="status"> ${tag.TAG} <c:if test="${!last.status}">,</c:if> </c:forEach> </c:out>">
				</div>
			</div>
			<hr>
			<div>
			<textarea id="content" name="content">${bvo.content }</textarea>
      <script>
       CKEDITOR.replace( 'content', {
      		extraPlugins: 'autogrow,youtube',
      		autoGrow_minHeight: 500,
      		autoGrow_maxHeight: 10000,
      		autoGrow_bottomSpace: 50,
      		filebrowserUploadUrl : "${pageContext.request.contextPath}/board/tech/imageUpload",
      		removePlugins: 'resize',
      	} );
      </script>
			</div>
			<div style="text-align:right;padding:20px;">
			<hr>
				<img src="${pageContext.request.contextPath}/resources/img/check.png"  onclick="content_submit()" class="image_check">
				<img src="${path}/resources/img/cancel.png" class="image_cancel" onclick="viewList()">
			</div>
		</div>
	</div>
</form>

<%@ include file="../../include/footer.jsp"%>
