<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp"%>
<%@ include file="../../include/header.jsp"%>

<link rel="stylesheet" href="${path}/resources/css/board/board.css?ver=2">

	<div class="common-container">
		<div class="move-boardList">
			<div class="titleName" style="text-align:left;">Question ${questionNo}</div>
			<a href="${pageContext.request.contextPath}/question/general/getList?keyword=${keyword}">
				<img src="${pageContext.request.contextPath}/resources/img/list.png" id="image_list">
			</a>
		</div>
		<div class="common-card util-width-100" style="margin-bottom:40px;">
			<c:if test="${code.answerResult eq 'correct'}">
				<div class="alert alert-success" role="alert">
					<strong>맞췄습니다! :)</strong>
				</div>
			</c:if>

			<c:if
				test="${code.answerResult eq 'wrong' and code.error != 'Exception'}">
				<div class="alert alert-danger" role="alert">
					<strong>틀렸습니다! 다시 도전해 보세요.</strong>
				</div>
			</c:if>

			<c:if test="${code.error eq 'Exception'}">
				<div class="alert alert-warning" role="alert">
					<strong>런타임 에러입니다! 다시 도전해 보세요.</strong>
				</div>
			</c:if>
		</div>
	</div>

	<div align="center">
		<a href="${path}/question/essay/showEssayContent?questionNo=${questionNo}">
			<button type="button" class="btn btn-primary">서술형 문제 다시풀기</button>
		</a>
	</div>

<%@ include file="../../include/footer.jsp"%>
