<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/board.css?ver=2">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
<%-- ${gq.category} --%>



<table class="boardTable" style="text-align: center">
<form action="${path}/question/general/updateQuestionAction?questionNo=${gq.questionNo}" method="post">
<tr class="table-center" style="height:40">
	<td>
		<c:if test="${gq.category == 'multipleChoice'}">
		<label for="category">객관식</label><input type="radio" name="category" id="category1" value="multipleChoice"  onchange="show()" <c:out value="checked"></c:out> />
		</c:if>
		<c:if test="${gq.category == 'shortAnswer'}">
		<label for="category">주관식</label><input type="radio" name="category" id="category2" value="shortAnswer" onchange="hide()" <c:out value="checked"></c:out> />
		</c:if><br>
	</td>
</tr>
<tr class="table-center"  style="height:40">
	<td >
		<label for="answerChoice">제목:<input type="text" name="title" id="title" value="${gq.title}" /><br>
	</label>
	</td>
</tr>	
<tr class="table-center"  style="height:40">
	
	<td>
	<span>
		<label for="question">문제:</label>
	</span>
		<textarea name="question" id="question" cols="60" rows="30"  >${gq.question}</textarea><br>
	</td>
</tr>
<tr class="table-center" style="height:40">
	<td>
		<label for="answer">정답:</label><textarea name="answer" id="answer" cols="60" rows="1" >${gq.answer}</textarea>
	</td>
</tr>

<tr class="table-center" style="height:40">
	<td>
		<span id="change">

		<c:forEach var="tag" items="${aList}" varStatus="status" begin="0">
		<label for="answerChoice">선택지 ${status.index+1}:<input type="text" name="answerChoice" id="answerChoice"  value="${tag.answerChoice}"/><br>
		
		</c:forEach>
		<div id="answerChoicePlus"></div>
		
		<input type="button" id="btnAnswerPlus" value="선택지 추가" /><br>
		</span>
	</td>
</tr>

<tr class="table-center" style="height:40">
	<td>
		<input type="submit" value="제출" />
	</td>
</tr>

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">


</form>
</table>
<div style="text-align:center;">
<a href="${path}/"> 메인페이지로 이동</a>
</div>
</body>
</html>
