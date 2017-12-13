<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%-- spring security custom tag를 사용하기 위한 선언 --%>
 <%@ include file="../include/common.jsp" %>
<link rel="stylesheet" href="${path}/resources/css/member/showMyRecord.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<body>
<div class="container">
	<div class="logo"><img src="${path}/resources/img/google.png" id="image_logo" onclick="toMain()"></div>
	<sec:authorize access="isAuthenticated()">
	<sec:authentication var="mvo" property="principal" /> 
	<div class="container-head">
		<div class="userList">
				<img src="${path}/resources/upload/${mvo.imgProfile}" id="image_profile">		
				<div class="userList-info">
					<a class="userId">${mvo.userId}</a>
								
					<div class="activity">
						<span class="fa fa-graduation-cap"></span>
						${mvo.activity}
					</div>
					<div class="register_time">
						<span class="timeago">
							<fmt:formatDate value="${mvo.regDate}" pattern="yyyy.MM.dd" />
						</span> 
					</div>
							
				</div>
				
		</div>
	</div>
	</sec:authorize>
	
	<div class="container-body">
			<div class="head">
				<div class="title">
					<span class="rank">
						<div class="rank_no">${myRanking}</div>
						<div class="rank_text">Rank</div>
					 </span>
					<span class="total">
						<div class="total_no">${answerResult.myCntSubmit}</div>
						<div class="total_text">Total</div>	
					</span>
					
				</div>
			</div>
			<div class="body">
				<span class="correct">
						<div class="correct_no">${answerResult.myCntRight}</div>
						<div class="correct_text">Correct</div>	
					</span>	
				
			 	<span class="wrong">
						<div class="wrong_no">${answerResult.myCntWrong}</div>
						<div class="wrong_text">Wrong</div>	
				</span>
					
				<span class="error">
						<div class="error_no">${answerResult.myCntError}</div>
						<div class="error_text">Error</div>	
				</span>
				
				
			</div>
			
			
			<div class="container-footer">
			
				<hr>
				<div class="detail">					
					<div class="detail_correct">
						<span class="detail_correct-text">Complete</span><br>
						<c:forEach var="row" items="${rightList }" varStatus="status">
						<span class="detail_correct-no"> ${row} </span>
						 <c:if test = "${!status.last}"></c:if></c:forEach>
					</div>
					<div class="detail_wrong">
						<span class="detail_wrong-text">Not Yet!</span><br>
						 <c:forEach var="row" items="${wrongList }" varStatus="status"> 
						 <span class="detail_wrong-no">${row}</span>
						 <c:if test = "${!status.last}"></c:if></c:forEach>
					</div>
				</div>
		
			</div>
		
	</div>
		
</div>



</body>