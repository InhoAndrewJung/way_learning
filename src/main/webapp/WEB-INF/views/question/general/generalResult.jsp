<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp"%>
<%@ include file="../../include/header.jsp"%>

<link rel="stylesheet" href="${path}/resources/css/board/board.css?ver=2">

<div class="common-container">
	<div class="move-boardList">
		<div class="general-titleName">Question ${questionNo}</div>
		<a href="${pageContext.request.contextPath}/question/general/getList?keyword=${keyword}">
			<img src="${pageContext.request.contextPath}/resources/img/general-list.png" class="general-toList">
		</a>
	</div>
	<table class="util-width-100">
			<tr>
				<td style="padding:30px">
					<c:choose>
						<c:when test="${result =='1'}">
						<div class="general-answer">
							<span class="general-image"></span><br><br>
							<span class="general-msg">GOOD JOB, BRO!<br>
								정답입니다!
							</span>							
						</div>	
						</c:when>
						<c:otherwise>
						<div class="general-wrongAnswer">
							<span class="general-image"></span><br><br>
							<span class="general-msg">Try Again!</span><br><br>
							<c:if test="${multipleChoice != null}">
								<a href="${path}/question/general/multipleChoiceContent?questionNo=${questionNo}">		
										<img src="/learning/resources/img/back-arrow.png" class="general-imgBack">
								</a>
							</c:if>
							<c:if test="${shortAnswer !=null}">
								<a href="${path}/question/general/shortAnswerContent?questionNo=${questionNo}">
									<img src="/learning/resources/img/back-arrow.png" class="general-imgBack">
								</a>
							</c:if>
						</div>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
	</table>


		


		<%-- <a href="${pageContext.request.contextPath}/question/general/getList">
			<img src="${pageContext.request.contextPath}/resources/img/list.png"
			id="image_list">
		</a>
		<!-- 메인으로 이동 -->
		<a href="${path}/"> <img
			src="${pageContext.request.contextPath}/resources/img/house.png"
			id="image_list">
		</a> --%>




	</div>

<%@ include file="../../include/footer.jsp"%>
