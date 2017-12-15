<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script>
$(document).ready(function() {
	listReply(); //댓글 목록
	showWatchResult();
	$('#btnReply').click(function(){
		var replytext=$("#replytext").val();
		var lectureNo="${lvo.lectureNo}";
		var courseNo="${lvo.courseNo}";
		var param="${_csrf.parameterName}=${_csrf.token}&replytext="+replytext+"&lectureNo="+lectureNo+"&courseNo="+courseNo;
		$.ajax({
			type: "post",
			url: "${pageContext.request.contextPath}/lectureReply/insertReply",
			data: param,
			success: function(){
				listReply(); //이거안하면 새로고침해야 쓴게 나옴!!!
			}
		});
		$("#replytext").val("");
	});
		$('#finishLecture').click(function(){
			var watchLectureText=$("#finishLecture").val();
			alert(watchLectureText)
			var lectureNo="${lvo.lectureNo}";
			var courseNo="${lvo.courseNo}";
			var param="${_csrf.parameterName}=${_csrf.token}&replytext="+replytext+"&lectureNo="+lectureNo+"&courseNo="+courseNo;
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/lectureBoard/changeMyLecutreRecord",
				data: param,
				success: function(){
					if(watchLectureText == "다 봤어요"){
						$("#finishLecture").val("다 봤어요 취소");
					}else{
						$("#finishLecture").val("다 봤어요");
					}
				}
			});
		});
});
	//댓글 불러오는 방식
function listReply(){
	$.ajax({
		type:"get",
		url: "${pageContext.request.contextPath}/lectureReply/listReply?lectureNo=${lvo.lectureNo}&courseNo=${lvo.courseNo}",  //url방식으로 보내기!! url 밑에 param: 해서 정의 안함!!!!
		success: function(result){
			$("#listReply").html(result);
		}
	});
 }
function showWatchResult(){
	 $.ajax({
		type:"get",
		url: "${pageContext.request.contextPath}/lectureBoard/isMyLectureRecordExist?lectureNo=${lvo.lectureNo}&courseNo=${lvo.courseNo}",  //url방식으로 보내기!! url 밑에 param: 해서 정의 안함!!!!
		success: function(result){
			//alert("result:"+result)
			if(result==1){
				$("#finishLecture").val('다 봤어요 취소');
			}else{
				$("#finishLecture").val('다 봤어요');
			}
		}
	});
}
function deleteBoard(){
	if(confirm("해당 글을 삭제하시겠습니까?")){
		location.href="${pageContext.request.contextPath}/board/qna/delete?boardNo=${requestScope.bvo.boardNo}";
	}
}
function updateBoard(){
	if(confirm("해당 글을 수정하시겠습니까?")){
		location.href="${pageContext.request.contextPath}/board/qna/updateView?boardNo=${requestScope.bvo.boardNo}";
	}
}
</script>
<script>
function showModify(replyNo){
  //alert("수정시작");
  var replytext=$('div[title=modifyResult'+replyNo+']').html();
  $('div[title=modifyResult'+replyNo+']').html('<textarea id="reply'+replyNo+'" >'+replytext+' </textarea>');
  //버튼변경하기
  $('a[id=modify'+replyNo+']').hide();
  $('a[id=deleteReply'+replyNo+']').hide();
  $('a[id=modifyDo'+replyNo+']').show();
  $('a[id=modifyCancel'+replyNo+']').show();
}
 function modify(replyNo){
  var replytext=$('#reply'+replyNo+'').val();
  var param="${_csrf.parameterName}=${_csrf.token}&lectureNo=${lvo.lectureNo}&courseNo=${lvo.courseNo}&replytext="+replytext+"&replyNo="+replyNo;
  $.ajax({
    type: "post",
    url: "${pageContext.request.contextPath}/lectureReply/updateReply",
    data: param,
    success:function(result){
      //alert("result:"+result.replyText);
      $('div[title=modifyResult'+replyNo+']').html(result.replyText);
    }
  });
	//버튼변경하기
  $('a[id=modify'+replyNo+']').show();
  $('a[id=deleteReply'+replyNo+']').show();
  $('a[id=modifyDo'+replyNo+']').hide();
  $('a[id=modifyCancel'+replyNo+']').hide();
}
function modifyCancel(replytext,replyNo){
  $('a[id=modify'+replyNo+']').show();
  $('a[id=deleteReply'+replyNo+']').show();
  $('a[id=modifyDo'+replyNo+']').hide();
  $('a[id=modifyCancel'+replyNo+']').hide();
  $('div[title=modifyResult'+replyNo+']').html(replytext);
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
	#listReply {
		margin-top:20px;
		box-shadow: 1px 1px 2px 1px #ddd;
		border-radius:3px;
	}
	.reply-head {padding: 15px 15px 4px 15px;}
	.reply-body {border-right:none !important;margin:0 !important;width:100% !important}
	.reply-center hr {
		margin-top: 10px;
    width: 97%;
    border: none;
    height: 1px;
    border-bottom: 1px #ccc solid;
	}
	.reply-text {
		margin: 0;
		width: 90%;
		padding:0 5%;
	}
	.reply-text textarea {
		width: 95%;
    margin: 0px auto;
    resize: none;
    border-radius: 10px;
    position: relative;
    display: block;
    height: auto;
    overflow-x: hidden;
    min-height: 70px;
		padding:10px;
	}
	.reply-textWrite {min-width:unset !important; width:100% !important}
	.reply-textWrite textarea {
		min-height:130px;
		padding-right:20%;
	}
	.reply_writeText{width:77% !important;}
	.reply-textWrite textarea:focus{outline: none;}
	.userId { max-width:70%;}
</style>
<style>
	.cke_top {display: none !important;}
	.cke_bottom {display: !important;}
	#cke_content { border:none; margin-top:20px; box-shadow: none;}
</style>
<h1>제 ${lvo.lectureOrder}강, ${lvo.lectureName}</h1><span class="date">작성일 <fmt:formatDate value="${lvo.regDate}" pattern="YYYY.MM.dd" /></span>
<textarea id="content" name="content"  >${lvo.content} </textarea>
<script>
    //CKEDITOR.replace("content",{  removePlugins : 'elementspath' , resize_enabled : false});  // 태그의 id
   // CKEDITOR.on('instanceLoaded', function(e){e.editor.resize(700, 700)});
     // CKEDITOR.replace("content");
	CKEDITOR.replace( 'content', {
		extraPlugins: 'autogrow,youtube',
		autoGrow_minHeight: 400,
		autoGrow_maxHeight: 10000,
		autoGrow_bottomSpace: 50,
		resize_enabled : false,
		removePlugins : 'elementspath',
		readOnly : true
	} );
	console.log(CKEDITOR)
</script>
<div align="center" >
	<input type="button" value="다 봤어요" id="finishLecture" /><!-- <span id="watchLectureCnt" > </span> --> </div>
		                        	<!-- 댓글목록 출력 -->
	<div id="listReply" class="util-width-100"></div>
		<sec:authorize access="isAuthenticated()">
			<div class="reply-textWrite">
				<textarea class="reply_writeText" id="replytext" placeholder="댓글을 작성하세요"></textarea>
				<div class="write_button">
					<img src="${pageContext.request.contextPath}/resources/img/write.png" class="image_write" id="btnReply" style="cursor:pointer">
				</div>
			</div>
		</sec:authorize>
</body>
</html>
