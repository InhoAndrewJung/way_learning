<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp" %>

<link rel="stylesheet" href="${path}/resources/css/member/updateForm.css">
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
		var uploadFile = $('.update_image .uploadFile');
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
<sec:authorize access="isAuthenticated()">
  <h2 class="mypage_title">내 정보 수정</h2>
	<form method="post" action="${pageContext.request.contextPath}/member/updateMember?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data" id="updateForm">
  	<div class="common-card">
  		<div class="body">
  		 	<div class="input_id">
  		 		<input name="userId"  id="userId" class="text_id"  value="${mvo.userId}" readonly>
  			</div>
  			<div class="input_pass">
  				<input type="password" name="password" placeholder="Password"  id="passCheck" required="required" class="text_pass">
  			</div>
  			<div class="input_email">
  				<input name="email" class="text_email"value="${mvo.email}"><span id="emailCheckView"></span>
  			</div>
  			<div class="update_image">
  				<input class="fileName" placeholder="File" id="fileName" readonly="readonly">
  				<label for="uploadFile" class="uploadBtn"></label>
  				<input type="file" name="uploadFile" id="uploadFile" class="uploadFile">
  				<img id="file_preview" src="${path}/resources/upload/${mvo.imgProfile}">
  			</div>
  		</div>
  		<div class="container-footer">
  			<hr>
  			<input type="submit" value="" onclick="inputCheck()" class="image_check">
  			<img src="/learning/resources/img/cancel.png" class="image_cancel" onclick="toMain()">
  		</div>
  	</div>
	</form>
</sec:authorize>
