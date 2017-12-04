<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
일반문제 게시판
<h1>Hello World</h1><h4>프로그래밍 세계와 조우하세요!</h4>
<c:forEach var="result" items="${list}">
<a href="${pageContext.request.contextPath}/question/general/showContent?questionNo=${result.questionNo}">
${result.questionNo}</a>
${result.question}
${result.language}
${result.cntSubmit}
${result.cntRight}
</c:forEach>
</body>
</html>