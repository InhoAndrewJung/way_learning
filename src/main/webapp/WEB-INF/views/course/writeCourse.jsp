<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/common.jsp"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${path}/resources/css/board.css?ver=2">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Insert title here</title>
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

</style>

</head>



<div align="center">
<br/><br/><br/><br/><br/><br/>
	<font face="HY나무L" size="5"><strong>코스등록 <br>
		<br></strong></font>
	<form
		action="${pageContext.request.contextPath}/course/insertCourse?${_csrf.parameterName}=${_csrf.token}"
		method="post" name="write_form" enctype="multipart/form-data">
		<%--    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">  --%>


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
</div>
</html>