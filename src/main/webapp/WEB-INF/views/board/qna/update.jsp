<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@ include file="../../include/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>



<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>


      
    
<%-- <link href="${pageContext.request.contextPath}/ckeditor/plugins/codesnippet/lib/highlight/styles/default.css" rel="stylesheet"> --%> 

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/default.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"></script>
 
<script type="text/javascript">
function content_submit(){
	var f=document.update_form;
	if(f.title.value==""){
		alert("제목을 입력하세요!");
		f.title.focus();
		return; 
	}	
	
	if(f.tag.value==""){
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
 

</script>


</head>



<div align="center">
<font face="HY나무L" size="5"><strong>수정하기 <br><br></strong></font>
  <form action="${pageContext.request.contextPath}/board/qna/updateBoard?${_csrf.parameterName}=${_csrf.token}" method="post" name="update_form"
  	enctype="multipart/form-data">
<%--    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">  --%> 
   
  
   <table>
    <tr>
     <td>제목</td>
     <td>
     <input type="text" name="title" maxlength="100" size="90" value=${bvo.title } >
     <input type="hidden" name="boardNo" value="${bvo.boardNo}" />
     </td>
    </tr>
    
    <tr>
     <td>태그</td>
     <td>
     <input type="text" name="tag" maxlength="100" size="90" placeholder="태그를  컴마로 구분해서 입력해주세요" >
     
    
     </td>
    </tr>
    
 
  
    
    <tr>
     <td colspan="2">
    <textarea id="content" name="content"rows="10" cols="80" >${bvo.content }</textarea>
	
	<!-- 텍스트 에리어를 스마트 에디터로 변경 -->
<script>
//CKEDITOR.replace("content"); // 태그의 id
//이미지 업로드를 할 경우
 CKEDITOR.replace( 'content', {
		extraPlugins: 'autogrow,youtube',		
		autoGrow_minHeight: 500,
		autoGrow_maxHeight: 10000,
		autoGrow_bottomSpace: 50,
		filebrowserUploadUrl : "${pageContext.request.contextPath}/board/qna/imageUpload",
		removePlugins: 'resize',		
	} );  

</script>
     </td>
    </tr> 
    <tr>
     <td colspan="2"  >
      <img src="${pageContext.request.contextPath}/resources/img/confirm.gif"  onclick="content_submit()">수정하기
     </td>  
    </tr>
   </table>
  </form>
  <a href="${pageContext.request.contextPath}">홈으로</a>
  </div>
</html>