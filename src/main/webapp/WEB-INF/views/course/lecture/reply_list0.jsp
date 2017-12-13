<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp" %>
<script>
function showModify(replyNo){
  //alert("수정시작");
  var replytext=$('span[title=modifyResult'+replyNo+']').html();
  $('span[title=modifyResult'+replyNo+']').html('<textarea rows="5" cols="80" id="reply'+replyNo+'" >'+replytext+' </textarea>');
  //버튼변경하기
  $('a[id=modify'+replyNo+']').hide();
  $('a[id=deleteReply'+replyNo+']').hide();
  $('input[name=modifyDo'+replyNo+']').show();
  $('a[id=modifyCancel'+replyNo+']').show();
}
 function modify(replyNo){
  var replytext=$('#reply'+replyNo+'').val();
  var param="${_csrf.parameterName}=${_csrf.token}&lectureNo=${list[0].lectureNo}&courseNo=${list[0].courseNo}&replytext="+replytext+"&replyNo="+replyNo;
  $.ajax({
    type: "post",
    url: "${pageContext.request.contextPath}/lectureReply/updateReply",
    data: param,
    success:function(result){
      //alert("result:"+result.replyText);
      $('span[title=modifyResult'+replyNo+']').html(result.replyText);
    }
  });
	//버튼변경하기
  $('a[id=modify'+replyNo+']').show();
  $('a[id=deleteReply'+replyNo+']').show();
  $('input[name=modifyDo'+replyNo+']').hide();
  $('a[id=modifyCancel'+replyNo+']').hide();
}
function modifyCancel(replytext,replyNo){
  $('a[id=modify'+replyNo+']').show();
  $('a[id=deleteReply'+replyNo+']').show();
  $('input[name=modifyDo'+replyNo+']').hide();
  $('a[id=modifyCancel'+replyNo+']').hide();
  $('span[title=modifyResult'+replyNo+']').html(replytext);
}
function deleteReply(replyNo){
	if(confirm("정말 삭제하시겠습니까?")){
		var param="${_csrf.parameterName}=${_csrf.token}&lectureNo=${list[0].lectureNo}&courseNo=${list[0].courseNo}&replyNo="+replyNo;
		 $.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/lectureReply/deleteReply",
				data: param,
				success:function(){
					listReply();
				}
			});
	}
}

</script>
<style>
  #modifyDo{display:none;}
  .modifyCancel{display:none;}
  .replyCancel{display:none;}
  #replyInsertBtn{display:none;}
  table {border:1px solid #000;}
</style>
</head>
<body>

<c:forEach var="row"  items="${list}">
<table style="width:700px; " >
  <tr>
  	<td  nowrap algin="left">
  	 <img id="profile" src="${path}/resources/upload/${row.member.imgProfile}">
  	 ${row.member.userId} ${row.member.activity}<br>
  	 <span style="font-size:10px">(  <fmt:formatDate value="${row.regDate}" pattern="YYYY.MM.dd"/>     ) </span>
  <br><br>

  	  <br>
  	</td>
   </tr>

 <tr>
 <td  nowrap >
 	<span id="modifyResult" title="modifyResult${row.replyNo}" > ${row.replytext} </span><br>
  	 <!-- 본인의 댓글만 수정,삭제가 가능하도록 처리 -->
  	 <sec:authorize access="isAuthenticated()">
  	 <sec:authentication var="mvo" property="principal" />
  	 <c:if test="${mvo.userId == row.member.userId}">

  <a href=# id="deleteReply${row.replyNo}" style="color:red; float:right;text-decoration:none;font-size:10px;" onclick="deleteReply('${row.replyNo}')">삭제 </a>
  <a href="#" id="modify${row.replyNo}" style="float:right;text-decoration:none;font-size:10px;" onclick="showModify('${row.replyNo}')" >수정 &nbsp;|&nbsp;</a>
   <input type="button" value="수정" name="modifyDo${row.replyNo}" id="modifyDo" style="width:70px;height:30px;" onclick="modify('${row.replyNo}')">
   <a href="#" id="modifyCancel${row.replyNo}" class="modifyCancel" style="color:red;text-decoration:none;font-size:10px;" onclick="modifyCancel('${row.replytext}','${row.replyNo}')">수정취소</a>

   </c:if>
   </sec:authorize>
   <br>


  	</td>

  </tr>

</table>
</c:forEach>



</body>
</html>
