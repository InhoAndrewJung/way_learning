<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			
			<table class="boardTable" style="margin-top: 0;">

			<form action="${path}/question/general/shortAnswerResult"
				method="post">

				<tr>
				<span class="search_button" >

					<td style="padding:5px;"><input type="text" name="answer" id="answer" style="width:950px; height:30px;border:0px;"/></td>
					<td><input type="submit" id="search_button" value="제출" style="border-radius:0px;"/></td>
					</span>
				</tr>

				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}"> <input type="hidden"
					name="questionNo" value="${gq.questionNo}">

				
					
				

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
