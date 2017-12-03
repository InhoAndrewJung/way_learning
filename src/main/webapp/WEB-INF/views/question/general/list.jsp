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
					
					<c:if test="${row.category =='multipleChoice'}">
					<td><a href="${path}/question/general/multipleChoiceContent?questionNo=${row.questionNo}">${row.question }</a></td>
					</c:if>
					<c:if test="${row.category =='shortAnswer'}">
					<td><a href="${path}/question/general/shortAnswerContent?questionNo=${row.questionNo}">${row.question }</a></td>
					</c:if>
					<td>${row.cntSubmit }</td>
					<td>${row.cntRight }</td>
				
					
					
					<td nowrap> <fmt:formatNumber value="${(row.cntRight / row.cntSubmit)*100 }" type="percent"  pattern=".00"/>%   </td>

				</tr>
			</c:forEach>
		</table>
		<a href="${pageContext.request.contextPath}/question/general/makeQuestion">일반문제 생성</a>
	</div>

</body>
</html>
