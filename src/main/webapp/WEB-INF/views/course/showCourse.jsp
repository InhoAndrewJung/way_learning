<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp"%>

<script>
function deleteBoard(courseNo){
	if(confirm("해당 코스를 삭제하시겠습니까?")){
		$.ajax({
        type: "get",
        url: "${pageContext.request.contextPath}/course/deleteCourse?courseNo="+courseNo,
        success: function(result){
        // $("#showContent").html(result);
				console.log(result)
      }
    });
	}
}
function updateBoard(courseNo){
	if(confirm("해당 코스를 수정하시겠습니까?")){
		$.ajax({
				type: "get",
				url: "${pageContext.request.contextPath}/course/updateForm?courseNo="+courseNo,
				success: function(result){
				$("#showContent").html(result);
				}
		});
	}
}
</script>

<h2 class="mycourse-title">${cvo.courseName}</h2><div class="mycourse-favorite fa fa-heart"> ${cvo.cntCourseLike}</div>

<img class="mycourse-image common-card" src="${path}/resources/upload/${cvo.courseImage}">
<p class="mycourse-description">${cvo.description}</p>
<p class="mycourse-tags">
	<c:forEach var="tag" items="${tags}" varStatus="status">
		<span class="tag" id="tag">${tag }</span>
	</c:forEach>
</p>


	<!-- 현재 로그인한 사람이 자신의 글 상세보기 할때는 삭제와 수정버튼이 보여지도록 작성하면됨! -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication var="mvo" property="principal" />
	<c:if test="${mvo.userId == cvo.member.userId }">
		<input type="button" class="common-btn" value="코스수정" onclick="updateBoard(${requestScope.cvo.courseNo})" style="background-color:#4e737c;">
		<input type="button" class="common-btn" value="코스삭제" onclick="deleteBoard(${requestScope.cvo.courseNo})" style="background-color:#c61919;">
	</c:if>
</sec:authorize>
