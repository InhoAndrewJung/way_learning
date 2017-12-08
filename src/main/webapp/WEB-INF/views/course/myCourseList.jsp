<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/common.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.js"></script>




<style>

#profile{width:50px; height:50px; border-radius: 50% }
a{text-decoration:none; cursor: pointer;}
#tag{font-size:10px;border:1px solid grey;border-radius:10%; background-color:grey; color:white; margin-left:10px;}
</style>



</head>
<body>

<div align="center">

<!-- 비로그인 사용자는 아래 버튼을 보여주지 않는다. -->

<sec:authorize access="isAuthenticated()">
<a href="${pageContext.request.contextPath}/board/qna/write">글작성</a>
</sec:authorize>
 
 


<table border="1" width="650" cellpadding="2">
	<tr>
		<td>코스번호</td>
		<td>코스이름</td>
		<td>코스설명</td>

	</tr>
	
	<c:forEach var="cvo" items="${list}">
		<tr>
		<td>${cvo.courseNo}</td>
		<td><a href="${path}/course/showCourse?courseNo=${cvo.courseNo}">${cvo.courseName}</a></td>
		<td>${cvo.description}</td>
			
					
		</tr>
		
	</c:forEach>
</table><p>

<a href="${pageContext.request.contextPath}">홈으로</a>




	 </div>  
</body>
</html>





















