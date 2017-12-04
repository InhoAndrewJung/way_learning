<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@ include file="../include/common.jsp"%>

<style>
#profile {
	width: 50px;
	height: 50px;
	border-radius: 50%
}

td:nth-child(odd) {
	border-bottom: none;
}
</style>
<html>
<body>
	<div align="center">
		최근 4일동안의 게시물 좋아요 목록 ...<br>
		<table border=1px>



			<c:forEach var="bl" items="${boardList}">
				<tr>
					<td nowrap>#${bl.BOARD_NO}번 게시물을 추천하였습니다. ${bl.REG_DATE}</td>
				</tr>
				<tr>
					<td><c:if test="${bl.TABLE_NAME =='qna' }">
							<a href="${path}/board/qna/showContent?boardNo=${bl.BOARD_NO}">${bl.TITLE}</a>
						</c:if> <c:if test="${bl.TABLE_NAME =='tech' }">
							<a href="${path}/board/tech/showContent?boardNo=${bl.BOARD_NO}">${bl.TITLE}</a>
						</c:if>  <span style="float: right"><img id="profile"
							src="${path}/resources/upload/${bl. IMG_PROFILE}" alt="이미지" />
							${bl.WRITER } ${bl.ACTIVITY}</span></td>
				</tr>


			</c:forEach>



		</table>

		<br>
		<br> 최근 4일동안의 답변 좋아요 목록 <br>
		<table border=1px>




			<c:forEach var="rl" items="${replyList}">
				<tr>
					<td>#${rl.BOARD_NO}번 질문에 대해 ${rl.REPLYER}님의 답변을 추천하였습니다.
						${rl.REG_DATE}</td>
				</tr>
				<tr>
					<td><c:if test="${rl.TABLE_NAME =='qna' }">
							<a href="${path}/board/qna/showContent?boardNo=${rl.BOARD_NO}&replyNo=${rl.REPLY_NO}">${rl.TITLE}</a>
						</c:if> <c:if test="${rl.TABLE_NAME =='tech' }">
							<a href="${path}/board/tech/showContent?boardNo=${rl.BOARD_NO}&replyNo=${rl.REPLY_NO}">${rl.TITLE}</a>
						</c:if>  <span style="float: right"><img id="profile"
							src="${path}/resources/upload/${rl.IMG_PROFILE}" alt="이미지" />
							${rl.WRITER} ${rl.ACTIVITY}</span></td>
				</tr>



			</c:forEach>


		</table>


		<a href="${path}/"> 메인페이지로 이동</a>
	</div>
</body>
</html>