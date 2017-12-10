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
	<div align="center">

		<table border=1px>
			<tr>
				<td nowrap>Question ${gq.questionNo}</td>

				<td nowrap><textarea name="question" id="question"
						style="width: 500px; height: 500px;" readOnly> ${gq.question}</textarea>
				</td>

			</tr>

			<form action="${path}/question/general/multipleChoiceResult"
				method="post">
				<c:forEach var="row" items="${aList}" varStatus="status" begin="0">
					<tr>

						<td colspan="2"><label for="answer">${status.index+1}.</label><input
							type="radio" name="answer" id="answer" value="${status.index+1}" />
							${row.answerChoice}</td>
					</tr>
				</c:forEach>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}"> <input type="hidden"
					name="questionNo" value="${gq.questionNo}">

				<tr>
					<td colspan="2"><input type="submit" value="제출" /></td>
				</tr>

			</form>

		</table>
		<a
			href="${pageContext.request.contextPath}/question/general/getList?keyword=${keyword}">
			목록가기</a> <a href="${path}/"> 메인페이지로 이동</a>

		<c:if test="${mvo.userId == requestScope.bvo.member.userId }">
			<img alt="삭제"
				src="${pageContext.request.contextPath}/resources/img/delete_btn.jpg"
				onclick="deleteQuestion()">
			<img alt="수정"
				src="${pageContext.request.contextPath}/resources/img/modify_btn.jpg"
				onclick="updateQuestion()">
		</c:if>

	</div>
</body>
</html>
