<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../include/common.jsp"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>




<script src="${path}/ckeditor/ckeditor.js"></script>



<style>

/* .cke_top{display: none !important; }  */

/* .cke_bottom {display: none !important;} */

#profile {
	width: 50px;
	height: 50px;
	border-radius: 50%
}

#courseImg {
	width: 200px;
	height: 200px;
	border-radius: 50%
}

a {
	text-decoration: none;
	cursor: pointer;
}

#tag {
	font-size: 10px;
	border: 1px solid grey;
	border-radius: 10%;
	background-color: grey;
	color: white;
	margin-left: 20px;
}

#recommend {
	border: 1px solid #f00;
	border-radius: 10%;
}
</style>



<script>

var lecNo= ${lecList[0].lectureNo};

function moveLecture(lectureNo){
	lecNo=lectureNo;
	//alert(lectureNo);
	$.ajax({
		type:"post",
		url: "${pageContext.request.contextPath}/lectureBoard/showLecture",
		data:"${_csrf.parameterName}=${_csrf.token}&courseNo=${cvo.courseNo}&lectureNo="+lecNo,
		success: function(result){
			$("#lecture").html(result);
		}
	});


	
}





function deleteLecture(){
	alert("lectno:"+lecNo);
	 alert("courseNo"+${cvo.courseNo});
	 if(confirm("해당 코스를 삭제하시겠습니까?")){
		 
		 
		location.href="${pageContext.request.contextPath}/lectureBoard/deleteLecture?courseNo=${cvo.courseNo}&lectureNo="+lecNo;
	} 
}

function updateLecture(){
	alert("코스넘:"+${cvo.courseNo});
	alert("렉쳐넘:"+lecNo);

	if(confirm("해당 코스를 수정하시겠습니까?")){
		
		 $.ajax({
			type:"post",
			url: "${pageContext.request.contextPath}/lectureBoard/updateForm",
			data:"${_csrf.parameterName}=${_csrf.token}&courseNo=${cvo.courseNo}&lectureNo="+lecNo,
			success: function(result){
				$("#lecture").html(result);
			}
		}); 
		
		
		
		//location.href="${pageContext.request.contextPath}/lecture/updateForm?courseNo=${cvo.courseNo}&lectureNo="+lecNo;
	}
}
	

	
	

</script>

</head>
<body>

 <c:if test="${lecList != null }">
<script>

moveLecture('${lecList[0].lectureNo}');
</script>

</c:if> 

 
 
<%-- <video width=400 controls>   <source src="${pageContext.request.contextPath}/resources/upload/movie.ogg" type="video/ogg"> Your browser does not support HTML5 video.</video> --%>
<!-- <iframe src="//www.youtube.com/embed/TOq6naMEuhg?rel=0?autoplay=1&start=30&loop=1&playlist=TOq6naMEuhg" allowfullscreen="" frameborder="0" height="315" width="420"></iframe> -->
  <%-- <iframe src="${pageContext.request.contextPath}/resources/upload/movie.mp4" ></iframe>  --%>
<%--   <iframe src="${pageContext.request.contextPath}/resources/upload/movie.ogg" ></iframe> --%>
<%--   <video width=400 controls>   <source src="${path}/resources/upload/movie.ogg" type="video/ogg"></source></video> --%>
  <!-- <iframe src="https://www.naver.com">  -->
	<table border="1" width=100% height=100%>

		<tr height=10%>
			<td width=30%><img id="courseImg" src="${path}/resources/upload/${cvo.courseImage}"></td>
			<td width=70%>
				<table border="1px" width="100%" height="100%">
					<tr>
						<td width=60%><c:forEach var="tag" items="${tags}"
								varStatus="status">
								<span id="tag">${tag}</span>
							</c:forEach><br> Course 설명<br> ${cvo.description}<br> 총 26강/
							12시간 40분</td>
						<td width=20%>강사 ${cvo.member.userId}<br> <fmt:formatDate
								value="${cvo.regDate}" pattern="YYYY.MM.dd" /> <br> <span
							id="recommend"> 이코스 추천하기</span>

						</td>
						<td width=10%><img id="profile"
							src="${path}/resources/upload/${cvo.member.imgProfile}"></td>
					</tr>

				</table>
			</td>
		</tr>
		<tr height=90%>
			<td width=20%>
				<table>
				   ${cvo.courseName} <br>
					<c:forEach var="row" items="${lecList}" varStatus="status">
						<tr>
							<td><a href="#" onclick="moveLecture('${row.lectureNo}')">${row.lectureOrder}강 ${row.lectureName}</a>  </td>
						<tr>
					</c:forEach>
				</table>
			</td>
			<td width=80%>  
			<!-- 현재 로그인한 사람이 자신의 글 상세보기 할때는 삭제와 수정버튼이 보여지도록 작성하면됨! -->
			<sec:authorize access="isAuthenticated()">
			<sec:authentication var="mvo" property="principal" />


			<c:if test="${mvo.userId == cvo.member.userId }">
				<img alt="삭제"
					src="${pageContext.request.contextPath}/resources/img/delete_btn.jpg"
					onclick="deleteLecture()">
				<img alt="수정"
					src="${pageContext.request.contextPath}/resources/img/modify_btn.jpg"
					onclick="updateLecture()">
			</c:if>
		</sec:authorize>
			<div id="lecture"></div>
			
			
			
			
			</td>

		</tr>
	</table>
	<%-- <c:forEach var="row" items="${list}" varStatus="status">
	<tr height=5%>
	
	<td width=30%>${status.index+1}. ${row}</td> 
	
	
		
		

	</tr>
	</c:forEach>
	<tr> <td width=30%></td></tr>
 --%>





	<a href="${pageContext.request.contextPath}">홈으로</a>
</body>
</html>





















