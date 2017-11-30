<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="./js/jquery-1.11.3.js"></script> -->
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
			$("#idCheckView").html("4>id length OR id length>10").css("background","pink");
			checkResultId="";
			return;
		}
		
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/member/idcheckAjax",				
			data:"${_csrf.parameterName}=${_csrf.token}&&userId="+userId,	
			success:function(data){						
				if(data=="fail"){
				$("#idCheckView").html("  "+userId+" ID Can't Use!! ").css("background","red");
					checkResultId="";
				}else{						
					$("#idCheckView").html("  "+userId+" ID Can Use!! ").css("background","yellow");		
					checkResultId=id;
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
				$("#emailCheckView").html("  "+email+" EMAIL Can't Use!! ").css("background","red");
				checkResultEmail="";
				}else{						
					$("#emailCheckView").html("  "+email+" EMAIL Can Use!! ").css("background","yellow");		
					checkResultEmail=email;
				}					
			}//callback			
		});//ajax
	});//keyup
	
	
});//ready
</script>
</head>
<body>
<h2>Member Register Form</h2><p>
<form method="post" action="${pageContext.request.contextPath}/member/registerMember?${_csrf.parameterName}=${_csrf.token}" id="regForm"  enctype="multipart/form-data">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
ID <input type="text" name="userId" id="userId"><span id="idCheckView"></span><br><br>
PASSWORD <input type="password" name="password"><br><br>
email <input type="text" name="email"><span id="emailCheckView"></span><br><br>
img_profile <input type="file" name="uploadFile" id="uploadFile" />

<input type="submit" value="Register Member">
</form>
</body>
</html>













