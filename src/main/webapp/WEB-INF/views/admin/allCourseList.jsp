<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.js"></script>



<script>

function changeAccept(isAccept,courseNo) {
	//alert("isAccept:"+isAccept);
	//alert("courseNo:"+courseNo);
if(isAccept == '1'){

	 if(confirm("승인된 강의를 미승인 상태로 변경하시겠습니까?")){
			
			$.ajax({
				
				type: "post",
				url: "${path}/admin/changeAcceptStatus",
				data:"${_csrf.parameterName}=${_csrf.token}&isAccept=accept&courseNo="+courseNo,
				success: function(result){
					console.log(result);
						if(result == '1'){
							alert("강의 승인여부가 변경되었습니다.");
						}else{
							alert("강의 승인여부  변경에 실패했습니다.");
						}
					
						showAllCourse();
				}
				
			});
			
		}	
	
	
}else{
	//alert(isAccept)
	
	 if(confirm("미승인된 강의를 승인상태로 변경하시겠습니까?")){
			
			$.ajax({
				
				type: "post",
				url: "${path}/admin/changeAcceptStatus",
				data:"${_csrf.parameterName}=${_csrf.token}&isAccept=notAccept&courseNo="+courseNo,
				success: function(result){
					console.log(result);
						if(result == '1'){
							alert("강의 승인여부가 변경되었습니다.");
						}else{
							alert("강의 승인여부  변경에 실패했습니다.");
						}
						showAllCourse();
					
				}
				
			});
		}	
}	
	}
	


</script>

<style>

#profile{width:50px; height:50px; border-radius: 50% }
a{text-decoration:none; cursor: pointer;}
#tag{font-size:10px;border:1px solid grey;border-radius:10%; background-color:grey; color:white; margin-left:10px;}
</style>



</head>
<body>

<div align="center">

<!-- 비로그인 사용자는 아래 버튼을 보여주지 않는다. -->


 
 


<table border="1" width="1000px">
<tr>

<c:forEach var="cvo" items="${list}">
<td>
<table >
	<tr><td>코스이미지</td></tr>
	<tr><td><img id="profile" src="${path}/resources/upload/${cvo.courseImage}" width="100"></td></tr>
	<tr><td>코스명</td></tr>
	<tr><td>${cvo.courseName}</td></tr>
	<tr><td>코스설명</td></tr>
	<tr><td><a href="${pageContext.request.contextPath}/lectureBoard/showLectureList?courseNo=${cvo.courseNo}"> ${cvo.description}</td></tr>
	<tr><td>코스 승인여부 </td></tr>
	<tr><td><span id="changeAccept" style =" cursor:pointer;" onclick="changeAccept('${cvo.isAccept}','${cvo.courseNo}')" > <c:if test="${cvo.isAccept =='1'}"> 승인</c:if>  <c:if test="${cvo.isAccept =='0'}"> 미승인</c:if></span>  </td></tr>
</table>
</td>
</c:forEach>


</tr>

</table>






	 </div>  
</body>
</html>





















