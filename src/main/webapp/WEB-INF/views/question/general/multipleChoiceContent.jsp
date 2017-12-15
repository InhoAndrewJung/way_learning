<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp"%>
<%@ include file="../../include/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/board/board.css?ver=2">
<script type="text/javascript">
	function deleteQuestion() {
		if (confirm("해당 글을 삭제하시겠습니까?")) {
			location.href = "${path}/question/general/deleteQuestion?questionNo=${gq.questionNo}";
		}
	}

	function updateQuestion() {
		location.href = "${path}/question/general/updateQuestion?questionNo=${gq.questionNo}";
	}
</script>

<div class="common-container">
	<div class="move-boardList">
		<div class="titleName" style="text-align:left;">Question ${gq.questionNo}</div>
		<a href="${pageContext.request.contextPath}/question/general/getList?keyword=${keyword}">
			<img src="${pageContext.request.contextPath}/resources/img/list.png" id="image_list">
		</a>
	</div>
	<table class=" common-card util-width-100" style="margin-bottom:40px;">
			<tr>
				<td style="padding:30px">
					<textarea name="question" id="question" class="question-textarea" readOnly> ${gq.question}</textarea></td>
					<script type="text/javascript">
						var textArea = document.getElementById('question')
						textArea.style.height = textArea.scrollHeight + 'px'
					</script>
			</tr>
	</table>

			<form action="${path}/question/general/multipleChoiceResult" method="post">
				<c:forEach var="row" items="${aList}" varStatus="status" begin="0">
					<p>
						<input type="radio" name="answer" id="answer${status.index+1}" value="${status.index+1}" />
						<label class="quiz-result-label" for="answer${status.index+1}">${row.answerChoice}</label>
					</p>
				</c:forEach>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="questionNo" value="${gq.questionNo}"/>
				<span class="search_button" >
					<input type="submit"  id="search_button" value="제출" style="border-radius:0px;"/>
				</span>
			</form>
		</table>

		<div style="text-align:center;">
			<img alt="삭제"
				src="${pageContext.request.contextPath}/resources/img/delete_btn.jpg"
				onclick="deleteQuestion()">
			<img alt="수정"
				src="${pageContext.request.contextPath}/resources/img/modify_btn.jpg"
				onclick="updateQuestion()">
</div>
	</div>

	<%@ include file="../../include/footer.jsp"%>
