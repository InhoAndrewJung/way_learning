<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/board.css?ver=2">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.js"></script>

<script>
function list(pageNo) {   ////////////////  curpage+serch_option +keyword 는 꼭 가져감!!
	
	location.href = "${pageContext.request.contextPath}/board/qna/list?pageNo="+pageNo+"&keyword=${map.keyword}"; 
}
function sorting(sort){
	if(sort == 'board_no'){
		$('input[name=sorting]').val('board_no');
		
	}else if(sort == 'recommend'){
		$('input[name=sorting]').val('recommend');
		
	}else if(sort == 're'){
		$('input[name=sorting]').val('re');
		
	}else if(sort == 'view'){
		$('input[name=sorting]').val('view');
		
	}
	 $('#form1').submit();  
	 
}
</script>

</head>
<body>
	
	
	
	<div class="container">
		
		
		
		
		<div class="menu">
			
			<div class="titleName">
			
				<img src="${path}/resources/img/question.png" id="image_title"> Q & A
			
			</div>
			
			<div class="pageMove_button">
											
				<!-- 로그인 상태에서 보이는,  글쓰기-->
				<sec:authorize access="isAuthenticated()">
					<a href="${pageContext.request.contextPath}/board/qna/write">
						<img src="${path}/resources/img/write.png" id="image_write"></a>
				</sec:authorize>
				
				<!-- 메인으로 이동 -->
				<a href="/learning">
					<img src="/learning/resources/img/house.png" id="image_list">
				</a>	
				
			</div>
			
	
			
			<div class="search_menu">
			
			<!-- sorting 부분 -->
				<span class="search_button">
				
					<a class="new_search" onclick="sorting('board_no')">최신순</a> 
					<a class="recommend_search"  onclick="sorting('recommend')">추천순</a> 
					<a class="reply_search" onclick="sorting('re')">댓글순</a> 
					<a class="hit_search"  onclick="sorting('view')">조회순</a>
					
								
					
				</span>
			
				<!-- Searching 부분 -->
				
				<span class="search_section">
					<form name="form1" method="post" action="${pageContext.request.contextPath}/board/qna/list" id="form1">
						
						
						

						<input type="search" name="keyword" id="search_bar" value=${map.keyword}>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<input type="hidden" name="sorting" value="">	
					    <input type="submit" id="search_button" value="Search">
					
					</form> 
					
				</span>
					
					
				
			</div>
			
		</div>
	
	<!-- *********************************** Table *********************************** -->
		
		<table class="boardTable">
						
			<c:forEach var="bvo" items="${requestScope.map.lvo.list}">
				<tr class="table-center">	
					<td class="table-center_content">
					<!-- 보드넘버 view 창에는 X -->
					<%-- 보드넘버:${bvo.boardNo}  태그넘버: ${result.BOARD_NO} --%>
						
					<span class="table-center_content_left">
							
							<!-- 글 제목 : TITLE -->
							<div class="left_title"> 
								<a href="${pageContext.request.contextPath}/board/qna/showContent?boardNo=${bvo.boardNo}
								&&keyword=${map.keyword}">${bvo.title}</a> 
								
							</div>
							
							<!-- 태그 : TAG -->
							
							<div class="left_tag">
							
							<!-- Tag의 span 영역만 돌아야 하므로 여기부터
								 게시판Table의 글 번호랑 Tag Table의 번호를 비교하여 
								 해당 글의 태그를 호출 -->
							
						<c:forEach var="result" items="${requestScope.map.tagList}">
							<c:if test="${bvo.boardNo == result.BOARD_NO}">
								
								
									<span class="tag"> ${result.TAG} </span>
								
							</c:if>
						</c:forEach>
						
						</div>
						
					</span>
					
						<span class="table-center_content_right">
							
							<!-- 좋아요, 답글수, 조회수 -->
							
							<div class="right_like-comment">
								<span class="like">
								<img src="${path}/resources/img/empty_heart.png" id="image_heart"> &nbsp; ${bvo.cntBoardLike}
								</span>
								<span class="comment">
								<img src="${path}/resources/img/reply.png" id="image_reply"> &nbsp; ${bvo.cntReply}
								</span>
								<span class="hit">
								<img src="${path}/resources/img/eyes.png" id="image_eyes"> &nbsp; ${bvo.cntView}
								</span>
							</div>
							
						</span>
						
					</td>
					
					<!-- 글쓴이, 활동점수, 글쓴시각 -->
					
					<td class="table-center_userList">
						<div class="userList">
							<img src="${path}/resources/upload/${bvo.member.imgProfile}" id="image_profile">
						
							<div class="userList-info">
								<a class="userId">${bvo.member.userId}</a>
								
								<div class="activity">
								
									<span class="fa fa-graduation-cap"></span>
									${bvo.member.activity}
								</div>
								
								<div class="date">
									<span class="timeago" ><fmt:formatDate value="${bvo.regDate}" pattern="yyyy.MM.dd HH:mm:ss" /></span> 
								
								</div>
							
							</div>
						</div>
					</td>
				</tr>
				
			</c:forEach>		
		</table>
	</div>
	
	
			
			
	<!-- PAGE 이동 -->		
			
	<div class="move-page">
		
		<!-- 바로 이전 페이지로  -->
		
	 <c:if test="${requestScope.map.lvo.pagingBean.previousPageGroup}">		
		<li class="page-pre">
		<a class="page_jump" href="javascript:list('${requestScope.map.lvo.pagingBean.startPageOfPageGroup-1}')"><span></span><span></span></a>
			
		
		</li>
	 </c:if>
	 
		<!-- 첫 페이지로 -->
		
	 <c:if test="${requestScope.map.lvo.pagingBean.nowPageGroup >=1}">
		<li class="page-first">
			<a href="javascript:list('1')" class="444ge">First</a>
			
		</li>
	</c:if>
	
		
		<!-- 번호로 페이지 이동 -->	
		
	<c:forEach var="i" begin="${requestScope.map.lvo.pagingBean.startPageOfPageGroup}" end="${requestScope.map.lvo.pagingBean.endPageOfPageGroup}">
	 <c:choose>
		 <c:when test="${requestScope.map.lvo.pagingBean.nowPage!=i}">
		<li class="page-active">
			<a href="javascript:list('${i}')" class="number_page">${i}</a>
		</li>	
		
		
		
			
	 	</c:when>
	 	
		 <c:otherwise>
			<li class="page-active_now">
			<a href="javascript:list('${i}')" class="number_page">${i}</a>
		</li>	
		</c:otherwise>
	</c:choose>
			
			
	</c:forEach>	
	
		<!-- 마지막 페이지로 -->
	 <c:if test="${requestScope.map.lvo.pagingBean.nowPage< requestScope.map.lvo.pagingBean.totalPage}">
	 
		<li class="page-last">
			<a href="javascript:list('${requestScope.map.lvo.pagingBean.totalPage}')" class="number_page">Last</a>
		</li>	
	</c:if>
	
		<!-- 이 다음페이지로 -->
		
	 <c:if test="${requestScope.map.lvo.pagingBean.nextPageGroup}">
	 
		<li class="page-next">
		<a class="page_jump" href="javascript:list('${requestScope.map.lvo.pagingBean.endPageOfPageGroup+1}')"><span></span><span></span></a>
	
		</li>
	 </c:if>
	 	
	</div>
	
	
	
</body>
</html>