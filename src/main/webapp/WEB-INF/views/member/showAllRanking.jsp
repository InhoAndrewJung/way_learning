<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/ranking/showAllRanking.css">
</head>
<body>
<div class="container">
	<ul class="container-body">
	
		<li class="first-rankCard" >
			<div class="first-rank">
				<img src="${path}/resources/img/crown1.png" class="first-crown"><br>
				<span class="first-rank-no">${list[0].ranking}</span><br>
				<span class="first-rank-text">Rank</span>
			</div>
			<div class="first-user">
				<img src="${path}/resources/upload/${list[0].member.imgProfile}" class="first-image_face"><br>
				<span class="first-user-name">${list[0].member.userId}</span>
			</div>
			
			<div class="first-cntSubmit">
				<span class="first-cntSubmit-no">${list[0].myCntSubmit}</span><br>
				<span class="first-cntSubmit-text">Total</span>
			</div>
			<div class="first-cntRight">
				<span class="first-cntRight-no">${list[0].myCntRight}</span><br>
				<span class="first-cntRight-text">Correct</span>
				</div>
			<div class="first-cntPercent">
				<span class="first-cntPercent-no">${list[0].myRightPercent}%</span>
				<span class="first-cntPercent-text">Percentage</span>				
			</div>
		</li>
		
		<li class="rankCard" id="second" >
			<div class="rank">
				<img src="${path}/resources/img/crown2.png" class="crown"><br>
				<span class="rank-no">${list[1].ranking}</span><br>
				<span class="rank-text">Rank</span>
			</div>
			<div class="user">
				<img src="${path}/resources/upload/${list[1].member.imgProfile}" class="image_face"><br>
				<span class="user-name">${list[1].member.userId}</span>
			</div>
			
			<div class="cntSubmit">
				<span class="cntSubmit-no">${list[1].myCntSubmit}</span><br>
				<span class="cntSubmit-text">Total</span>
			</div>
			<div class="cntRight">
				<span class="cntRight-no">${list[1].myCntRight}</span><br>
				<span class="cntRight-text">Correct</span>
				</div>
				<!-- 그래프 부분  -->
			<div class="cntPercent">
				<span class="cntPercent-no">${list[1].myRightPercent}%</span>
				<span class="cntPercent-text">Percentage</span>	
			</div>
		</li>
		
		<li class="rankCard" id="third" >
			<div class="rank">
				<img src="${path}/resources/img/crown3.png" class="crown"><br>
				<span class="rank-no">${list[2].ranking}</span><br>
				<span class="rank-text">Rank</span>
			</div>
			<div class="user">
				<img src="${path}/resources/upload/${list[2].member.imgProfile}" class="image_face"><br>
				<span class="user-name">${list[2].member.userId}</span>
			</div>
			
			<div class="cntSubmit">
				<span class="cntSubmit-no">${list[2].myCntSubmit}</span><br>
				<span class="cntSubmit-text">Total</span>
			</div>
			<div class="cntRight">
				<span class="cntRight-no">${list[2].myCntRight}</span><br>
				<span class="cntRight-text">Correct</span>
				</div>
			<div class="cntPercent">
				<span class="cntPercent-no">${list[2].myRightPercent}%</span>
				<span class="cntPercent-text">Percentage</span>				
			</div>
		</li>
		
		<c:forEach var="row" items="${list}" begin="3" varStatus="status">
		<li class="rankCard">
			<div class="rank">
				<span class="rank-no">${row.ranking}</span><br>
				<span class="rank-text">Rank</span>
			</div>
			<div class="user">
				<img src="${path}/resources/upload/${row.member.imgProfile}" class="image_face"><br>
				<span class="user-name">${row.member.userId}</span>
			</div>
			
			<div class="cntSubmit">
				<span class="cntSubmit-no">${row.myCntSubmit}</span><br>
				<span class="cntSubmit-text">Total</span>
			</div>
			<div class="cntRight">
				<span class="cntRight-no">${row.myCntRight}</span><br>
				<span class="cntRight-text">Correct</span>
				</div>
			<div class="cntPercent">
				<span class="cntPercent-no">${row.myRightPercent}%</span>
				<span class="cntPercent-text">Percentage</span>				
			</div>
		</li>
		</c:forEach>
	</ul>
</div>
</body>
</html>
