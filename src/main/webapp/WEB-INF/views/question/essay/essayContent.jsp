<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.2.9/ace.js" type="text/javascript" charset="utf-8"></script>
<title>Coding everywhere.</title>
</head>
<body>
	<style type="text/css" media="screen">
    #codebox { 
        position: relative;

        width : 100%;
        height : 450px;
    }
</style>


	
</head>
<body>

<div class="container ">
<div class="row ">
			 <div class="col"> <br/><br/><a href="index.jsp" style="text-decoration:none;color:black;"><h2>THE CODER</h2></a></div>
		</div>
		<div class="dropdown-divider"></div>

<!-- Custom row start -->		
<div class="crow">	
<br>
<!-- Question area start -->
<div class="alert alert-secondary" role="alert">
  <h4><strong>문제 ${aq.questionNo} : ${aq.title }</strong></h4>
  <p>${aq.question }</p>
  <h5><strong>입력</strong></h5>
  <p>${aq.input }</p>
  <h5><strong>출력</strong></h5>
  <p>${aq.output}</p>
</div>
<!-- Question area start -->
<!-- code write area start -->
<form name="form" action="${path}/question/essay/essayResult " method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<input type="hidden" name="questionNo" value="${aq.questionNo}">

    <label for="write-code" class="text-muted">코드 작성</label>
     <div class="form-group">
    <div id="codebox" name="code" >	import java.util.*;
	import java.io.*;
	
	
    public class code {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		
		
		
		
		
		
		
		
		
	}
}
</div>
</div>

  

<div class="p-1 mb-1 bg-warning text-white">클래스 이름 code는 변경할 수 없습니다.</div>
<!-- <div class="p-1 mb-1 bg-success text-white">System.in은 추후 문제용으로 제공예정입니다.</div> -->
<!-- <div class="p-1 mb-1 bg-danger text-white">서버에 영향을 줄 수 있는 코드는 입력을 금지합니다.</div> -->
<input type="hidden" id="context" name="code"></input>
<span class="d-flex justify-content-end"><input type="submit" class="btn btn-primary" value="제출" onClick='getValue()'/></span>
</form>
<!-- code write area end -->
</div>
<!-- Custom row end -->
<div style="height:100px"></div>




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
<a href="${pageContext.request.contextPath}/question/essay/getList?keyword=${keyword}"> 목록가기</a>
		<a href="${path}/"> 메인페이지로 이동</a>
</body>
</html>
