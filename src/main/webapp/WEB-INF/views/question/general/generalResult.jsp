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
	<table class="common-card util-width-100" style="margin-bottom:40px;">
			<tr>
				<td style="padding:30px">
					<c:choose>
						<c:when test="${result}">
							<strong>정답</strong>
						</c:when>
						<c:otherwise>
							<strong>오답</strong>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
	</table>


		<c:if test="${multipleChoice != null}">
			<a href="${path}/question/general/multipleChoiceContent?questionNo=${questionNo}">
				<button type="button" class="btn btn-primary">문제 다시풀기</button> </a>
		</c:if>
		<c:if test="${shortAnswer !=null}">
			<a href="${path}/question/general/shortAnswerContent?questionNo=${questionNo}">
				<button type="button" class="btn btn-primary">문제 다시풀기</button></a>
		</c:if>


		<a href="${pageContext.request.contextPath}/question/general/getList">
			<img src="${pageContext.request.contextPath}/resources/img/list.png"
			id="image_list">
		</a>
		<!-- 메인으로 이동 -->
		<a href="${path}/"> <img
			src="${pageContext.request.contextPath}/resources/img/house.png"
			id="image_list">
		</a>




	</div>

<%@ include file="../../include/footer.jsp"%>
