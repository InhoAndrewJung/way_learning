<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp" %>
<%@ include file="../../include/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/board/board.css?ver=2">

<div class="common-container">
	<form name="frm1" action="${path}/question/general/insertQuestion" method="post">
	<div style="text-align:center;">
		<input type="radio" name="category" id="category1" value="multipleChoice" onchange="multiple1()" checked="checked" /><label for="category1">객관식</label>
		<input type="radio" name="category" id="category2" value="shortAnswer" onchange="short()" /><label for="category2">주관식</label><br>
	</div>
	<div class="ques-boardTable" >
			<div class="ques-title" >
				<label for="title">제목:<input type="text" name="title" id="title" class="ques-titleText" /><br></label>

			</div>
			<hr style="margin:20px">
			<div class="ques-content" >
				<textarea name="question" id="question" cols="60" rows="30" class="ques-question"></textarea>

			</div>

			<div id="answerSection" class="ques-footer">
				<div id="short" class="ques-answertitle">정답:
					<input type="text" name="answer" id="answer" class="ques-answer"><br>
          <input type="hidden" name="answerChoice" id="answerChoice"><br>
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
				<input type="button" value="취소" onclick="goBack()" class="general-cancel util-width-100" />
			</div>
	</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
</div>
<script type="text/javascript">
  var multipleHTML = document.getElementById('multiple').innerHTML;
  var shortHTML = document.getElementById('short').innerHTML;
  var answerTarget = document.getElementById('answerSection');
  multiple1();

  function multiple1(){
  	answerTarget.innerHTML = multipleHTML;
    $('#multiple2').show();
  }

  function short(){
    answerTarget.innerHTML = shortHTML;
  	$('#multiple2').hide();
  }
  function addAnswerChoice() {
    /* console.log($('#multiple')[0]); */
    var answerCnt = $('#answerSection')[0].querySelectorAll('span').length;
    var answerInput = '<span><input type="radio" name="answer" id="answer'+(answerCnt+1)+'" value="'+(answerCnt+1)+'"><label for="answer'+(answerCnt+1)+'"><input type="text" name="answerChoice" class="ques-answerChoice" /></label><br></span>'
    console.log(answerInput)
    $('#answerSection').append(answerInput)
  }
  function removeAnswerChoice() {
    var answerCnt = $('#answerSection')[0].querySelectorAll('span').length;
    if ( answerCnt >= 5) {
      $('#answerSection')[0].querySelectorAll('span')[answerCnt-1].remove();
    }else{
      alert("최소 선택지는 4개이상이어야 합니다");
    }
  }
  function goBack() {
    window.history.back();
  }
</script>
<%@ include file="../../include/footer.jsp"%>
