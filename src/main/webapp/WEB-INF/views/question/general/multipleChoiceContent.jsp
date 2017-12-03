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
			
			<form action="${path}/question/general/multipleChoiceResult" method="post">
			<c:forEach var="row" items="${aList}" varStatus="status" begin="0">
				<tr>

					<td colspan="2" ><label for="answer">${status.index}.</label><input type="radio" name="answer" id="answer" value="${status.index}" /> ${row.answerChoice}</td>
				</tr>
			</c:forEach>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type="hidden" name="questionNo" value="${gq.questionNo}">
		
			<tr>
				<td colspan="2"><input type="submit" value="제출" /></td>
			</tr>
			
			</form>
		</table>
		
	</div>
</body>
</html>
