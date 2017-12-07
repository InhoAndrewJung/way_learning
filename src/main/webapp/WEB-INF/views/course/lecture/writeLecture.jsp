<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../include/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script type="text/javascript">
function content_submit(){
	var f=document.write_form;
	/* if(f.title.value==""){
		alert("제목을 입력하세요!");
		f.title.focus();
		return; 
	}	
	
	if(f.tag.value==""){
		alert("태그를 입력하세요!");
		f.tag.focus();
		return; 
	}	 */
	
	/* if(f.content.value==""){
		alert("내용을 입력하세요!");
		f.content.focus();
		return;
	} */
	f.submit();
}
 

</script>


<script src="${path}/ckeditor/ckeditor.js"></script>




<style>

   
#profile{width:50px; height:50px; border-radius: 50% }
a{text-decoration:none; cursor: pointer;}


</style>

</head>

렉쳐등록하기!!!

<div align="center">
	<font face="HY나무L" size="5"><strong>글쓰기 <br>
		<br></strong></font>
	<form action="${pageContext.request.contextPath}/lecture/insertLecture?${_csrf.parameterName}=${_csrf.token}"
		method="post" name="write_form" enctype="multipart/form-data">
		


		<table>
			<tr>
				<td nowrap>코스</td>
				<td>
			<select name="courseNo" id="courseNo">
			<c:forEach var="row" items="${list}">
			   <option value="${row.COURSE_NO}">${row.COURSE_NAME}코스</option>
			</c:forEach>
			
			
			</select>

</td>
			</tr>

			<tr>
				<td nowrap>강의명</td>
				<td><input type="text" name="lectureName" maxlength="50" size="50"
					placeholder="강의명을 입력해주세요"></td>
			</tr>
			<tr>
				<td nowrap>강의 순서</td>
				<td><input type="number" name="lectureOrder"  min="1" max="15"></td>
			</tr>
			
			<tr>
				<td nowrap>컨텐츠</td>
				<td> <textarea id="content" name="content"rows="10" cols="80" ></textarea>
						
						<!-- 텍스트 에리어를 스마트 에디터로 변경 -->
					<script>
					//CKEDITOR.replace("content"); // 태그의 id
					//이미지 업로드를 할 경우
					
						
						
						
					 CKEDITOR.replace("content", {
						filebrowserUploadUrl : "${pageContext.request.contextPath}/lecture/imageUpload"
						
						
					}); 
					
					 CKEDITOR.on('instanceLoaded', function(e) {e.editor.resize(700, 1000)} );
					
					
					</script>
		                        
		        </td>
			</tr>

		
			<tr>
				<td colspan="2"><img
					src="${pageContext.request.contextPath}/resources/img/confirm.gif"
					onclick="content_submit()" alt="확인">확인</td>
			</tr>
		</table>
	</form>
</div>
</html>