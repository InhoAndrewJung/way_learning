<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">





<script src="${path}/ckeditor/ckeditor.js"></script>


</head>
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
					
				//	alert("댓글이 등록되었습니다.");
					
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
			
		
			var param="${_csrf.parameterName}=${_csrf.token}&lectureNo="+lectureNo+"&courseNo="+courseNo;
			
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


<style>

   .cke_top
    {
        display: none !important;
    }

.cke_bottom {display: !important;}

#profile {
	width: 50px;
	height: 50px;
	border-radius: 50%
}


</style>




<body>
<div align="center">
${lvo.lectureName} <fmt:formatDate value="${lvo.regDate}" pattern="YYYY.MM.dd" />  

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
		      			      			
		      		} );  

		      	</script>
<div align="center" > <input type="button" value="다 봤어요" id="finishLecture" /><!-- <span id="watchLectureCnt" > </span> --> </div>		      	
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
</div>	
</body>
</html>






























