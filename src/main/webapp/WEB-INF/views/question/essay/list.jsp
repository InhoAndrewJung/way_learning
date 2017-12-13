<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp"%>
<%@ include file="../../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/board.css?ver=2">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.js"></script>
<title>Insert title here</title>
<script>
function makeQuestion(){
	location.href="${pageContext.request.contextPath}/question/essay/makeQuestion";
	
}

</script>
</head>
<body>
<br><br><br><br><br><br>

<div class="container">
	
	<div class="menu">
		<div class="titleName">
			
				<img src="${path}/resources/img/algorithm.svg" id="image_title"> Algorithm
			
		</div>
		<span class="search_section">
			<form name="form1" method="post" action="${pageContext.request.contextPath}/question/essay/getEssayList" id="form1">
				<input name="keyword" id="search_bar" value=${keyword}> 
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				
				<input type="submit" id="search_button" value="조회">
				
			</form> 
		</span>
	</div>
	
		<table class="boardTable" style="text-align: center">
			<tr class="table-center" style="height:40">
				<td>문제번호</td>
				<td nowrap>제목</td>
				<td>제출</td>
				<td>정답</td>
				<td>정답비율</td>
			</tr>
			<c:forEach var="row" items="${list}">
				<tr class="table-center" style="height:60">

					<td class="table-center_content" >${row.questionNo}</td>
					
					
					<td class="table-center_content"><a href="${path}/question/essay/showEssayContent?questionNo=${row.questionNo}&keyword=${keyword}">${row.title}</a></td>
					
					
					<td class="table-center_content">${row.cntSubmit }</td>
					<td class="table-center_content">${row.cntRight }</td>
				
					
					
					<td nowrap align="center">

               <c:choose>
                     <c:when test="${row.cntSubmit ==0 ||  row.cntRight ==0   }">
               
                     0%
               </c:when>
                     <c:otherwise>
                        <fmt:formatNumber value="${(row.cntRight / row.cntSubmit)*100 }"
                           type="percent" pattern=".00" />%

               </c:otherwise>
               </c:choose>
               </td>


				</tr>
			</c:forEach>
		</table>
		<!-- 비로그인 사용자는 일반문제 생성을 보여주지 않는다. -->
		<div align="center">
		
		<sec:authorize access="isAuthenticated()">
		
		 <input type="button" id="search_button"  style="padding:6px;border-radius: 5%;"value="에세이 문제 생성" onclick="makeQuestion()">
		
		</sec:authorize>
		
		<!-- 메인으로 이동 -->
				<a href="${path}/">
					<img src="${pageContext.request.contextPath}/resources/img/house.png" id="image_list">
				</a>	
				
		
	</div>
</div>
</body>
</html>
