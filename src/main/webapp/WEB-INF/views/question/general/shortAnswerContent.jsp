<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
	
		<table border=1px>
			<tr>
				<td nowrap>Question ${gq.questionNo} </td> 
				<td nowrap>${gq.question }</td>
				
			</tr>
			
			<form action="${path}/question/general/shortAnswerResult" method="post">
			
				<tr>

					<td colspan="2" ><input type="text" name="answer" id="answer" /></td>
				</tr>
			
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type="hidden" name="questionNo" value="${gq.questionNo}">
		
			<tr>
				<td colspan="2"><input type="submit" value="정답제출" /></td>
			</tr>
			
			</form>
			
		</table>
		${keyword}
		<a href="${pageContext.request.contextPath}/question/general/getList?keyword=${keyword}"> 목록가기</a>
		<a href="${path}/"> 메인페이지로 이동</a>
	</div>
</body>
</html>
