<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script type="text/javascript">
function content_submit(){
	 var f=document.update_form;
	 /*if(f.courseName.value==""){
		alert("코스명을 입력하세요!");
		f.courseName.focus();
		return; 
	}	
	
	if(f.tags.value==""){
		alert("태그를 입력하세요!");
		f.tags.focus();
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



</head>



<div align="center">
	<font face="HY나무L" size="5"><strong>코스 업데이트하기 <br>
		<br></strong></font>
	<form
		action="${pageContext.request.contextPath}/course/updateCourse?${_csrf.parameterName}=${_csrf.token}"
		method="post" name="update_form" enctype="multipart/form-data">
	


		<table>
			<tr>
				<td nowrap>코스명</td>
				<td><input type="text" name="courseName" placeholder="코스명을 입력해주세요" size="100" value="${cvo.courseName }"></td>
			</tr>

			<tr>
				<td nowrap>코스 설명을 입력하세요</td>
				<td><input type="text" name="description" maxlength="200" size="200"
					placeholder="코스 설명을 입력해주세요" value="${cvo.description }"></td>
			</tr>
			<tr>
				<td nowrap> 태그를 입력하세요</td>
				<input type="hidden" name="author" value="${cvo.member.userId}"/>
				<input type="hidden" name="courseNo" value="${cvo.courseNo}"/>
			
				
				
				
				<td><input type="text" name="tags" maxlength="200" size="200" placeholder="코스 태그를 입력해주세요"  value="<c:out value="${tag}" ><c:forEach var="tag" items="${tags}"  varStatus="status">${tag} <c:if test="${!status.last}">,</c:if> </c:forEach>	 </c:out>"></td>
			</tr>
			<tr>
				<td nowrap>코스 이미지 등록</td>
				<td><input type="file" name="uploadFile" ></td>
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