<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp"%>
<%@ include file="../../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"	crossorigin="anonymous"></script>
<link rel="stylesheet" href="${path}/resources/css/board/board.css?ver=2">
<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.2.9/ace.js" type="text/javascript" charset="utf-8"></script>
<title>Coding everywhere.</title>
</head>
<body>
	<div class="common-container">
		<div class="move-boardList">
			<div class="question-titleName" style="text-align:left;">Question ${aq.questionNo-999} : ${aq.title }</div>
			<a	href="${pageContext.request.contextPath}/question/essay/getList?keyword=${keyword}">
				<img src="${pageContext.request.contextPath}/resources/img/general-list.png" class="general-toList">
			</a>
		</div>

		<!-- Custom row start -->
		<div class="algo-content">
			<br>
			<!-- Question area start -->
			<div class="algo-question">
				<p>${aq.question }</p>
				<h2>
					<strong>입력</strong>
				</h2>
				<p>${aq.input }</p>
				<h2>
					<strong>출력</strong>
				</h2>
				<p>${aq.output}</p>
			</div>
			<!-- Question area start -->
			<!-- code write area start -->
			<form name="form" action="${path}/question/essay/essayResult" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 
				<input type="hidden" name="questionNo" value="${aq.questionNo}"> 
				<div class="form-group">
					<div id="codebox" name="code">	import java.util.*;
	import java.io.*;
	
	
    public class code {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		
		
		
	
		}
	}
					</div>
				</div>
			
				<input type="hidden" id="context" name="code"/>
			<div class="common-container">
			<hr style="margin:10px"> 
					<input type="submit" value="제출" class="general-submit"  onClick='getValue()' />
				</form>
			</div>
		</div>
<script>
    var editor = ace.edit("codebox");
    editor.setTheme("ace/theme/monokai");
    editor.getSession().setMode("ace/mode/java");
    document.getElementById('codebox').style.fontSize='15px';
    console.log(editor.getValue());
    
    function getValue(){
    	var editor = ace.edit("codebox");
    	$("#context").val(editor.getValue());
    }
</script>
			
			<!-- code write area end -->
		</div>
		
		
</div>
	<%@ include file="../../include/footer.jsp"%>
</body>

</html>
