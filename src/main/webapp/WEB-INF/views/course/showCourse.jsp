<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">




<%@ include file="../include/common.jsp"%>
</head>
<script>



function deleteBoard(){
	if(confirm("해당 코스를 삭제하시겠습니까?")){
		location.href="${pageContext.request.contextPath}/course/deleteCourse?courseNo=${cvo.courseNo}";
	}
}

function updateBoard(){
	if(confirm("해당 코스를 수정하시겠습니까?")){
		location.href="${pageContext.request.contextPath}/course/updateForm?courseNo=${requestScope.cvo.courseNo}";
	}
}






</script>




<style>


#profile {
	width: 50px;
	height: 50px;
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
	margin-left: 10px;
}
</style>




<body>







	<h2 align="center">
		<b>게시글 </b>
	</h2>
	<div align="center">






		<table border="1" width="650" align="center">


			<tr>
				<td><img id="profile"
					src="${path}/resources/upload/${cvo.member.imgProfile}">
					${cvo.member.userId} ${cvo.member.activity}<br></td>

				<td nowrap>좋아요 수:${cvo.cntCourseLike}</td>
			</tr>

			<tr>

				<td>코스이름: ${cvo.courseName} <br></td>
				
				<td>코스설명: ${cvo.description}</td>


			</tr>
			
			<tr>

				<td colspan="2"> 태그들:
				<c:forEach var="tag" items="${tags }" varStatus="status">
				  <span id="tag" >${tag }</span>  
				</c:forEach>
				</td>
				
				


			</tr>

			<tr>
				<td colspan="2">코스이미지: <img id="profile"
					src="${path}/resources/upload/${cvo.courseImage}"> <br>
				</td>
				



			</tr>

		</table>


		<!-- 현재 로그인한 사람이 자신의 글 상세보기 할때는 삭제와 수정버튼이 보여지도록 작성하면됨! -->
		<sec:authorize access="isAuthenticated()">
			<sec:authentication var="mvo" property="principal" />


			<c:if test="${mvo.userId == cvo.member.userId }">
				<img alt="삭제"
					src="${pageContext.request.contextPath}/resources/img/delete_btn.jpg"
					onclick="deleteBoard()">
				<img alt="수정"
					src="${pageContext.request.contextPath}/resources/img/modify_btn.jpg"
					onclick="updateBoard()">
			</c:if>
		</sec:authorize>

<a href="${pageContext.request.contextPath}">홈으로</a>

	</div>
</body>
</html>






























