<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp"%>
<%@ include file="../../include/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/board/board.css?ver=2">
<script>
	function sorting(sort) {
		$('input[name=sorting]').val(sort);
		$('#form1').submit();
	}
	function makeQuestion(){
		location.href="${pageContext.request.contextPath}/question/general/makeQuestion";
	}
</script>
<div class="common-container">
	<div class="menu">
		<div class="titleName" style="margin-bottom:40px;">
				<img src="${path}/resources/img/java.svg" id="image_title"> Question
				
			<!-- 비로그인 사용자는 일반문제 생성을 보여주지 않는다. -->
			<sec:authorize access="isAuthenticated()">
			<span style="text-align:center;margin-top:40px;">
				<input type="button" id="search_button"  style="padding: 8px; border-radius: 12px; margin: 18px;" value="문제생성" onclick="makeQuestion()">
			</span>
			</sec:authorize>
		</div>
		<form name="form1" method="post" action="${pageContext.request.contextPath}/question/general/getList" id="form1">
			<span class="search_button">
				<a href="#" onclick="sorting('multiple')">객관식 </a>
				<a href="#" onclick="sorting('short')">주관식 </a>
				<input type="hidden"  name="sorting"  value="">
			</span>
			<span class="search_section">
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
				<c:if test="${row.category =='multipleChoice'}">
					<td style="text-align:left;" nowrap>
						<a href="${path}/question/general/multipleChoiceContent?questionNo=${row.questionNo}&keyword=${keyword}">${row.title }</a>
					</td>
				</c:if>
				<c:if test="${row.category =='shortAnswer'}">
					<td style="text-align:left;" nowrap>
						<a href="${path}/question/general/shortAnswerContent?questionNo=${row.questionNo}&keyword=${keyword}">${row.title }</a>
					</td>
				</c:if>
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
</div>

<%@ include file="../../include/footer.jsp"%>
