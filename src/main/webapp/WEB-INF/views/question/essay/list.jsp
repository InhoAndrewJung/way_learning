<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp"%>
<%@ include file="../../include/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/board/board.css?ver=2">
<script>
	function makeQuestion(){
		location.href="${pageContext.request.contextPath}/question/essay/makeQuestion";
	}
</script>
<div class="common-container">
	<div class="menu">
		<div class="titleName" style="margin-bottom:40px;">
				<img src="${path}/resources/img/algorithm.svg" id="image_title"> Algorithm
		</div>
		<form name="form1" method="post" action="${pageContext.request.contextPath}/question/essay/getList" id="form1">
			<span class="search_section" style="margin-bottom: 1em;">
				<input name="keyword" id="search_bar" value=${keyword}>
				<input type="submit" id="search_button" value="조회">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
			</span>
	</div>
	<table class="boardTable common-card util-width-100" style="text-align:center;">
		<tr>
			<td nowrap>문제번호</td>
			<td nowrap>제목</td>
			<td>제출</td>
			<td>정답</td>
			<td nowrap>정답비율</td>
		</tr>
		<c:forEach var="row" items="${list}">
			<tr>
				<td>${row.questionNo}</td>
				<td style="text-align:left;" nowrap>
					<a href="${path}/question/algorithm/essayContent?questionNo=${row.questionNo}&keyword=${keyword}">${row.title }</a>
				</td>
				<td>${row.cntSubmit }</td>
				<td>${row.cntRight }</td>
				<td nowrap align="center">
					<c:choose>
						<c:when test="${row.cntSubmit ==0 ||  row.cntRight ==0   }">0%</c:when>
						<c:otherwise>
							<fmt:formatNumber value="${(row.cntRight / row.cntSubmit)*100 }" type="percent" pattern=".00" />%
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 비로그인 사용자는 일반문제 생성을 보여주지 않는다. -->
	<sec:authorize access="isAuthenticated()">
	<div style="text-align:center;margin-top:40px;">
		<input type="button" id="search_button"  style="padding:6px;border-radius: 5%;"value="알고리즘 문제 생성" onclick="makeQuestion()">
	</div>
	</sec:authorize>
</div>

<%@ include file="../../include/footer.jsp"%>
