<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%@ include file="../../include/common.jsp"%>
	<%@ include file="../../include/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/board/write.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript">
	function content_submit() {
		var f = document.write_form;
		if (f.title.value == "") {
			alert("제목을 입력하세요!");
			f.title.focus();
			return;
		}

		if (f.tag.value == "") {
			alert("태그를 입력하세요!");
			f.tag.focus();
			return;
		}

		/* if(f.content.value==""){
			alert("내용을 입력하세요!");
			f.content.focus();
			return;
		} */
		f.submit();
	}

	function viewList() {
		location.href = "${pageContext.request.contextPath}/board/tech/list";
	}
</script>


<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>




<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/default.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"></script>


	<form
		action="${pageContext.request.contextPath}/board/tech/insert?${_csrf.parameterName}=${_csrf.token}"
		method="post" name="write_form" enctype="multipart/form-data">

		<div class="container">

			<div class="titleName">

				<img src="${path}/resources/img/write-page.png" id="image_title">
				Write

			</div>

			<div class="container-body">

				<div class="body-head">
					<div class="title">
						Title <input name="title" placeholder="제목을 입력해주세요"
							class="text_title">
					</div>

					<div class="tag">
						Tag <input name="tag" placeholder="ex_ JAVA, WEB, ..."
							class="text_tag">

					</div>

				</div>

				<hr>

				<div class="content">

					<textarea id="content" name="content" rows="10" cols="80"
						class="content_text"></textarea>

					<!-- 텍스트 에리어를 스마트 에디터로 변경 -->
					<script>
						//CKEDITOR.replace("content"); // 태그의 id
						//이미지 업로드를 할 경우

						CKEDITOR
								.replace(
										'content',
										{
											extraPlugins : 'autogrow,youtube',
											autoGrow_minHeight : 400,
											autoGrow_maxHeight : 10000,
											autoGrow_bottomSpace : 50,
											filebrowserUploadUrl : "${pageContext.request.contextPath}/board/tech/imageUpload",
											removePlugins : 'resize',
										});
					</script>


				</div>




				<div class="container-footer">

					<hr>

					<img
						src="${pageContext.request.contextPath}/resources/img/check.png"
						onclick="content_submit()" class="image_check"> <img
						src="${path}/resources/img/cancel.png" class="image_cancel"
						onclick="viewList()">

				</div>

			</div>





		</div>
	</form>
</body>

<%--

<div align="center">
<font face="HY나무L" size="5"><strong>글쓰기 <br><br></strong></font>
  <form action="${pageContext.request.contextPath}/board/tech/insert?${_csrf.parameterName}=${_csrf.token}" method="post" name="write_form"
  	enctype="multipart/form-data">
   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">


   <table>
    <tr>
     <td>제목</td>
     <td>
     <input type="text" name="title" maxlength="100" size="90" placeholder="제목을 입력해주세요">
     </td>
    </tr>

    <tr>
     <td>태그</td>
     <td>
     <input type="text" name="tag" maxlength="100" size="90" placeholder="태그를  컴마로 구분해서 입력해주세요" >


     </td>
    </tr>

    <!-- 파일업로드 폼 추가 -->


    <tr>
     <td colspan="2">
    <textarea id="content" name="content"rows="10" cols="80" ></textarea>

	<!-- 텍스트 에리어를 스마트 에디터로 변경 -->
<script>
//CKEDITOR.replace("content"); // 태그의 id
//이미지 업로드를 할 경우

 CKEDITOR.replace( 'content', {
		extraPlugins: 'autogrow,youtube',
		autoGrow_minHeight: 400,
		autoGrow_maxHeight: 10000,
		autoGrow_bottomSpace: 50,
		filebrowserUploadUrl : "${pageContext.request.contextPath}/board/tech/imageUpload",
		removePlugins: 'resize',
	} );


</script>
     </td>
    </tr>
    <tr>
     <td colspan="2"  >
      <img src="${pageContext.request.contextPath}/resources/img/confirm.gif"  onclick="content_submit()">확인
     </td>
    </tr>
   </table>
  </form>

  <a href="${pageContext.request.contextPath}">홈으로</a>
  </div> --%>
</html>
