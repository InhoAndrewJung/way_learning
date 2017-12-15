<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp" %>

<script>
function changeAccept(isAccept,courseNo) {
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
					showAllCourse('change');
				}
			});
		}
	} else {
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
					showAllCourse('change');
				}
			});
		}
	}
}
</script>
<c:forEach var="cvo" items="${list}"  varStatus="status" >
<div class="common-card util-width-100 mycourse">
	<img src="${path}/resources/upload/${cvo.courseImage}" style="margin-top:20px;">
	<p>
		<strong>코 스 명</strong> ${cvo.courseName}
	</p>
	<p>
		<strong>코스설명 </strong><a href="${pageContext.request.contextPath}/lectureBoard/showLectureList?courseNo=${cvo.courseNo}"><span onclick="move()">${cvo.description}</span></a>
	</p>
	<p>
		<strong>승인여부 </strong><c:if test="${cvo.isAccept =='1'}"> 승인</c:if>  <c:if test="${cvo.isAccept =='0'}"> 미승인</c:if><input type="button" id="changeAccept"  onclick="changeAccept('${cvo.isAccept}','${cvo.courseNo}')" value="변경" />
	</p>
</div>
</c:forEach>
