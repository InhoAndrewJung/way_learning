<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${path}/insertCourse" method="post">

제목:<input type="text" name="title" id="title" /><br>
문제:<input type="text" name="question" id="question" /><br>
인풋:<input type="text" name="input" id="input" /><br>
아웃풋:<input type="text" name="output" id="output" /><br>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

<input type="submit" value="제출" />
</form>
</body>
</html>