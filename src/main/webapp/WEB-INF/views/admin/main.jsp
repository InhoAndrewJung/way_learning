<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>

function showActiveMember(){

	$.ajax({
		
		type: "post",
		url: "${path}/admin/selectActiveMember",
		data:"${_csrf.parameterName}=${_csrf.token}",
		success: function(result){
			

			$("#showActiveMember").html(result);
			
		}
		
	});
	
}	


function showAllCourse(){

	$.ajax({
		
		type: "post",
		url: "${path}/admin/selectAllCourseList",
		data:"${_csrf.parameterName}=${_csrf.token}",
		success: function(result){
			

			$("#showAllCourse").html(result);
			
		}
		
	});
	
}	


</script>
<body>
<sec:authentication var="mvo" property="principal" />

 ${mvo.userId} 관리자님   카페입장 환영!
 <br><br>
 

<li><a href="#" onclick="showActiveMember()">활동멤버 선택</a></li>

<div id="showActiveMember"></div>
<br><br>

<li><a href="#" onclick="showAllCourse()">강의 승인 선택</a></li>
<div id="showAllCourse"></div>
<br><br>

<a href="${path}/"> 메인페이지로 이동</a>
</body>
</html>