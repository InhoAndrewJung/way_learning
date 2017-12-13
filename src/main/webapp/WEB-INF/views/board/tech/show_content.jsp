<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp"%>
<%@ include file="../../include/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/show_content.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<script>
$(document).ready(function() {

	listReply(); //댓글 목록






	$.ajax({
		type: "post",
		url: "${pageContext.request.contextPath}/board/tech/likeStatus",
		data:"${_csrf.parameterName}=${_csrf.token}",
		success: function(result){
			$(result).each(function(index,item) {
				 $('#boardGood'+item).attr('src' ,'/learning/resources/img/reply_heart.png') ;
				 document.getElementById('cntBoardLike').style.color="white"
			});
		}
	});


	$('#btnReply').click(function(){
		reply();
	});





	function reply(){
		var replytext=$("#replytext").val();
		var boardNo="${requestScope.bvo.boardNo}"; // view 컨트롤러에서 가져옴!
		//비밀댓글 체크 여부



	//var param과, data:param 삭제하고 url에  "${path}/reply/insert.do?replytext="+replytext+"&bno="+bno+"&secret_reply="+secret_reply,  이렇게 써도됨!!

		var param="${_csrf.parameterName}=${_csrf.token}&replytext="+replytext+"&boardNo="+boardNo;

		$.ajax({
			type: "post",
			url: "${pageContext.request.contextPath}/reply/tech/insert",
			data: param,
			success: function(){

				//alert("댓글이 등록되었습니다.");

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
	if(confirm("해당 글을 삭제하시겠습니까?")){
		location.href="${pageContext.request.contextPath}/board/tech/delete?boardNo=${requestScope.bvo.boardNo}";
	}

}

function updateBoard(){
	if(confirm("해당 글을 수정하시겠습니까?")){
		location.href="${pageContext.request.contextPath}/board/tech/updateView?boardNo=${requestScope.bvo.boardNo}";
	}
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
				 document.getElementById('cntBoardLike').style.color="#ff2635"
			 }else if(src =='/learning/resources/img/empty_heart.png'){
				 $('#boardGood'+boardNo).attr('src' ,'/learning/resources/img/reply_heart.png') ;
				 document.getElementById('cntBoardLike').style.color="white"
			 }


		}
	});
}







</script>


<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>




<style>
    .cke_top
    {
        display: none !important;
    }
.cke_bottom {display: !important;}
#profile{width:50px; height:50px; border-radius: 50% }
a{text-decoration:none; cursor: pointer;}
#tag{font-size:10px;border:1px solid grey;border-radius:10%; background-color:grey; color:white; margin-left:10px;}
</style>



<c:if test="${replyNo !=null}">

<script>
setTimeout(function(){
	 var heightItem=$('#replyGood'+${replyNo}+'').offset().top;
	$('body,html').animate({scrollTop:heightItem-100});

},700) ;
</script>

</c:if>

<div class="move-boardList">
		<a href="${pageContext.request.contextPath}/board/tech/list?keyword=${keyword}">
		<img src="${path}/resources/img/list.png" id="image_list">
		</a>
	</div>

	<div class="container-board">

		<div class="board-head">

			<div class="userList">
				<img src="${path}/resources/upload/${bvo.member.imgProfile}" id="image_profile">

				<div class="userList-info">
					<a class="userId">${requestScope.bvo.member.userId}</a>

					<div class="activity">

						<span class="fa fa-graduation-cap"></span>
							${requestScope.bvo.member.activity}
					</div>

						<div class="date">
							<span class="timeago">
								<fmt:formatDate value="${bvo.regDate}" pattern="yyyy.MM.dd HH:mm:ss" />
							</span>

						</div>

				</div>

			</div>

			<div class="comment-hit">
				<span class="comment">
					<img src="${path}/resources/img/reply.png" id="image_reply"> &nbsp; ${requestScope.bvo.cntReply}
				</span>
				<span class="hit">
					<img src="${path}/resources/img/eyes.png" id="image_eyes"> &nbsp; ${requestScope.bvo.cntView}
				</span>
			</div>

		</div>

		<div class="board-content">
				<div class="content-body">


					<div class="content-tag">
					  <c:forEach var="tag" items="${tagList}">
						  <span class="tag">${tag.TAG}</span>
					  </c:forEach>
					</div>


					<h2 class="content-title">
						${requestScope.bvo.title}

					</h2>

					<hr>

					<div class="content-text">


						<pre class="code-text">
						<textarea id="content" name="content" rows="3" cols="80" placeholder="내용을 입력하세요" readonly >${requestScope.bvo.content}</textarea>
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

		      		} );

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
						<div class="function-edit">

									<img src="${path}/resources/img/edit.png" id="image_edit" onclick="updateBoard()">
						</div>
								</c:if>
						</sec:authorize>
						<div class="function-facebook">

						<a onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent('http://127.0.0.1:7777/learning/board/tech/showContent?boardNo=${requestScope.bvo.boardNo}&&keyword=')+'&t='+encodeURIComponent('Q&A 게시판'), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank" alt="Share on Facebook" >
						<img src="${path}/resources/img/facebook.png" class="image_facebook">					</a>

						</div>

				</div>
		</div>



	</div>


	<!-- 댓글목록 출력 -->
	<div id=listReply></div>


			<div class="reply-textWrite">
				<sec:authorize access="isAuthenticated()">
				<textarea class="reply_writeText" rows="4" cols="80" id="replytext" placeholder="댓글을 작성하세요" ></textarea>
			<div class="write_button">
				<img src="${path}/resources/img/write.png" class="image_write"  id="btnReply" style="cursor:pointer">
			</div>
			</sec:authorize>
		</div>




<%--
<h2 align="center"><b>게시글</b></h2>
${delete_result}
	<div align="center">



					<table border="1" width="1000" align="center">


						<tr>
							<td><img id="profile" src="${path}/resources/upload/${bvo.member.imgProfile}">
							${requestScope.bvo.member.userId}  ${requestScope.bvo.member.activity}<br> <span
								style="font-size: 10px"><fmt:formatDate value="${bvo.regDate}" pattern="yyyy.MM.dd HH:mm:ss" /></td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td nowrap>뷰수:${requestScope.bvo.cntView} 답글수:${requestScope.bvo.cntReply} </td>
						</tr>

						<tr>

							<td colspan="4">
							번호:${requestScope.bvo.boardNo}
							<c:forEach var="tag" items="${tagList}">
									<span id="tag" >${tag.TAG}</span>

							</c:forEach>

							<br>
							제목:${requestScope.bvo.title}
							</td>
							<td>
							<img id="boardGood${bvo.boardNo}" src="${path}/resources/img/arrowUp.png" style="width:20px; height:20px;cursor:pointer; " onclick="boardLikeChange('${bvo.boardNo}')" ><br><br>
							<span id="cntBoardLike" >${bvo.cntBoardLike}</span><br><br>

							</td>

						</tr>

						<tr>

							<td colspan="4">
							<textarea id="content" name="content" rows="3" cols="80" placeholder="내용을 입력하세요" readonly >${requestScope.bvo.content}</textarea>
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

		      		} );

		      	</script>


							</td>
							<td align="center">
							<a href="#" onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent('http://127.0.0.1:7777/learning/board/tech/showContent?boardNo=${requestScope.bvo.boardNo}&&keyword=')+'&t='+encodeURIComponent('Q&A 게시판'), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank" alt="Share on Facebook" ><img
					src="${path}/resources/img/facebook.png"
					style="width: 20px; height: 20px; cursor: pointer;"></a>
							</td>

						</tr>

					</table>

							<a
								href="${pageContext.request.contextPath}/board/tech/list?keyword=${keyword}"><img
									alt="목록"
									src="${pageContext.request.contextPath}/resources/img/list_btn.jpg"></a>
								<!-- 현재 로그인한 사람이 자신의 글 상세보기 할때는 삭제와 수정버튼이 보여지도록 작성하면됨! --> <sec:authorize
									access="isAuthenticated()">
									<sec:authentication var="mvo" property="principal" />


									<c:if test="${mvo.userId == requestScope.bvo.member.userId }">
										<img alt="삭제"
											src="${pageContext.request.contextPath}/resources/img/delete_btn.jpg"
											onclick="deleteBoard()">
										<img alt="수정"
											src="${pageContext.request.contextPath}/resources/img/modify_btn.jpg"
											onclick="updateBoard()">
									</c:if>
								</sec:authorize>




	<!-- 댓글목록 출력 -->
	<div id=listReply></div>


	<div style="text-align: center;  ">
		<br>
		<sec:authorize access="isAuthenticated()">
			<textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성하세요"></textarea>
			<br>

			<button type="button" id="btnReply">댓글쓰기</button>
		</sec:authorize>
	</div>

	</div> --%>
</body>
</html>
