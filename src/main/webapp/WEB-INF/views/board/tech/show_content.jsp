<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp"%>
<%@ include file="../../include/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/board/board.css">
<script>
$(document).ready(function() {
	listReply(); //댓글 목록
	$.ajax({
		type: "post",
		url: "${pageContext.request.contextPath}/board/tech/likeStatus",
		data:"${_csrf.parameterName}=${_csrf.token}&boardNo=${requestScope.bvo.boardNo}",
		success: function(result){
			if(result!=0){
				$('#boardGood'+result).attr('src' ,'${pageContext.request.contextPath}/resources/img/reply_heart.png') ;
				document.getElementById('cntBoardLike').style.color="white"
			} else { document.getElementById('cntBoardLike').style.color="#c70310" }
		}
	});

	$('#btnReply').click(function(){
		reply();
	});
	function reply(){
		var replytext=$("#replytext").val();
		var boardNo="${requestScope.bvo.boardNo}"; // view 컨트롤러에서 가져옴!
		//비밀댓글 체크 여부
		var param="${_csrf.parameterName}=${_csrf.token}&replytext="+replytext+"&boardNo="+boardNo;
		$.ajax({
			type: "post",
			url: "${pageContext.request.contextPath}/reply/tech/insert",
			data: param,
			success: function(){
				listReply(); //이거안하면 새로고침해야 쓴게 나옴!!!
			}
		});
		$("#replytext").val("");
	}
});
	//댓글 불러오는 방식
function listReply(){
	$.ajax({
		type:"get",
		url: "${pageContext.request.contextPath}/reply/tech/list?boardNo=${requestScope.bvo.boardNo}",  //url방식으로 보내기!! url 밑에 param: 해서 정의 안함!!!!
		success: function(result){
			$("#listReply").html(result);
		}
	});
}
function deleteBoard(){
	if(confirm("해당 글을 삭제하시겠습니까?"))
		location.href="${pageContext.request.contextPath}/board/tech/delete?boardNo=${requestScope.bvo.boardNo}";
}

function updateBoard(){
	location.href="${pageContext.request.contextPath}/board/tech/updateView?boardNo=${requestScope.bvo.boardNo}";
}

function boardLikeChange(boardNo){
	var param="${_csrf.parameterName}=${_csrf.token}&boardNo="+boardNo;
	$.ajax({
		type: "post",
		url: "${pageContext.request.contextPath}/board/tech/changeLike",
		data: param,
		success: function(result){
			$("#cntBoardLike").html(result);
			 var src=$('#boardGood'+boardNo).attr('src') ;
			 if(src =='/learning/resources/img/reply_heart.png'){
				 $('#boardGood'+boardNo).attr('src' ,'/learning/resources/img/empty_heart.png') ;
				 document.getElementById('cntBoardLike').style.color="#c70310"
			 }else if(src =='/learning/resources/img/empty_heart.png'){
				 $('#boardGood'+boardNo).attr('src' ,'/learning/resources/img/reply_heart.png') ;
				 document.getElementById('cntBoardLike').style.color="white"
			 }
		}
	});
}
function shareSns(){
  var url = "http://127.0.0.1:7777/learning"
  window.open("https://www.facebook.com/sharer/sharer.php?u="+encodeURIComponent(url+"/board/tech/showContent?boardNo=${requestScope.bvo.boardNo}")+"&t="+encodeURIComponent('Q&A 게시판'), 'Facebook으로 공유하기', "menubar=no,toolbar=no,resizable=no,scrollbars=yes,height=300,width=600")
}

</script>
<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<style>
  .cke_top { display: none !important; }
  .cke_bottom {display: !important;}
  a{text-decoration:none; cursor: pointer;}
</style>




<c:if test="${replyNo !=null}">

<script>
setTimeout(function(){
	 var heightItem=$('#replyGood'+${replyNo}+'').offset().top;
	$('body,html').animate({scrollTop:heightItem-300});
	var target= document.getElementById('replyGood'+${replyNo}).parentElement.parentElement
	target.classList.add('reply-highlight')
	setTimeout(function() {
		target.classList.remove('reply-highlight')
	},1000)

},700) ;
</script>

</c:if>



<div class="move-boardList">
  <div class="titleName" style="margin-top:40px;text-align:left;">
  	<img src="${pageContext.request.contextPath}/resources/img/question.png" id="image_title"> TECH
  </div>
  <a href="${pageContext.request.contextPath}/board/tech/list?keyword=${keyword}">
    <img src="${path}/resources/img/list.png" id="image_list">
  </a>
</div>
	<div class="container-board common-card">
		<div class="board-head">
			<div class="userList">
				<img src="${path}/resources/upload/${bvo.member.imgProfile}" id="image_profile">
				<div class="userList-info">
					<a class="userId">${requestScope.bvo.member.userId}</a>
					<div class="activity">
						<span class="fa fa-graduation-cap"></span>${requestScope.bvo.member.activity}
					</div>
					<div class="date">
						<span class="timeago"><fmt:formatDate value="${bvo.regDate}" pattern="yyyy.MM.dd HH:mm:ss" /></span>
					</div>
				</div>
			</div>
			<div class="comment-hit">
				<span class="article-comment"><img src="${path}/resources/img/reply.png" id="image_reply">&nbsp; ${requestScope.bvo.cntReply}</span>
				<span class="article-hit"><img src="${path}/resources/img/eyes.png" id="image_eyes">&nbsp; ${requestScope.bvo.cntView}</span>
			</div>
		</div>
		<div class="board-content">
			<div class="content-body">
				<div class="content-tag">
				  <c:forEach var="tag" items="${tagList}"><span class="tag">${tag.TAG}</span></c:forEach>
				</div>
				<h2 class="content-title">${requestScope.bvo.title}</h2>
				<hr>
				<div class="content-text">
					<pre class="code-text">
						<textarea id="content" name="content" readonly >${requestScope.bvo.content}</textarea>
            <script>
              CKEDITOR.replace( 'content', {
                extraPlugins: 'autogrow,youtube',
                autoGrow_minHeight: 400,
                autoGrow_maxHeight: 10000,
                autoGrow_bottomSpace: 50,
                resize_enabled : false,
                removePlugins : 'elementspath',
              });
            </script>
					</pre>
				</div>
			</div>
			<div class="content-function">
				<div class="function-like">
					<img src="${path}/resources/img/empty_heart.png" id="boardGood${bvo.boardNo}" onclick="boardLikeChange('${bvo.boardNo}')" class="image_empty-heart">
					<span id="cntBoardLike" class="cntBoardLike" >${bvo.cntBoardLike}</span>
				</div>
        <sec:authorize access="isAuthenticated()">
						<sec:authentication var="mvo" property="principal" />
							<c:if test="${mvo.userId == requestScope.bvo.member.userId }">
    						<div class="function-edit"><img src="${path}/resources/img/edit.png" id="image_edit" onclick="updateBoard()"></div>
							</c:if>
        </sec:authorize>
				<div class="function-facebook">
					<a onclick="shareSns()" alt="Share on Facebook"><img src="${path}/resources/img/facebook.png" class="image_facebook"></a>
				</div>
			</div>
		</div>
	</div>
	<!-- 댓글목록 출력 -->
	<div id=listReply></div>
  <div class="reply-textWrite">
    <sec:authorize access="isAuthenticated()">
      <textarea class="reply-textarea" id="replytext" placeholder="댓글을 작성하세요" ></textarea>
      <div class="write_button"><img src="${path}/resources/img/write.png" class="image_write"  id="btnReply" style="cursor:pointer"></div>
    </sec:authorize>
  </div>


<%@ include file="../../include/footer.jsp"%>
