<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ include file="../../include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/board.css?ver=2">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function deleteQuestion() {
		if (confirm("해당 글을 삭제하시겠습니까?")) {
			location.href = "${path}/question/general/deleteQuestion?questionNo=${gq.questionNo}";
		}

	}

	function updateQuestion() {
		if (confirm("해당 글을 수정하시겠습니까?")) {
			location.href = "${path}/question/general/updateQuestion?questionNo=${gq.questionNo}";
		}
	}
</script>
<body>

<div class="container">
	
	<div class="menu">
		<div class="titleName">
			
				 Question ${gq.questionNo}
			
		</div>
	</div>
	
	<table class="boardTable">
			<tr>
				
				<td style="align-items: center; padding:5%"><textarea name="question" id="question"
						style="width: 900px; min-height: 300px; border:0;" readOnly> ${gq.question}</textarea></td>

			</tr>
	</table>
				
	<table class="boardTable">
			<form action="${path}/question/general/multipleChoiceResult"
				method="post">
				<c:forEach var="row" items="${aList}" varStatus="status" begin="0">
					<tr style="height:40;">

						<td colspan="2"><label for="answer">${status.index+1}.</label><input
							type="radio" name="answer" id="answer" value="${status.index+1}" />
							${row.answerChoice}</td>
					</tr>
				</c:forEach>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}"> <input type="hidden"
					name="questionNo" value="${gq.questionNo}"/>

				<tr>					
					<td style="text-align: right;">
						<span class="search_button" >
							<input type="submit"  id="search_button" value="제출" style="border-radius:0px;"/>
						</span>
					</td>
					
				</tr>

			</form>

		</table>
		
		<div style="text-align:center;">
		<c:if test="${mvo.userId == requestScope.bvo.member.userId }">
			<img alt="삭제"
				src="${pageContext.request.contextPath}/resources/img/delete_btn.jpg"
				onclick="deleteQuestion()">
			<img alt="수정"
				src="${pageContext.request.contextPath}/resources/img/modify_btn.jpg"
				onclick="updateQuestion()">
		</c:if>
		<br>
		<a href="${pageContext.request.contextPath}/question/general/getList?keyword=${keyword}">
			<img src="${pageContext.request.contextPath}/resources/img/list.png" id="image_list"></a> 
			<!-- 메인으로 이동 -->
				<a href="${path}/">
					<img src="${pageContext.request.contextPath}/resources/img/house.png" id="image_list">
				</a>	

		
</div>
	</div>
</body>
</html>
