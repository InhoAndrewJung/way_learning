<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp" %>
<%@ include file="../../include/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/board/board.css?ver=2">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>


<script type="text/javascript">

	$(document).ready(function() {
		
	});//document


	function multiple1(){
		$('#multiple').show();
		$('#multiple2').show();
		$('#short').hide();
	}

	function short(){
		$('#multiple').hide();
		$('#multiple2').hide();
		$('#short').show();
	}

	function addAnswerChoice() {
		/* console.log($('#multiple')[0]); */
		var answerCnt = $('#multiple')[0].querySelectorAll('span').length;
		var answerInput = '<span><input type="radio" name="answer" id="answer'+(answerCnt+1)+'" value="'+(answerCnt+1)+'"><label for="answer'+(answerCnt+1)+'"><input type="text" name="answerChoice" class="ques-answerChoice" /></label><br></span>'
		console.log(answerInput)
		$('#multiple').append(answerInput)
		
	}
	
	function removeAnswerChoice() {
		var answerCnt = $('#multiple')[0].querySelectorAll('span').length;
		if ( answerCnt >= 5) {
			$('#multiple')[0].querySelectorAll('span')[answerCnt-1].remove();
		}else{
			alert("최소 선택지는 4개이상이어야 합니다");
		}
		
	}
	
	function goBack() {
		window.history.back();
	}


</script>
<body>
<div class="common-container">
	<form action="${path}/question/general/updateQuestionAction?questionNo=${gq.questionNo}" method="post">
	<div style="text-align:center;">
		<c:if test="${gq.category == 'multipleChoice'}">
			<input type="radio" name="category" id="category1" value="multipleChoice" onchange="multiple1()" checked="checked" /><label for="category1">객관식</label>
		</c:if>
		<c:if test="${gq.category == 'shortAnswer'}">
		<input type="radio" name="category" id="category2" value="shortAnswer" onchange="short()" /><label for="category2">주관식</label><br>
		</c:if>	
	</div>
	<div class="ques-boardTable" >
			<div class="ques-title" >
				<label for="answerChoice">제목:<input type="text" name="title" id="title" class="ques-titleText" value="${gq.title}" /><br></label>
				
			</div>
			<hr style="margin:20px">
			<div class="ques-content" >
				<textarea name="question" id="question" cols="60" rows="30" class="ques-question">${gq.question}</textarea>
					
			</div>
			
			<div class="ques-footer">
				<c:if test="${gq.category == 'shortAnswer'}">
				<div id="short" class="ques-answertitle">정답:
					<input type="text" name="answer" id="answer" class="ques-answer"><br>
				</div>
				</c:if>
				<div id="multiple">
					<c:forEach var="tag" items="${aList}" varStatus="status" begin="0">
					<span>
					<input type="radio" name="answer" id="answer${status.index+1}" <c:if test="${gq.answer==status.index+1}">checked="checked"</c:if> value="${status.index+1}">
						<label for="answer${status.index+1}"><input type="text" name="answerChoice" class="ques-answerChoice" value="${tag.answerChoice}"/></label><br>
					</span>
					</c:forEach>
				</div>
			</div>
			<div style="width: 542px; margin: 0px auto;">
				<c:if test="${gq.category == 'multipleChoice'}">
				<div class="ques-groupBtn" id="multiple2">
					<input type="button" onclick="addAnswerChoice()" id="btnAnswerPlus" value="선택지 추가" class="general-edit"/>
					<input type="button" onclick="removeAnswerChoice()" id="btnAnswerPlus" value="선택지 제거" class="general-delete" />
					<br><br>
				</div>
				</c:if>
				<input type="submit" value="수정" class="general-submit util-width-100" />
				<input type="button" value="취소" onclick="goBack()" class="general-cancel util-width-100" />
			</div>
	</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
</div>
</body>




<%@ include file="../../include/footer.jsp"%>
