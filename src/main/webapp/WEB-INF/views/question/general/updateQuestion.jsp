<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript">

	$(document).ready(function() {
		var count= $('input[name=answerChoice]').length+1
		var ac ='<label for="answerChoice">선택지'+count+':</label><input type="text" name="answerChoice" id="answerChoice" /><br>';
		$('#btnAnswerPlus').click(function() {
			count=count+1;
			
			
			
			$('#answerChoicePlus').html(ac)
		ac+='<label for="answerChoice">선택지'+count+':</label><input type="text" name="answerChoice" id="answerChoice" /><br>';
				})	
	});//document
	
	
	function hide(){
		$('#change').hide();
		
	}
	
	function show(){
		$('#change').show();
		
	}
		

	
	
</script>


</head>

	
<body>

<form action="${path}/question/general/updateQuestionAction?questionNo=${gq.questionNo}" method="post">

<label for="category">객관식</label><input type="radio" name="category" id="category1" value="multipleChoice"  onchange="show()" checked="checked"/>
<label for="category">주관식</label><input type="radio" name="category" id="category2" value="shortAnswer" onchange="hide()"/><br>
<label for="answerChoice">제목:<input type="text" name="title" id="title" value="${gq.title}" /><br>

<label for="question">문제:</label><textarea name="question" id="question" cols="60" rows="30"  >${gq.question}</textarea><br>
<label for="answer">정답:</label><textarea name="answer" id="answer" cols="60" rows="1" >${gq.answer}</textarea><br>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<span id="change">

<c:forEach var="tag" items="${aList}" varStatus="status" begin="0">
<label for="answerChoice">선택지 ${status.index+1}:<input type="text" name="answerChoice" id="answerChoice"  value="${tag.answerChoice}"/><br>

</c:forEach>


<input type="button" id="btnAnswerPlus" value="선택지 추가" /><br>
</span>
<div id="answerChoicePlus"></div>



<input type="submit" value="제출" />
</form>


<a href="${path}/"> 메인페이지로 이동</a>
</body>
</html>
