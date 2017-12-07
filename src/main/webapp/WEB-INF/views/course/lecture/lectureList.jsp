<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../include/common.jsp"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.js"></script>




<style>
#profile {
	width: 50px;
	height: 50px;
	border-radius: 50%
}

a {
	text-decoration: none;
	cursor: pointer;
}

#tag {
	font-size: 10px;
	border: 1px solid grey;
	border-radius: 10%;
	background-color: grey;
	color: white;
	margin-left: 10px;
}
</style>



</head>
<body>






	<table border="1" width=100% height=100%>

		<tr height=20%>
			<td width=20%>1</td>
			<td width=80%>2</td>
		</tr>
		<tr height=80%>
			<td width=20%>
				<table>
					<c:forEach var="row" items="${list}" varStatus="status">
						<tr>
							<td>${status.index+1}.${row}</td>
						<tr>
					</c:forEach>
				</table></td>
			<td width=80%>4</td>
			
		</tr>
	</table>
	<%-- <c:forEach var="row" items="${list}" varStatus="status">
	<tr height=5%>
	
	<td width=30%>${status.index+1}. ${row}</td> 
	
	
		
		

	</tr>
	</c:forEach>
	<tr> <td width=30%></td></tr>
 --%>	
	




		<a href="${pageContext.request.contextPath}">홈으로</a>
</body>
</html>





















