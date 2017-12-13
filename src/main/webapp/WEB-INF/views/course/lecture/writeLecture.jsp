<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../include/common.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/board.css?ver=2">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script type="text/javascript">

var courseNo=$('#courseNo').val();
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

	}

 

	
	 function selectedOrder(){
		
	 var lectureOrder =$('#lectureOrder').val();
	 
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




<style>

   
#profile{width:50px; height:50px; border-radius: 50% }
a{text-decoration:none; cursor: pointer;}


</style>

</head>

렉쳐등록하기!!!

<div align="center">
	<font face="HY나무L" size="5"><strong>글쓰기 <br>
		<br></strong></font>
	<form action="${pageContext.request.contextPath}/lectureBoard/insertLecture?${_csrf.parameterName}=${_csrf.token}"
		method="post" name="write_form" enctype="multipart/form-data">
		


		<table>
			<tr>
				<td nowrap>코스</td>
				<td>
			<select name="courseNo" id="courseNo" onchange="selectedCourse()">
			<c:forEach var="row" items="${list}">
			   <option    value="${row.COURSE_NO}">${row.COURSE_NAME}코스</option>
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
				<td><input type="number" name="lectureOrder"   id="lectureOrder" min="1" max="15" onchange="selectedOrder()"></td>
				<input type="hidden" name="duplicate" id="duplicate" value="true"/>
			</tr>
			
			
			<tr>
				<td nowrap>컨텐츠</td>
				<td> <textarea id="content" name="content"rows="10" cols="80" ></textarea>
						
						<!-- 텍스트 에리어를 스마트 에디터로 변경 -->
					<script>
					//CKEDITOR.replace("content"); // 태그의 id
					//이미지 업로드를 할 경우
					
						
						
						
					/*  CKEDITOR.replace("content", {
						filebrowserUploadUrl : "${pageContext.request.contextPath}/lectureBoard/imageUpload"
						
						
					}); 
					
					 CKEDITOR.on('instanceLoaded', function(e) {e.editor.resize(700, 1000)} ); */
					 
					
					//CKEDITOR.replace("content"); // 태그의 id
					//이미지 업로드를 할 경우
					 CKEDITOR.replace( 'content', {
							extraPlugins: 'autogrow,youtube',		
							autoGrow_minHeight: 400,
							autoGrow_maxHeight: 10000,
							autoGrow_bottomSpace: 50,
							filebrowserUploadUrl : "${pageContext.request.contextPath}/lectureBoard/imageUpload",
							removePlugins: 'resize',		
						} );  

					
					
					
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
	<a href="${path}/"> 메인페이지로 이동</a>
</div>
</html>