<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<br><br><br><br><br><br>

	<div align="center">



<form name="form1" method="post" action="${pageContext.request.contextPath}/question/essay/getEssayList" id="form1">
		<input name="keyword" value=${keyword}> 
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		
		<input type="submit" value="조회">
		
</form> 
		<table border=1px>
			<tr>
				<td>문제번호</td>
				<td nowrap>문제</td>
				<td>제출</td>
				<td>정답</td>
				<td>정답비율</td>
			</tr>
			<c:forEach var="row" items="${list}">
				<tr>

					<td>${row.questionNo}</td>
					
					
					<td><a href="${path}/question/essay/showEssayContent?questionNo=${row.questionNo}&keyword=${keyword}">${row.question}</a></td>
					
					
					<td>${row.cntSubmit }</td>
					<td>${row.cntRight }</td>
				
					
					
					<td nowrap> <fmt:formatNumber value="${(row.cntRight / row.cntSubmit)*100 }" type="percent"  pattern=".00"/>%   </td>

				</tr>
			</c:forEach>
		</table>
		<!-- 비로그인 사용자는 일반문제 생성을 보여주지 않는다. -->
		<sec:authorize access="isAuthenticated()">
		<a href="${pageContext.request.contextPath}/question/essay/makeQuestion">에세이문제 생성</a>
		</sec:authorize>
		<a href="${path}/"> 메인페이지로 이동</a>
	</div>

</body>
</html>
