<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${fn:length(list)!=0}">

<script>
$(document).ready(function() {
	$.ajax({
		type: "post",
		url: "${path}/reply/qna/likeStatus",
		data:"${_csrf.parameterName}=${_csrf.token}&boardNo=${list[0].boardNo}",
		success: function(result){
			$(result).each(function(index,item) {
				 $('#replyGood'+item).attr('src' ,'/learning/resources/img/arrowUpGood.png') ;
			});
		}
	});
});
</script>

<script>
function replyLikeUp(replyNo){
	var param="${_csrf.parameterName}=${_csrf.token}&boardNo=${list[0].boardNo}&likeStatus=likeUp&replyNo="+replyNo;
	$.ajax({
		type: "post",
		url: "${pageContext.request.contextPath}/reply/qna/changeLike",
		data: param,
		success: function(result){
			$("#cntReplyLike"+replyNo).html(result);
			$('#replyGood'+replyNo).attr('src' ,'/learning/resources/img/arrowUpGood.png');
		}
	});
}
function replyLikeDown(replyNo){
	var param="${_csrf.parameterName}=${_csrf.token}&boardNo=${list[0].boardNo}&likeStatus=likeDown&replyNo="+replyNo;
	$.ajax({
		type: "post",
		url: "${pageContext.request.contextPath}/reply/qna/changeLike",
		data: param,
		success: function(result){
			$("#cntReplyLike"+replyNo).html(result);
			$('#replyGood'+replyNo).attr('src' ,'/learning/resources/img/arrowUp.png') ;
		}
	});
}
function toggleBtnView(replyNo) {
  $('a[id=modify'+replyNo+']').toggle();
  $('a[id=deleteReply'+replyNo+']').toggle();
  $('a[id=modifyDo'+replyNo+']').toggle();
  $('a[id=modifyCancel'+replyNo+']').toggle();
}
function showModify(replyNo){
	var replytext=$('div[title=modifyResult'+replyNo+']').html();
  $('div[title=modifyResult'+replyNo+']').html('<textarea class="replyEdit_writeText" rows="3" cols="85" id="reply'+replyNo+'" >'+replytext+' </textarea>');
  toggleBtnView(replyNo)
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
			toggleBtnView(replyNo)
	}
function modifyCancel(replytext,replyNo){
  toggleBtnView(replyNo)
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
  <div class="board-footer common-card">
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
  							<div class="activity"><span class="fa fa-graduation-cap"></span> ${row.member.activity}</div>
  							<div class="date"><span class="timeago">${row.regdate}</span></div>
  						</div>
  					</div>
            <div class="edit-delete">
            <!-- 본인의 댓글만 수정,삭제가 가능하도록 처리 -->
              <sec:authorize access="isAuthenticated()">
                <sec:authentication var="mvo" property="principal" />
                <c:if test="${mvo.userId == row.member.userId}">
                  <span class="replyEdit">
                    <a id="modify${row.replyNo}" onclick="showModify('${row.replyNo}')" >
                      <img src="${path}/resources/img/replyEdit.png" class="image_replyEdit">
                    </a>
                  </span>
                  <span class="delete">
                    <a id="deleteReply${row.replyNo}" onclick="deleteReply('${row.replyNo}','${row.boardNo}')">
                      <img src="${path}/resources/img/eraser.png" class="image_eraser">
                    </a>
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
            <img src="${path}/resources/img/replyEdit.png" class="image_replyEditDone">
          </a>
          <a id="modifyCancel${row.replyNo}" class="modifyCancel" onclick="modifyCancel('${row.replytext}','${row.replyNo}')">
            <img src="${path}/resources/img/cancel.png" class="image_replyCancel">
          </a>
        </div>
				<div class="reply-function">
					<img class="rp-btn-up" id="replyGood${row.replyNo}" src="${path}/resources/img/arrowUp.png" onclick="replyLikeUp('${row.replyNo}')" >
					<span class="rp-cnt-like" id="cntReplyLike${row.replyNo}">${row.cntReplyLike}</span>
					<img class="rp-btn-down" src="${path}/resources/img/arrowDown.png" onclick="replyLikeDown('${row.replyNo}')">
				</div>
			</div>
			</c:forEach>
		</div>
  </c:if>
