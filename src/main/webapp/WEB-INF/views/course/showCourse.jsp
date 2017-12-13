<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/board.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

#tag{
  font-size:0.6em;padding:1px 7px;
  background-color:#2A7673;
  border-radius: 10px;
  height:10px;color:white;
  margin:0 3px;
}


.activity{
	color: #999999;
    display: inline-block;
    font-size: 15px;
    margin-right: 10px;
}

#activity {
	font-size: 10px;
}


.fa {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    transform: translate(0, 0);
}


</style>




<body>







	<h2 align="center">
		<b>코스 상세 </b>
	</h2>
	<div align="center">






		<table class="boardTable" border="1" style="width:500" align="center">


			<tr class="table-center">
				<td >강사</td>
				<td><img id="profile"
					src="${path}/resources/upload/${cvo.member.imgProfile}">
					${cvo.member.userId} 
					<div class="activity">
								
									<span class="fa fa-graduation-cap"></span>
									${cvo.member.activity}
							</div>
					
					
					<br></td>


			</tr>
			<tr class="table-center">
				<td nowrap>좋아요 수</td>
				<td nowrap>${cvo.cntCourseLike}개</td>
			</tr>

			<tr class="table-center">
				<td>코스이름 <br></td>
				<td>${cvo.courseName}<br></td>
			</tr>

			<tr class="table-center">
				<td>코스설명</td>
				<td>${cvo.description}</td>
			</tr>



			<tr class="table-center" >

				<td>태그들</td>
				<td ><c:forEach var="tag" items="${tags }" varStatus="status">
						<span class="tag" id="tag">${tag }</span>
					</c:forEach></td>





			</tr>

			<tr class="table-center">
				<td>코스이미지</td>
				<td>
			<img id="profile" src="${path}/resources/upload/${cvo.courseImage}">
				<br>
				</td></tr>

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


		<br> <!-- 메인으로 이동 -->
				<a href="${path}/">
					<img src="${pageContext.request.contextPath}/resources/img/house.png" id="image_list">
				</a>

	</div>
</body>
</html>
