<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/board/board.css?ver=2">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<form action="${path}/question/essay/insertQuestion" method="post">





		<table class="boardTable" style="text-align: center">
			<tr class="table-center" style="height: 40">
				<td><label for="title">제목:</label><input type="text"
					name="title" id="title" size="50"  /><br></td>
			</tr>
			<tr class="table-center" style="height: 40">
				<td><label for="question">문제:</label><input type="text"
					name="question" id="question" size="50" />
				<td>
			</tr>
			<tr>
				<td><label for="input">인풋:</label><input type="text"
					name="input" id="input" size="50"  /><br></td>
			</tr>
			<tr>
				<td><label for="output"><span style="font-size:15px">아웃풋:</span></label><input type="text"
					name="output" id="output"  size="50" /><br></td>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}">
			</tr>






			
		</table>
		<input type="submit" value="제출" />
	</form>
</div>
	<div align="center">
		<!-- 메인으로 이동 -->
		<a href="${path}/"> <img
			src="${pageContext.request.contextPath}/resources/img/house.png"
			id="image_list">
		</a>
	</div>
</body>
</html>
