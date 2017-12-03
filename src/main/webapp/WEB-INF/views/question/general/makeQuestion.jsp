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

<form action="${path}/question/general/insertQuestion" method="post">

<label for="category">객관식</label><input type="radio" name="category" id="category" value="multipleChoice" />
<label for="category">주관식</label><input type="radio" name="category" id="category" value="shortAnswer"/><br>
<label for="question">문제:</label><input type="text" name="question" id="question" /><br>
<label for="answer">정답:</label><input type="text" name="answer" id="answer" /><br>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<label for="answerChoice">선택지1:</label><input type="text" name="answerChoice" id="answerChoice" /><br>
<label for="answerChoice">선택지2:</label><input type="text" name="answerChoice" id="answerChoice" /><br>
<label for="answerChoice">선택지3:</label><input type="text" name="answerChoice" id="answerChoice" /><br>
<label for="answerChoice">선택지4:</label><input type="text" name="answerChoice" id="answerChoice" /><br>
<input type="submit" value="제출" />
</form>
</body>
</html>
