<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp" %>
<%@ include file="../../include/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/board/board.css?ver=2">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<script type="text/javascript">

	$(document).ready(function() {
		multiple1();
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
		var answerInput = '<span><input type="radio" name="answer" id="answer'+(answerCnt+1)+'" value="'+(answerCnt+1)+'"><label for="answer'+(answerCnt+1)+'"><input type="text" name="answerChoice" /></label><br></span>'
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
	



</script>
<body>
<div class="common-container">
	<form name="frm1" action="${path}/question/general/insertQuestion" method="post">
	<div style="text-align:center;">
		<input type="radio" name="category" id="category1" value="multipleChoice" onchange="multiple1()" checked="checked" /><label for="category1">객관식</label>
		<input type="radio" name="category" id="category2" value="shortAnswer" onchange="short()" /><label for="category2">주관식</label><br>
	</div>
	<div class="ques-boardTable" >
			<div class="ques-title" >
				<label for="answerChoice">제목:<input type="text" name="title" id="title" class="ques-titleText" value="111" /><br></label>
				
			</div>
			<hr style="margin:20px">
			<div class="ques-content" >
				<textarea name="question" id="question" cols="60" rows="30" class="ques-question"></textarea>
					
			</div>
			
			<div class="ques-footer">
				<div id="short" class="ques-answertitle">정답:
					<input type="text" name="answer" id="answer" class="ques-answer"><br>
				</div>
				
				<div id="multiple">
					<span>
					<input type="radio" name="answer" id="answer1" value="1">
						<label for="answer1"><input type="text" name="answerChoice" class="ques-answerChoice" /></label><br>
					</span>
					<span>
					<input type="radio" name="answer" id="answer2" value="2">
						<label for="answer2"><input type="text" name="answerChoice" class="ques-answerChoice" /></label><br>
					</span>
					<span>	
					<input type="radio" name="answer" id="answer3" value="3">
						<label for="answer3"><input type="text" name="answerChoice" class="ques-answerChoice" /></label><br>
					</span>
					<span>	
					<input type="radio" name="answer" id="answer4" value="4">
						<label for="answer4"><input type="text" name="answerChoice" class="ques-answerChoice" /></label><br>
					</span>
				</div>
			</div>
			<div style="width: 542px; margin: 0px auto;">
				<div class="ques-groupBtn" id="multiple2">
					<input type="button" onclick="addAnswerChoice()" id="btnAnswerPlus" value="선택지 추가" class="general-edit"/>
					<input type="button" onclick="removeAnswerChoice()" id="btnAnswerPlus" value="선택지 제거" class="general-delete" />
					<br><br>
				</div>
				<input type="submit" value="등록" class="general-submit util-width-100" />
			</div>
	</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
</div>
</body>
<%@ include file="../../include/footer.jsp"%>
