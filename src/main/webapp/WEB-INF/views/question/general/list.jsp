<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function sorting(sort){
	if(sort == 'multiple'){
		$('input[name=sorting]').val('multiple');
		
	}else if(sort == 'short'){
		$('input[name=sorting]').val('short');
		
	}
	 $('#form1').submit();  
	 
}

</script>
</head>
<body>
<br><br><br><br><br><br>

	<div align="center">


<a href="#"  onclick="sorting('multiple')">객관식  </a>  &nbsp; 
<a href="#"  onclick="sorting('short')">주관식 </a>  &nbsp;  <br>
<form name="form1" method="post" action="${pageContext.request.contextPath}/question/general/getList" id="form1">
		<input name="keyword" value=${keyword}> 
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="hidden" name="sorting" value="">
		<input type="submit" value="조회">
		
</form> 
		<table border=1px>
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
					<td nowrap><a href="${path}/question/general/multipleChoiceContent?questionNo=${row.questionNo}&keyword=${keyword}">${row.title }</a></td>
					</c:if>
					<c:if test="${row.category =='shortAnswer'}">
					<td nowrap><a href="${path}/question/general/shortAnswerContent?questionNo=${row.questionNo}&keyword=${keyword}">${row.title }</a></td>
					</c:if>
					<td>${row.cntSubmit }</td>
					<td>${row.cntRight }</td>
				
					
					
					<td nowrap> <fmt:formatNumber value="${(row.cntRight / row.cntSubmit)*100 }" type="percent"  pattern=".00"/>%   </td>

				</tr>
			</c:forEach>
		</table>
		<a href="${pageContext.request.contextPath}/question/general/makeQuestion">일반문제 생성</a>
		<a href="${path}/"> 메인페이지로 이동</a>
	</div>

</body>
</html>
