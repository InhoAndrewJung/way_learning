<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication var="mvo" property="principal" />
<script type="text/javascript">
$(document).ready(function(){
	var checkResultId="";
	var checkResultEmail="";
	var isGood="";
	var regExp= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
		
		$("#updateForm").submit(function(){
			if($("#updateForm :input[name=email]").val().trim().match(regExp)!=null){
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

		$("#updateForm :input[name=email]").keyup(function(){
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


	<form method="post"
		action="${pageContext.request.contextPath}/member/updateMember?${_csrf.parameterName}=${_csrf.token}"
		enctype="multipart/form-data" id="updateForm">

<style>
img {
	width: 100px;
	height: 100px;
	border-radius: 30%
}
</style>


		<img src="${path}/resources/upload/${mvo.imgProfile}"> <br>
		아이디 : <input type="text" name="userId"  value="${mvo.userId}" readonly>
		<br>패스워드 : <input type="text" name="password" id="passCheck" required="required" >
		<br>이메일 : <input type="text" name="email" value="${mvo.email}"><span id="emailCheckView"></span><br><br>
		<br>프로필 사진 : <input type="file" name="uploadFile" id="uploadFile" />

		<br> <input type="submit" value="회원정보수정" onclick="inputCheck()">
	</form>
</sec:authorize>
<h3>회원정보수정</h3>

