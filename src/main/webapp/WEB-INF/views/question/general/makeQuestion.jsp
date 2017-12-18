<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp" %>
<%@ include file="../../include/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/board/board.css?ver=2">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<script type="text/javascript">

	$(document).ready(function() {

		var count= $('input[name=answerChoice]').length+1

		var ac ='<label for="answerChoice">선택지'+count+':</label><input type="text" name="answerChoice" id="answerChoice" /><br>';
		$('#btnAnswerPlus').click(function() {
			count=count+1;



			$('#answerChoicePlus').html(ac)
		ac+='<label for="answerChoice">선택지'+count+':</label><input type="text" name="answerChoice" id="answerChoice" /><br>';
						/* 	 $('#btnAnswerPlus').one('click',function() {
			$('#answerChoicePlus').slideToggle();
		})	  */

		})
	});//document


	function hide(){
		$('#change').hide();

	}

	function show(){
		$('#change').show();

	}




</script>

<div class="container">
<form action="${path}/question/general/insertQuestion" method="post">
<div style="text-align:center;">
<input type="radio" name="category" id="category1" value="multipleChoice" onchange="show()" checked="checked"/><label for="category1">객관식</label>
<input type="radio" name="category" id="category2" value="shortAnswer" onchange="hide()" /><label for="category2">주관식</label><br>
</div>
<table class="boardTable" style="text-align: center">
			<tr class="table-center" style="height:40">
				<td><label for="answerChoice">제목:<input type="text" name="title" id="title" /><br></label></td>
			</tr>
			<tr class="table-center" style="height:40">
				<td><label for="question">문제:</label><textarea name="question" id="question" cols="60" rows="30"></textarea><td>
			</tr>
			<tr>
				<td><label for="answer">정답:</label><textarea name="answer" id="answer" cols="60" rows="1"></textarea><br></td>
			</tr>
			<tr class="table-center">
				<td>
					<span id="change">
						<label for="answerChoice">선택지1:<input type="text" name="answerChoice" id="answerChoice" /><br>
						<label for="answerChoice">선택지2:<input type="text" name="answerChoice" id="answerChoice" /><br>
						<label for="answerChoice">선택지3:<input type="text" name="answerChoice" id="answerChoice"/><br>
						<label for="answerChoice">선택지4:<input type="text" name="answerChoice" id="answerChoice" /><br>
						<div id="answerChoicePlus"></div>
					</label></label></label></label></span></td>
			</tr>
			<tr>
				<td>
					<input type="button" id="btnAnswerPlus" value="선택지 추가" />&nbsp;<input type="submit" value="제출" />
				</td>
			</tr>
			</table>



<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<!-- <label for="question">문제:</label><input type="text" name="question" id="question" /><br> -->
<!-- <label for="answer">정답:</label><input type="text" name="answer" id="answer" /><br> -->














</form>
<div style="text-align:center;">
<a href="${path}/"> 메인페이지로 이동</a>
</div>
</div>

<%@ include file="../../include/footer.jsp"%>
