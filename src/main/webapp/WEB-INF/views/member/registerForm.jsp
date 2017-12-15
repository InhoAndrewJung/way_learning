<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/member/registerForm.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/css_kei.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var checkResultId="";
	var checkResultEmail="";
	var isGood="";
	var regExp= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	$("#regForm").submit(function(){
		if($("#regForm :input[name=userId]").val().trim()==""){
			alert("아이디를 입력하세요");
			return false;
		}
		if($("#regForm :input[name=password]").val().trim()==""){
			alert("패스워드를 입력하세요");
			return false;
		}
		if($("#regForm :input[name=email]").val().trim()==""){
			alert("이메일을 입력하세요");
			return false;
		}
		$("#regForm").submit(function(){
			if($("#regForm :input[name=email]").val().trim().match(regExp)!=null){
				var isGood=true;
			}else{
				var isGood=false;
			}
			if(isGood){
				return true;
			}else{
				alert("입력된 주소를 확인해주세요");
			return;
			}
		});//submit


		if($("#regForm :input[name=address]").val().trim()==""){
			alert("주소를 입력하세요");
			return false;
		}



		if(checkResultId==""){
			alert("아이디 중복확인을 하세요");
			return false;
		}

	});//submit
	$("#regForm :input[name=userId]").keyup(function(){
		var userId=$(this).val().trim();
		//alert(id);
		if(userId.length<4 || userId.length>10){
			$("#idCheckView").html("4<=ID<=10").css("color","#ed4d3c");
			checkResultId="";
			return;
		}

		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/member/idcheckAjax",
			data:"${_csrf.parameterName}=${_csrf.token}&&userId="+userId,
			success:function(data){
				if(data=="fail"){
				$("#idCheckView").html(" X ").css("color","#ed4d3c");
					checkResultId="";
				}else{
					$("#idCheckView").html("  O ").css("color","#3bb15d");
					checkResultId=userId;
				}
			}//callback
		});//ajax
	});//keyup

	//아래 검증을 정규표현식도 검증하도록 작업해주세요!!!!기쁨씨!!!!
	$("#regForm :input[name=email]").keyup(function(){
		var email=$(this).val().trim();


		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/member/emailcheckAjax",
			data:"${_csrf.parameterName}=${_csrf.token}&&email="+email,
			success:function(data){
				//alert(data);
				if(data!=0){
				$("#emailCheckView").html(" X ").css("color","#ed4d3c");
				checkResultEmail="";
				}else{
					$("#emailCheckView").html(" O ").css("color","#3bb15d");
					checkResultEmail=email;
				}
			}//callback
		});//ajax
	});//keyup

	var uploadFile = $('.update_image .uploadFile');
/* 	uploadFile.on('change', function(){
		if(window.FileReader){
			var filename = $(this)[0].files[0].name;
		} else {
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}
		document.getElementById('fileName').value = filename;
	}); */

	uploadFile.on('change', function(){
        if ($(this)[0].files && $(this)[0].files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('file_preview').src = e.target.result;
            }
            reader.readAsDataURL($(this)[0].files[0]);
        }

        if(window.FileReader){
			var filename = $(this)[0].files[0].name;
		} else {
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}
		document.getElementById('fileName').value = filename;
		document.getElementById('file_preview').style.display ="inline";
	    //$('#file_preview').attr('style', 'display:inline');
	});
});//ready


function toMain() {
	 location.href = "${pageContext.request.contextPath}";
}

</script>
</head>
<body>
<div class="common-container" style="max-width:400px">
	<div class="logo"><img src="${path}/resources/img/google.png" id="image_logo" onclick="toMain()"></div>

	<div class="common-card">
		<form method="post" action="${pageContext.request.contextPath}/member/registerMember?${_csrf.parameterName}=${_csrf.token}" id="regForm"  enctype="multipart/form-data">
			<div class="body">

				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			 	<div class="input_id">
			 		<input name="userId"  placeholder="ID" id="userId" class="text_id">
					 <span id="idCheckView"></span>
				</div>

				<div class="input_pass">
					<input type="password" name="password" placeholder="Password" class="text_pass">

				</div>

				<div class="input_email">
					<input name="email" placeholder="E-mail" class="text_email">
					<span id="emailCheckView"></span>
				</div>

				<div class="update_image">
					<input class="fileName" placeholder="File" id="fileName" readonly="readonly">
					<label for="uploadFile" class="uploadBtn"></label>
					<input type="file" name="uploadFile" id="uploadFile" class="uploadFile">
					<img id="file_preview">

				</div>

			</div>


			<div class="container-footer">

				<hr>
				<input type="submit" value="" class="image_check">
				<img src="/learning/resources/img/cancel.png" class="image_cancel" onclick="toMain()">

			</div>

		</form>
	</div>

</div>

</body>
</html>
