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
	
		${result}
		<c:if test="${multipleChoice != null}">
		<a href="${path}/question/general/multipleChoiceContent?questionNo=${questionNo}"> 객관식 문제 다시풀기</a>
		</c:if>
		<c:if test="${shortAnswer !=null}">
		<a href="${path}/question/general/shortAnswerContent?questionNo=${questionNo}">  주관식 문제 다시풀기</a>
		</c:if>
		
		<a href="${path}/question/general/getList"> 문제리스트로가기</a>
	</div>
</body>
</html>
