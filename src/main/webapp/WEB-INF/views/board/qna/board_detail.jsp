<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/board_detail.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>

	<div class="container-board">

		<div class="board-head">
			
			<div class="userList">
				<img src="./image/man.png" id="image_profile">
						
				<div class="userList-info">
					<a class="userId">Fire</a>
								
					<div class="activity">
								
						<span class="fa fa-graduation-cap"></span>
							25
					</div>
								
						<div class="date">
							<span class="timeago" title="2017-11-29 16:00:57.0">1시간 전</span> 
								
						</div>
							
				</div>
				
			</div>
			
			<div class="comment-hit">
				<span class="comment"> 
					<img src="./image/reply.png" id="image_reply"> &nbsp; 10
				</span> 
				<span class="hit"> 
					<img src="./image/eyes.png" id="image_eyes"> &nbsp;8
				</span>
			</div>
			
		</div>
		
		<div class="board-content">
				<div class="content-body">
					<div class="content-tag">
						<span class="tag">JAVA</span>
					
					</div>
					
					<h2 class="content-title">
						video 태그 autoplay 를 반응형으로 적용 
					
					</h2>
					
					<hr>
					
					<div class="content-text">
						<p>
							영상 재생을 하는데 반응형으로 autoplay 옵션이 적용되게 하고 싶습니다.
						 <br>소스에서 클래스명 pcVer,moVer으로 분류 하는데.. 
						 <br>css 혹은 제이쿼리로 분류가 가능할까요..?
						</p>
					
						<pre class="code-text">
							div class="mainVisual"
								video  controls class='pcVer'
								source src='/img/20171129.mp4' type="video/mp4"
								/video
						</pre>
					</div>
					
					
				</div>
			
				<div class="content-function">
					
					<div class="function-like">
						<img src="./image/heart.png" id="image_heart"> 

					</div>
					
					<div class="function-edit">
						<img src="./image/edit.png" id="image_edit">
					</div>
					
				</div>
		</div>
		
		

	</div>
	
	
	<div class="move-boardList">
	
		<img src="./image/list.png" id="image_list">
	
	</div>
	
	
	<div class="board-footer">
			<div class="reply-title">
				<span class="footer_comment"> 
					<img src="./image/reply.png" id="footer_image_reply"> 10
				</span> 
			<div class="write_button">
				<a href="#form"><img src="./image/write.png" id="image_write"></a>
			</div>
			</div>
			
			<div class="reply-center">
				<div class="reply-body">

					<div class="reply-head">

						<div class="userList">
							<img src="./image/man.png" id="image_profile">

							<div class="userList-info">
								<a class="userId">Fire</a>

								<div class="activity">

									<span class="fa fa-graduation-cap"></span> 25
								</div>

								<div class="date">
									<span class="timeago" title="2017-11-29 16:00:57.0">1시간 전</span>

								</div>

							</div>

						</div>

					<div class="edit-delete">
						<span class="replyEdit"> 
							<img src="./image/replyEdit.png" id="image_replyEdit">
						</span> 
						
						<span class="delete"> 
							<img src="./image/eraser.png" id="image_eraser">
						</span>
					</div>

				</div>
				
				<!-- 댓글 내용 -->
				<hr>
				<div class="reply-text">
					우레레레레레
				
				</div>
				
			</div>
				
				<div class="reply-function">
					
						<img src="./image/reply_heart.png" id="image_heart"> 

									
				</div>
				
			</div>
		
		</div>
	


</body>
</html>




