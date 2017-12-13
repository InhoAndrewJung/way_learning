<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../include/common.jsp" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/board/reply_list.css?ver=2">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Insert title here</title>

<script>
$(document).ready(function() {
	
	$.ajax({
		
		type: "post",
		url: "${path}/reply/qna/likeStatus",
		data:"${_csrf.parameterName}=${_csrf.token}",
		success: function(result){
			
			
			
			$(result).each(function(index,item) {
				
				//$('#boardGood'+item).css({'width':500});
				 $('#replyGood'+item).attr('src' ,'/learning/resources/img/arrowUpGood.png') ;	
			});

			
			//alert("likeUp ajax result:"+result);
			
			//$("#cntBoardLike").html(result);
			
		}
		
	});
	

});
</script>
<script>

function replyLikeUp(replyNo){

	var param="${_csrf.parameterName}=${_csrf.token}&likeStatus=likeUp&replyNo="+replyNo;
	
	$.ajax({
		type: "post",
		url: "${pageContext.request.contextPath}/reply/qna/changeLike",
		data: param,
		success: function(result){
			
			//alert("likeUp ajax result:"+result);
			
			$("#cntReplyLike"+replyNo).html(result);
			$('#replyGood'+replyNo).attr('src' ,'/learning/resources/img/arrowUpGood.png');	
		}
		
	});
	
	
	
}	

function replyLikeDown(replyNo){
	
	var param="${_csrf.parameterName}=${_csrf.token}&likeStatus=likeDown&replyNo="+replyNo;
	
	$.ajax({
		type: "post",
		url: "${pageContext.request.contextPath}/reply/qna/changeLike",
		data: param,
		success: function(result){
			
			//alert("likeDown ajax result:"+result);
			
			$("#cntReplyLike"+replyNo).html(result);
			$('#replyGood'+replyNo).attr('src' ,'/learning/resources/img/arrowUp.png') ;
		}
		
	});
	

}	
	
	
function showModify(replyNo){
	//alert("수정시작");
	var replytext=$('div[title=modifyResult'+replyNo+']').html();
	  $('div[title=modifyResult'+replyNo+']').html('<textarea class="replyEdit_writeText" rows="3" cols="85" id="reply'+replyNo+'" >'+replytext+' </textarea>');
	//버튼변경하기
	$('a[id=modify'+replyNo+']').hide();
	$('a[id=deleteReply'+replyNo+']').hide();
	$('a[id=modifyDo'+replyNo+']').show();
	$('a[id=modifyCancel'+replyNo+']').show();
	
	
}  
 


 



 function modify(replyNo){
		
		var replytext=$('#reply'+replyNo+'').val();
		
		 var param="${_csrf.parameterName}=${_csrf.token}&replytext="+replytext+"&replyNo="+replyNo;
		 $.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/reply/qna/update",
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
 
 function deleteReply(replyNo,boardNo){
		
		if(confirm("정말 삭제하시겠습니까?")){
			
			 var param="${_csrf.parameterName}=${_csrf.token}&replyNo="+replyNo+"&boardNo="+boardNo;
			 $.ajax({
					type: "post",
					url: "${pageContext.request.contextPath}/reply/qna/delete",
					data: param,
					success:function(){
						listReply();
					}
				}); 
	
		}

	}  

</script>
<!-- <style>
#modifyDo{display:none;}
.modifyCancel{display:none;}
.replyCancel{display:none;}
#replyInsertBtn{display:none;}
table {border:1px solid #000;}
</style> -->
</head>
<body>



	<div class="board-footer">
			<div class="reply-title">
				<span class="footer_comment"> 
					<img src="${path}/resources/img/reply.png" id="footer_image_reply"> ${fn:length(list)}
				</span> 
			</div>
			<c:forEach var="row"  items="${list}">	
			<div class="reply-center">
				<div class="reply-body">

					<div class="reply-head">

						<div class="userList">
							<img src="${path}/resources/upload/${row.member.imgProfile}" id="image_profile">

							<div class="userList-info">
								<a class="userId">${row.member.userId}</a>

								<div class="activity">

									<span class="fa fa-graduation-cap"></span> ${row.member.activity}
								</div>

								<div class="date">
									<span class="timeago">${row.regdate}</span>

								</div>

							</div>

						</div>

					<div class="edit-delete">
						 <!-- 본인의 댓글만 수정,삭제가 가능하도록 처리 -->
  	 						<sec:authorize access="isAuthenticated()">
  	 							<sec:authentication var="mvo" property="principal" /> 
									<c:if test="${mvo.userId == row.member.userId}">
									<span class="replyEdit"> 
										<a id="modify${row.replyNo}" onclick="showModify('${row.replyNo}')" >
										<img src="${path}/resources/img/replyEdit.png" class="image_replyEdit"></a>
									</span> 
								
									<span class="delete"> 
										<a id="deleteReply${row.replyNo}" onclick="deleteReply('${row.replyNo}','${row.boardNo}')">
										<img src="${path}/resources/img/eraser.png" class="image_eraser"></a>
									</span>
											
						
   
   							</c:if>
  						 </sec:authorize>
					</div>

				</div>
				
				<!-- 댓글 내용 -->
				<hr>
				<div class="reply-text" title="modifyResult${row.replyNo}">${row.replytext}</div>
				
					<!-- 디자인 수정 해야함************************** -->				
						<a  id="modifyDo${row.replyNo}" class="edit_done" onclick="modify('${row.replyNo}')">
							<img src="${path}/resources/img/replyEdit.png" class="image_replyEditDone"></a>
  						 <a id="modifyCancel${row.replyNo}" class="modifyCancel" onclick="modifyCancel('${row.replytext}','${row.replyNo}')">
  						 	<img src="${path}/resources/img/cancel.png" class="image_replyCancel"></a>
  						 
				</div>
				
				<div class="reply-function">
				
					<img  id="replyGood${row.replyNo}" src="${path}/resources/img/arrowUp.png" style="width:20px; height:20px;cursor:pointer;float:right; " onclick="replyLikeUp('${row.replyNo}')" ><br>
					<span id="cntReplyLike${row.replyNo}" style="width:20px; height:20px;cursor:pointer;float:right; ">${row.cntReplyLike}</span><br><br>
					<img  src="${path}/resources/img/arrowDown.png" style="width:20px; height:20px;cursor:pointer;float:right;" onclick="replyLikeDown('${row.replyNo}')">
	
	
					<%-- <img id="replyGood${row.replyNo}" src="${path}/resources/img/empty_heart.png" class="reply_function-like" onclick="replyLikeUp('${row.replyNo}')" >
					<span id="cntReplyLike${row.replyNo}" class="reply_cntLike">${row.cntReplyLike}</span><br><br>  --%>
				</div>
				
			</div>
			</c:forEach>
		</div>
	
				
		
		




<%-- 
<c:forEach var="row"  items="${list}">
<table style="width:700px; " >
  <tr>
  	<td  nowrap algin="left">
  	 <img id="profile" src="${path}/resources/upload/${row.member.imgProfile}">
  	 ${row.member.userId}   ${row.member.activity}<br>
  	 <span style="font-size:10px">(${row.regdate}  ) </span> 
  	<img  id="replyGood${row.replyNo}" src="${path}/resources/img/arrowUp.png" style="width:20px; height:20px;cursor:pointer;float:right; " onclick="replyLikeUp('${row.replyNo}')" ><br>
	<span id="cntReplyLike${row.replyNo}" style="width:20px; height:20px;cursor:pointer;float:right; ">${row.cntReplyLike}</span><br><br>
	<img  src="${path}/resources/img/arrowDown.png" style="width:20px; height:20px;cursor:pointer;float:right;" onclick="replyLikeDown('${row.replyNo}')">
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

  <a href=# id="deleteReply${row.replyNo}" style="color:red; float:right;text-decoration:none;font-size:10px;" onclick="deleteReply('${row.replyNo}','${row.boardNo}')">삭제 </a> 
  <a href="#" id="modify${row.replyNo}" style="float:right;text-decoration:none;font-size:10px;" onclick="showModify('${row.replyNo}')" >수정 &nbsp;|&nbsp;</a> 
   <input type="button" value="수정" name="modifyDo${row.replyNo}" id="modifyDo" style="width:70px;height:30px;" onclick="modify('${row.replyNo}')">
   <a href="#" id="modifyCancel${row.replyNo}" class="modifyCancel" style="color:red;text-decoration:none;font-size:10px;" onclick="modifyCancel('${row.replytext}','${row.replyNo}')">수정취소</a>
   
   </c:if>
   </sec:authorize>
   <br>

  
  	</td>
  	
  </tr>
  
</table>
</c:forEach> --%>



</body>
</html>