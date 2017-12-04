<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
=======

<%@ include file="../../include/common.jsp" %>


>>>>>>> master
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<<<<<<< HEAD
<link rel="stylesheet" href="${path}/resources/css/board.css?ver=2">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%@ include file="../../include/common.jsp" %>
</head>
<body>
	
	
	
	<div class="container">
		
		
		
		
		<div class="menu">
			
			<div class="titleName">
			
				<img src="${path}/resources/image/question.png" id="image_title"> Q & A
			
			</div>
			
			<div class="write_button">
				<!-- 로그인 상태에서 보이는,  글쓰기-->
				<sec:authorize access="isAuthenticated()">
					<a href="#form"><img src="${path}/resources/image/write.png" id="image_write"></a>
				</sec:authorize>
				
			</div>
			
			<div class="search_menu">
			
			<!-- sorting 부분 -->
				<span class="search_button">
				
					<a class="new" onclick="sorting('board_no')">최신순</a> 
					<a class="recommend"  onclick="sorting('recommend')">추천순</a> 
					<a class="reply" onclick="sorting('re')">댓글순</a> 
					<a class="hit"  onclick="sorting('view')">조회순</a>
					
					<!-- 바로 아래부분 디자인해주기. -->
					${map.count}개의 게시물이 있습니다.
					
					
				</span>
			
				<!-- Searching 부분 -->
				
				<span class="search_section">
					<form name="form1" method="post" action="${pageContext.request.contextPath}/board/tech/list" id="form1">
						
						
						<input type="submit" value="조회">

						<input type="search" id="search_bar" value=${map.keyword}>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<input type="hidden" name="sorting" value="">	
					    <input type="button" id="search_button" value="Search">
					
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
						
						
					<c:forEach var="result" items="${requestScope.map.tagList}">
					
						<c:if test="${bvo.boardNo == result.BOARD_NO}">
					
						<span class="table-center_content_left">
							
							<!-- 글 제목 : TITLE -->
							<div class="left_title"> 
								<a href="${pageContext.request.contextPath}/board/tech/showContent?boardNo=${bvo.boardNo}
								&&keyword=${map.keyword}">${bvo.title}</a> 
								
							</div>
							
							<!-- 태그 : TAG -->
							
							<div class="left_tag">
								<span class="tag"> ${result.TAG} </span>
							</div>
							
						</span>
						
						</c:if>
					</c:forEach>
						
						<span class="table-center_content_right">
							
							<!-- 좋아요, 답글수, 조회수 -->
							
							<div class="right_like-comment">
								<span class="like">
								<img src="${path}/resources/image/heart.png" id="image_heart"> &nbsp; ${bvo.cntBoardLike}
								</span>
								<span class="comment">
								<img src="${path}/resources/image/reply.png" id="image_reply"> &nbsp; ${bvo.cntReply}
								</span>
								<span class="hit">
								<img src="${path}/resources/image/eyes.png" id="image_eyes"> &nbsp; ${bvo.cntView}
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
									25
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
	
	<!-- MAIN으로 -->
	
	<div class="move-boardList">
		
		<a href="${pageContext.request.contextPath}">
			<img src="${path}/resources/image/house.png" id="image_list">
		</a>
	</div>	
			
			
	<!-- PAGE 이동 -->		
			
	<div class="move-page">
		
		<!-- 바로 이전 페이지로  -->
		
	 <c:if test="${requestScope.map.lvo.pagingBean.previousPageGroup}">		
		<li class="page-pre">
		<a href="javascript:list('${requestScope.map.lvo.pagingBean.startPageOfPageGroup-1}')"><span></span></a>
			
		
		</li>
	 </c:if>
	 
		<!-- 첫 페이지로 -->
		
	 <c:if test="${requestScope.map.lvo.pagingBean.nowPageGroup >=1}">
		<li class="page-first">
			<a href="javascript:list('1')" class="number_page">First</a>
			
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
			 ${i}
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
		<a href="javascript:list('${requestScope.map.lvo.pagingBean.endPageOfPageGroup+1}')"><span></span></a>
	
		</li>
	 </c:if>
	 	
	</div>
	
	
	
</body>
</html>
=======

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


<style>

#profile{width:50px; height:50px; border-radius: 50% }
a{text-decoration:none; cursor: pointer;}
#tag{font-size:10px;border:1px solid grey;border-radius:10%; background-color:grey; color:white; margin-left:10px;}
</style>



</head>
<body>

<div align="center">

<!-- 비로그인 사용자는 아래 버튼을 보여주지 않는다. -->

<sec:authorize access="isAuthenticated()">
<a href="${pageContext.request.contextPath}/board/qna/write">글작성</a>
</sec:authorize>
 
 


<form name="form1" method="post" action="${pageContext.request.contextPath}/board/qna/list" id="form1">
		<input name="keyword" value=${map.keyword}> 
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="hidden" name="sorting" value="">
		<input type="submit" value="조회">
		
</form> 
	
	
	
<a href="#"  onclick="sorting('board_no')">최신순  </a>  &nbsp; 
<a href="#"  onclick="sorting('recommend')">추천순 </a>  &nbsp;  
<a href="#"  onclick="sorting('re')">댓글순 </a>   &nbsp; 
<a href="#"  onclick="sorting('view')">조회순 </a>   &nbsp; 
${map.count}개의 게시물이 있습니다.
<table border="1" width="650" cellpadding="2">
	
	<!-- @@@@@이 부분 반드시 수정 @@@@-->
	<c:forEach var="bvo" items="${requestScope.map.lvo.list}">
		<tr>
			<td>${bvo.boardNo} 
			<c:forEach var="result" items="${requestScope.map.tagList}">
			<%-- 보드넘버:${bvo.boardNo}  태그넘버: ${result.BOARD_NO} --%>
			<c:if test="${bvo.boardNo == result.BOARD_NO}">
			<span id="tag" >	${result.TAG} </span>
			</c:if>
			</c:forEach>
			<br>   
			<a href="${pageContext.request.contextPath}/board/qna/showContent?boardNo=${bvo.boardNo}&&keyword=${map.keyword}">${bvo.title}</a> 
			</td>
			
			<!-- 게시글에대한 좋아요 수 -->
			<td>  
			<img  src="${path}/resources/img/like.png" style="width:20px; height:20px;" >
			${bvo.cntBoardLike}</td>
			<!-- 총 리플수 -->
			<td>  <span style="color:red">(${bvo.cntReply})</span></td>
			<td> <img id="profile" src="${path}/resources/upload/${bvo.member.imgProfile}" > ${bvo.member.userId}  ${bvo.member.activity} 
			<br><span style="font-size:10px"><fmt:formatDate value="${bvo.regDate}" pattern="yyyy.MM.dd HH:mm:ss" /></span>
			</td>
			
			
					
		</tr>
		
	</c:forEach>
</table><p>

<a href="${pageContext.request.contextPath}">홈으로</a>




<!--@@@@@ 페이징 처리@@@@@@ -->
<br><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	
	 <c:if test="${requestScope.map.lvo.pagingBean.nowPageGroup >=1}">
	 
	   <a href="javascript:list('1')">[처음]</a>
	 </c:if>
	 &nbsp;&nbsp;
	 
	 
	
	 
	 <c:if test="${requestScope.map.lvo.pagingBean.previousPageGroup}">
	 <a href= "javascript:list('${requestScope.map.lvo.pagingBean.startPageOfPageGroup-1}')">[이전]</a>
	 </c:if>
	 &nbsp;&nbsp;
	<%-- PagingBean 을 이용해서 현재 페이지에 해당되는 페이지그룹의
		   시작페이지~~마지막페이지까지 화면에 보여준다. 
		   이 때 현재 페이지를 제외한 나머지 페이지는 링크를 걸어
		   해당 페이지에 대한 게시물 리스트 조회가 가능하도록 한다. 
	 --%>	
	 
	 
	<c:forEach var="i" begin="${requestScope.map.lvo.pagingBean.startPageOfPageGroup}" end="${requestScope.map.lvo.pagingBean.endPageOfPageGroup}">
	 <c:choose>
	 <c:when test="${requestScope.map.lvo.pagingBean.nowPage!=i}">
	 <a href="javascript:list('${i}')">${i}</a>
	 </c:when>
	 <c:otherwise>
	${i}
	</c:otherwise>
	</c:choose>
	</c:forEach>	 
	&nbsp;&nbsp;
	<%-- 다음 페이지 그룹이 있으면 화살표 이미지를 보여준다.
			이미지 링크는 현재 페이지 그룹의 마지막 번호 + 1 => 
			다음 그룹의 시작 페이지로 링크한다. 
			right_arrow_btn.gif
	 --%>
	 
 	
	
	 <c:if test="${requestScope.map.lvo.pagingBean.nextPageGroup}">
	 <a href="javascript:list('${requestScope.map.lvo.pagingBean.endPageOfPageGroup+1}')">
	 [다음]
	 </a>
	 
	 </c:if>	
	 
	 
	 <c:if test="${requestScope.map.lvo.pagingBean.nowPage< requestScope.map.lvo.pagingBean.totalPage}">
	 <a href="javascript:list('${requestScope.map.lvo.pagingBean.totalPage}')">[끝]</a>
	 
	 </c:if>
	 </div>  
</body>
</html>





















>>>>>>> master
