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


</style>



<script>

$(document).ready(function() {
$.ajax({
	type: "post",
	url: "${pageContext.request.contextPath}/lectureBoard/likeStatus",
	data:"${_csrf.parameterName}=${_csrf.token}&courseNo=${cvo.courseNo}",
	success: function(result){
		
	//alert(result)
		if(result == 1){
			$('#recommend').attr('src' ,'/learning/resources/img/redHeart.png');	
			
			
		}
	
	}
	
});

});

//수정 삭제때문에 lecNo을 전역변수로 설정함!

var lecNo= ${lecList[0].lectureNo};


function showLecture(lectureNo){
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
	

function courseLikeChange(){
	
	var param="${_csrf.parameterName}=${_csrf.token}&courseNo=${cvo.courseNo}";
	
	$.ajax({
		type: "post",
		url: "${pageContext.request.contextPath}/lectureBoard/changeLike",
		data: param,
		success: function(result){
			alert("courseLikeChange cnt:"+result);
			
			
			$("#recommendCnt").html(result);
			
			 var src=$('#recommend').attr('src') ;
			 if(src =='/learning/resources/img/redHeart.png'){
				 $('#recommend').attr('src' ,'/learning/resources/img/heart.png') ;
			 }else if(src =='/learning/resources/img/heart.png'){
				 $('#recommend').attr('src' ,'/learning/resources/img/redHeart.png') ;
			 }
		
				
		}
	});	
}	
	
	

</script>

</head>
<body>

	<c:if test="${lecList != null && lectureNo =='0' }">
		<script>

showLecture('${lecList[0].lectureNo}');
</script>

	</c:if>

	<c:if test="${lectureNo !='0' }">
		<script>

showLecture('${lectureNo}');
</script>

	</c:if>





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
								value="${cvo.regDate}" pattern="YYYY.MM.dd" /> <br>
								<img src="${path}/resources/img/heart.png" width="50" alt="추천" id="recommend"  onclick="courseLikeChange()"/> 
								<span id="recommendCnt">${cvo.cntCourseLike}</span>
								

						</td>
						<td width=10%><img id="profile"
							src="${path}/resources/upload/${cvo.member.imgProfile}"></td>
					</tr>

				</table>
			</td>
		</tr>
		<tr height=90% style="vertical-align:top;">
			<td width=20% >
				<table  >
				   ${cvo.courseName} <br>
					<c:forEach var="row" items="${lecList}" varStatus="status">
						<tr>
							<td><a href="#" onclick="showLecture('${row.lectureNo}')">${row.lectureOrder}강 ${row.lectureName}</a>  </td>
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
			<div id="lecture"> </div>
			
			
			
			
			</td>

		</tr>
	</table>
	




	<a href="${pageContext.request.contextPath}">홈으로</a>
</body>
</html>





















