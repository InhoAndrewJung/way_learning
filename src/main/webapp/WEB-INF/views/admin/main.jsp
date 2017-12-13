<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
</head>
<script>



 var toggleMember=1;
 var toggleLecture=1;
 
function showActiveMember(change){
	
	
		
	
	$.ajax({
		
		type: "post",
		url: "${path}/admin/selectActiveMember",
		data:"${_csrf.parameterName}=${_csrf.token}",
		success: function(result){
			
			if(change != null) toggleMember=1;
			if (toggleMember==1){
				
				$("#showActiveMember").html(result);	
				toggleMember=0;
				
			}else if(toggleMember==0){
			
				$("#showActiveMember").html("");	
				toggleMember=1;
				
			}
		}
		
	});
	
	
	
}	


function showAllCourse(change){

	$.ajax({
		
		type: "post",
		url: "${path}/admin/selectAllCourseList",
		data:"${_csrf.parameterName}=${_csrf.token}",
		success: function(result){
			if(change != null) toggleLecture=1;
			if (toggleLecture==1){

			$("#showAllCourse").html(result);
			toggleLecture=0;
			}else if(toggleLecture==0){
				$("#showAllCourse").html("");
				toggleLecture=1;
				
			}
		}
		
	});
	
}	


</script>
<body>
<sec:authentication var="mvo" property="principal" />

 ${mvo.userId} 관리자님   카페입장 환영!
 <br><br>
 

<li><a href="#" id="showActive" onclick="showActiveMember()">활동멤버 선택</a></li>

<div id="showActiveMember"></div>
<br><br>

<li><a href="#" id="showAll" onclick="showAllCourse()">강의 승인 선택</a></li>
<div id="showAllCourse"></div>
<br><br>

<a href="${path}/"> 메인페이지로 이동</a>
</body>
</html>