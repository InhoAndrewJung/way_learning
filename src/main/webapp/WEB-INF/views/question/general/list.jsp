<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp"%>
<%@ include file="../../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/board/board.css?ver=2">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script>
	
	function sorting(sort) {
		
		if (sort == 'multiple') {
			alert("multiple")
			$('input[name=sorting]').val('multiple');

		} else if (sort == 'short') {
			alert("short")
			$('input[name=sorting]').val('short');

		}
		$('#form1').submit();

	}
	
	function makeQuestion(){
		location.href="${pageContext.request.contextPath}/question/general/makeQuestion";
		
	}
</script>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="container">
	
	<div class="menu">
		<div class="titleName">
			
				<img src="${path}/resources/img/java.svg" id="image_title"> Question
			
		</div>
		
		<span class="search_section" style="width:80%">
			<form name="form1" method="post" action="${pageContext.request.contextPath}/question/general/getList" id="form1">
				
		
				<span class="search_button">
				<a href="#" onclick="sorting('multiple')">객관식 </a> 
				<a href="#" onclick="sorting('short')">주관식 </a> 
				
				<input type="hidden"  name="sorting"  value=""> 
				</span>
				
				<input name="keyword" id="search_bar"  style="margin-right:6px;" value=${keyword}> 
				<input type="submit" id="search_button"  style="padding:8px;" value="조회">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				
				
				
			</form> 
			</span>
		
	</div>
<br/>

<!-- 비로그인 사용자는 일반문제 생성을 보여주지 않는다. -->
		<sec:authorize access="isAuthenticated()">
		<div style="text-align:center;">
			 <input type="button" id="search_button"  style="padding:6px;border-radius: 5%;"value="일반 문제 생성" onclick="makeQuestion()">
		</sec:authorize>

		
		
		<table class="boardTable" style="text-align: center">
			<tr class="table-center" style="height:40px">
				<td nowrap>문제번호</td>
				<td nowrap>제목</td>
				<td>제출</td>
				<td>정답</td>
				<td nowrap>정답비율</td>
			</tr>
			<c:forEach var="row" items="${list}">
				<tr class="table-center" style="height:60px">

					<td>${row.questionNo}</td>

					<c:if test="${row.category =='multipleChoice'}">
						<td nowrap><a
							href="${path}/question/general/multipleChoiceContent?questionNo=${row.questionNo}&keyword=${keyword}">${row.title }</a></td>
					</c:if>
					<c:if test="${row.category =='shortAnswer'}">
						<td nowrap><a
							href="${path}/question/general/shortAnswerContent?questionNo=${row.questionNo}&keyword=${keyword}">${row.title }</a></td>
					</c:if>
					<td>${row.cntSubmit }</td>
					<td>${row.cntRight }</td>



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

		
		<!-- 메인으로 이동 -->
				<a href="${path}/">
					<img src="${pageContext.request.contextPath}/resources/img/house.png" id="image_list">
				</a>	
		</div>
	

	
</body>
</html>
