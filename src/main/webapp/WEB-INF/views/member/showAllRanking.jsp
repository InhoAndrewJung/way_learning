<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@ include file="../include/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function sorting(sort){
	if(sort == 'cntSubmit'){
		
		location.href="${path}/member/showAllRanking?sorting=cntSubmit";
		
	}else if(sort == 'cntRight'){
		location.href="${path}/member/showAllRanking?sorting=cntRight";
		
	}else if(sort == 'RightPercent'){
		location.href="${path}/member/showAllRanking?sorting=RightPercent";
		
	}
	
	 
}

</script>


</head>
<body>


	<div align="center">
	<a href="#"  onclick="sorting('cntSubmit')">푼문제  </a>  &nbsp; 
	<a href="#"  onclick="sorting('cntRight')">정답수</a>  &nbsp;  
	<a href="#"  onclick="sorting('RightPercent')">정답비율순</a>  &nbsp; <br>
	
		<table border="1px" width="800px">

			<tr>
				<td>등수</td>
				<td>이미지주소</td>
				<td>아이디</td>
				<td>푼문제</td>
				<td>정답수</td>
				<td>정답비율</td>

			</tr>

			<c:forEach var="row" items="${list}" varStatus="status">
				<br>
				<tr>
					<td>${row.ranking }</td>
					<td>${row.member.imgProfile }</td>
					<td>${row.member.userId }</td>
					<td>${row.myCntSubmit}</td>
					<td>${row.myCntRight}</td>
					<td>${row.myRightPercent}%</td>

				</tr>

			</c:forEach>





		</table>
<a href="${path}/"> 메인페이지로 이동</a>
	</div>
	

</body>
</html>