<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp"%>
<%@ include file="../../include/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/board/board.css">
<script type="text/javascript">
	function content_submit() {
		document.write_form.submit();
	}
	function viewList() {
		location.href = "${pageContext.request.contextPath}/board/qna/list";
	}
</script>
<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/default.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"></script>
	<form action="${pageContext.request.contextPath}/board/qna/insert?${_csrf.parameterName}=${_csrf.token}" method="post" name="write_form" enctype="multipart/form-data">
		<div class="common-container">
			<div class="titleName" style="margin-bottom:40px;">
				<img src="${path}/resources/img/write-page.png" id="image_title">Write
			</div>
			<div class="common-card">
				<div class="body-head">
					<div class="title">Title<input name="title" placeholder="제목을 입력해주세요" class="text_title" require="require"></div>
					<div class="tag">Tag<input name="tag" placeholder="ex_ JAVA, WEB, ..." class="text_tag"></div>
				</div>
				<hr>
				<div>
					<textarea id="content" name="content"></textarea>
					<script>
						CKEDITOR.replace('content', {
							extraPlugins : 'autogrow,youtube',
							autoGrow_minHeight : 400,
							autoGrow_maxHeight : 10000,
							autoGrow_bottomSpace : 50,
							filebrowserUploadUrl : "${pageContext.request.contextPath}/board/qna/imageUpload",
							removePlugins : 'resize',
						});
					</script>
					<hr>
				</div>
				<div style="text-align:right;padding:20px;">
					<img src="${pageContext.request.contextPath}/resources/img/check.png" onclick="content_submit()" class="image_check">
					<img src="${path}/resources/img/cancel.png" class="image_cancel" onclick="viewList()">
				</div>
			</div>
		</div>
	</form>

	<%@ include file="../../include/footer.jsp"%>
