<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp"%>
<%@ include file="../../include/header.jsp"%>

<link rel="stylesheet" href="${path}/resources/css/board/board.css?ver=2">




<body>
<div class="common-container">
	<div class="move-boardList">
		<div class="general-titleName">Question ${questionNo-999}</div>
		<a href="${pageContext.request.contextPath}/question/essay/getList?keyword=${keyword}">
			<img src="${pageContext.request.contextPath}/resources/img/general-list.png" class="general-toList">
		</a>
	</div>
	<table class="util-width-100">
			<tr>
				<td style="padding:30px">
					
						<c:if test="${code.answerResult eq 'correct'}">
						<div class="general-answer">
							<span class="general-image"></span><br><br>
							<span class="general-msg">GOOD JOB, BRO :-)<br>
								정답입니다!
							</span>							
						</div>	
						</c:if>
						
						<c:if test="${code.answerResult eq 'wrong' and code.error != 'Exception'}">
						<div class="general-wrongAnswer">
							<span class="general-image"></span><br><br>
							<span class="general-msg">Try Again!</span><br><br>
							<a href="${path}/question/essay/showEssayContent?questionNo=${questionNo}">		
								<img src="/learning/resources/img/back-arrow.png" class="general-imgBack">
							</a>
						</div>
						</c:if>
						
						<c:if test="${code.error eq 'Exception'}">
						<div class="general-wrongAnswer">
							<span class="general-image"></span><br><br>
							<span class="general-msg">Runtime Error...!!<br>Try Again! </span><br><br>
							<a href="${path}/question/essay/showEssayContent?questionNo=${questionNo}">		
								<img src="/learning/resources/img/back-arrow.png" class="general-imgBack">
							</a>
						</div>
						</c:if>
				</td>
			</tr>
	</table>
	</div>
</body>

<%@ include file="../../include/footer.jsp"%>
