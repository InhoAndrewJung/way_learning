<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/common.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${path}/resources/css/board/board.css?ver=2">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
<a href="${pageContext.request.contextPath}/board/qna/write">내 코스</a>
</sec:authorize>
 
 


<table class="boardTable" style="text-align: center" border="1" width="650" cellpadding="2">
	<tr class="table-center" style="height:40px">
		<td>코스번호</td>
		<td>코스이름</td>
		<td>코스설명</td>

	</tr>
	
	<c:forEach var="cvo" items="${list}">
		<tr class="table-center" style="height:60px">
		<td>${cvo.courseNo}</td>
		<td><a href="${path}/course/showCourse?courseNo=${cvo.courseNo}">${cvo.courseName}</a></td>
		<td>${cvo.description}</td>
			
					
		</tr>
		
	</c:forEach>
</table><p>

<br><br><br><br>
<a href="${pageContext.request.contextPath}/lectureBoard/writeLecture">강의등록</a><br><br>

<a href="${pageContext.request.contextPath}">홈으로</a><br>
	 </div>  
</body>
</html>





















