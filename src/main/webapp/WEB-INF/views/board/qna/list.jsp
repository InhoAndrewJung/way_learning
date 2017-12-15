<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp"%>
<%@ include file="../../include/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/board/board.css?ver=2">
<script>
  function list(pageNo) {   ////////////////  curpage+serch_option +keyword 는 꼭 가져감!!
  	location.href = "${pageContext.request.contextPath}/board/qna/list?pageNo="+pageNo+"&keyword=${map.keyword}";
  }
  function sorting(sort){
    $('input[name=sorting]').val(sort);
    $('#form1').submit();
  }
  function searchByTag(){
    var tag = event.target.innerText
    console.log(event.target.innerText)
    document.form1.keyword.value = tag
    document.form1.submit()
  }
</script>
<div class="common-container">
  <div>
    <div class="titleName">
			<img src="${path}/resources/img/question.png" id="image_title"> Q & A
		</div>
			<div class="pageMove_button">
				<!-- 로그인 상태에서 보이는,  글쓰기-->
				<sec:authorize access="isAuthenticated()">
					<a href="${pageContext.request.contextPath}/board/qna/write">
            <img src="${path}/resources/img/write.png" class="hover-scale"></a>
				</sec:authorize>
				<!-- 메인으로 이동 -->
				<a href="/learning">
					<img src="/learning/resources/img/house.png" class="hover-scale">
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
  <table class="boardTable common-card util-width-100">
    <c:forEach var="bvo" items="${requestScope.map.lvo.list}">
      <tr>
        <td>
          <span class="boardTitleSet">
            <h2>
  						<a href="${pageContext.request.contextPath}/board/qna/showContent?boardNo=${bvo.boardNo}&&keyword=${map.keyword}">
                ${bvo.title}
              </a>
  					</h2>
  					<div class="left_tag">
              <c:forEach var="result" items="${requestScope.map.tagList}">
  							<c:if test="${bvo.boardNo == result.BOARD_NO}">
  								<span class="tag" onclick="searchByTag()" style="cursor:pointer">${result.TAG}</span>
  							</c:if>
  						</c:forEach>
  					</div>
  				</span>
  				<span class="boardCntSet">
  					<span class="like"><img src="${path}/resources/img/empty_heart.png"> &nbsp; ${bvo.cntBoardLike}</span>
  					<span class="comment"><img src="${path}/resources/img/reply.png"> &nbsp; ${bvo.cntReply}</span>
  					<span class="hit"><img src="${path}/resources/img/eyes.png"> &nbsp; ${bvo.cntView}</span>
  				</span>
  			</td>
					<!-- 글쓴이, 활동점수, 글쓴시각 -->
        <td style="width:200px;">
					<div class="userList">
						<img src="${path}/resources/upload/${bvo.member.imgProfile}">
						<div class="userList-info">
							<a class="userId">${bvo.member.userId}</a>
							<div class="activity"><span class="fa fa-graduation-cap"></span>${bvo.member.activity}</div>
							<div class="date"><span class="timeago" ><fmt:formatDate value="${bvo.regDate}" pattern="yyyy.MM.dd HH:mm:ss" /></span></div>
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
      <li class="page-first"><a href="javascript:list('1')" class="444ge">First</a></li>
    </c:if>
		<!-- 번호로 페이지 이동 -->
    <c:forEach var="i" begin="${requestScope.map.lvo.pagingBean.startPageOfPageGroup}" end="${requestScope.map.lvo.pagingBean.endPageOfPageGroup}">
      <c:choose>
        <c:when test="${requestScope.map.lvo.pagingBean.nowPage!=i}">
          <li class="page-active"><a href="javascript:list('${i}')" class="number_page">${i}</a></li>
        </c:when>
        <c:otherwise>
        <li class="page-active_now"><a href="javascript:list('${i}')" class="number_page">${i}</a></li>
        </c:otherwise>
      </c:choose>
    </c:forEach>
		<!-- 마지막 페이지로 -->
    <c:if test="${requestScope.map.lvo.pagingBean.nowPage< requestScope.map.lvo.pagingBean.totalPage}">
      <li class="page-last"><a href="javascript:list('${requestScope.map.lvo.pagingBean.totalPage}')" class="number_page">Last</a></li>
    </c:if>
		<!-- 이 다음페이지로 -->
    <c:if test="${requestScope.map.lvo.pagingBean.nextPageGroup}">
      <li class="page-next">
        <a class="page_jump" href="javascript:list('${requestScope.map.lvo.pagingBean.endPageOfPageGroup+1}')"><span></span><span></span></a>
      </li>
    </c:if>
	</div>
<%@ include file="../../include/footer.jsp"%>
