<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp" %>
  <h2 class="mypage_title">내 좋아요 목록</h2>
	<div class="container-board">
		<div class="boardTable">
			<div class="title">
				<span class="title-text">
					최근 내가 좋아요한 게시글
				</span>
				<span class="title-no">
					<img src="${path}/resources/img/white_heart.png" class="image-heart"> ${fn:length(boardList)}
				</span>
			</div>
			<c:forEach var="bl" items="${boardList}">
			<div class="table-center">
				<div class="table-title">
					<c:if test="${bl.TABLE_NAME =='qna' }">
						<a href="${path}/board/qna/showContent?boardNo=${bl.BOARD_NO}">${bl.TITLE}</a>
					</c:if>
					<c:if test="${bl.TABLE_NAME =='tech' }">
						<a href="${path}/board/tech/showContent?boardNo=${bl.BOARD_NO}">${bl.TITLE}</a>
					</c:if>
				</div>

				<!-- 글쓴이, 활동점수, 글쓴시각 -->
				<div class="userList">
					<%-- <img src="${path}/resources/upload/${bl.IMG_PROFILE}" id="image_profile"> --%>
					<div class="userList-info">
						<a class="userId">${bl.WRITER }</a>
						<%-- <div class="activity">
							<span class="fa fa-graduation-cap"></span>
							${bl.ACTIVITY}
						</div> --%>
						<div class="date" style="text-align:left;">
							<span class="timeago" ><fmt:formatDate value="${bl.REG_DATE}" pattern="yyyy.MM.dd" /></span>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	<div class="container-reply">
		<div class="boardTable">
			<div class="title">
				<span class="title-text">
				최근 내가 좋아요한 댓글
					</span>
				<span class="title-no">
					<img src="${path}/resources/img/white_heart.png" class="image-heart"> ${fn:length(replyList)}
				</span>
			</div>
			<c:forEach var="rl" items="${replyList}">
			<div class="table-center">
				<div class="table-title">
					<c:if test="${rl.TABLE_NAME =='qna' }">

						<a href="${path}/board/qna/showContent?boardNo=${rl.BOARD_NO}&replyNo=${rl.REPLY_NO}">${rl.TITLE}</a>
					</c:if>
					<c:if test="${rl.TABLE_NAME =='tech' }">
						<a href="${path}/board/tech/showContent?boardNo=${rl.BOARD_NO}&replyNo=${rl.REPLY_NO}">${rl.TITLE}</a>

					</c:if>
				</div>

				<!-- 글쓴이, 활동점수, 글쓴시각 -->
				<div class="userList">
					<%-- <img src="${path}/resources/upload/${rl. IMG_PROFILE}" id="image_profile"> --%>
					<div class="userList-info">
						<a class="userId">${rl.WRITER }</a>
						<%-- <div class="activity">
							<span class="fa fa-graduation-cap"></span>
							${rl.ACTIVITY}
						</div> --%>
						<div class="date" style="text-align:left;">
							<span class="timeago" ><fmt:formatDate value="${rl.REG_DATE}" pattern="yyyy.MM.dd" /></span>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	
	
	<div class="container-reply">
		<div class="boardTable">
			<div class="title">
				<span class="title-text">
				최근 내가 좋아요한 코스
					</span>
				<span class="title-no">
					<img src="${path}/resources/img/white_heart.png" class="image-heart"> ${fn:length(lectureList)}
				</span>
			</div>
			<c:forEach var="ll" items="${lectureList}">
			<div class="table-center">
				<div class="table-title">
					

						<a href="${path}/lectureBoard/showLectureList?courseNo=${ll.COURSE_NO}">${ll.COURSE_NAME}</a>
					
				</div>

				<!-- 글쓴이, 활동점수, 글쓴시각 -->
				<div class="userList">
					<%-- <img src="${path}/resources/upload/${rl. IMG_PROFILE}" id="image_profile"> --%>
					<div class="userList-info">
						<a class="userId">${ll.AUTHOR }</a>
						<%-- <div class="activity">
							<span class="fa fa-graduation-cap"></span>
							${rl.ACTIVITY}
						</div> --%>
						<div class="date" style="text-align:left;">
							<span class="timeago" ><fmt:formatDate value="${ll.REG_DATE}" pattern="yyyy.MM.dd" /></span>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
