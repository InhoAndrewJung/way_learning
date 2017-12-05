<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="${path}/question/essay/insertQuestion" method="post">

<label for="question">제목:</label><input type="text" name="title" id="title" /><br>
<label for="question">문제:</label><input type="text" name="question" id="question" /><br>
<label for="question">인풋:</label><input type="text" name="input" id="input" /><br>
<label for="question">아웃풋:</label><input type="text" name="output" id="output" /><br>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

<input type="submit" value="제출" />
</form>
<a href="${path}/"> 메인페이지로 이동</a>
</body>
</html>
