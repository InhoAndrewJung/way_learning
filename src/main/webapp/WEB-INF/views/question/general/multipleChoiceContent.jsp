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
		<div class="question-titleName" style="text-align:left;">Question ${gq.questionNo}</div>
		<a href="${pageContext.request.contextPath}/question/general/getList?keyword=${keyword}">
			<img src="${pageContext.request.contextPath}/resources/img/general-list.png" class="general-toList">
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
		<div class="common-container">
			<form action="${path}/question/general/multipleChoiceResult" method="post">
				<c:forEach var="row" items="${aList}" varStatus="status" begin="0">
					<p style="text-align:left; padding-left: 30px;">
						<input type="radio" name="answer" id="answer${status.index+1}" value="${status.index+1}" />
						<label class="quiz-result-label" for="answer${status.index+1}">${row.answerChoice}</label>
					</p>
				</c:forEach>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="questionNo" value="${gq.questionNo}"/>
			
				<input type="submit" value="제출" class="general-submit"/>		
			</form>
			<div>
			<hr style="margin:10px">
			<input type="button" value="수정" onclick="updateQuestion()" class="general-edit">
			<input type="button" value="삭제" onclick="deleteQuestion()" class="general-delete">
			</div>
		</div>
</div>


	<%@ include file="../../include/footer.jsp"%>
