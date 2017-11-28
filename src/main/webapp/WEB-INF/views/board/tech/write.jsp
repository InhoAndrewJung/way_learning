<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function content_submit(){
	var f=document.write_form;
	if(f.title.value==""){
		alert("제목을 입력하세요!");
		f.title.focus();
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


<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>


</head>

<font face="HY나무L" size="5"><strong>글쓰기 <br><br></strong></font>
  <form action="${pageContext.request.contextPath}/board/tech/insert?${_csrf.parameterName}=${_csrf.token}" method="post" name="write_form"
  	enctype="multipart/form-data">
<%--    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">  --%> 
   
  
   <table>
    <tr>
     <td>제목</td>
     <td>
     <input type="text" name="title" maxlength="100" size="30">
     
    
     </td>
    </tr>
    
    <!-- 파일업로드 폼 추가 -->
  
    
    <tr>
     <td colspan="2">
    <textarea id="content" name="content" rows="5" cols="80"
	placeholder="내용을 입력하세요"></textarea>
	
	<!-- 텍스트 에리어를 스마트 에디터로 변경 -->
<script>
//CKEDITOR.replace("content"); // 태그의 id
//이미지 업로드를 할 경우

	
	
	
 CKEDITOR.replace("content", {
	filebrowserUploadUrl : "${pageContext.request.contextPath}/board/tech/imageUpload"
}); 

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
</html>