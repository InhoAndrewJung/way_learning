<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../include/common.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.js"></script>

<script>
function list(pageNo) {   ////////////////  curpage+serch_option +keyword 는 꼭 가져감!!
	
	location.href = "${pageContext.request.contextPath}/board/tech/list?pageNo="+pageNo+"&keyword=${map.keyword}"; 
}
</script>
<style>

#profile{width:50px; height:50px; border-radius: 50% }

</style>
</head>
<body>
<h2 align="center">목 록</h2><p>
<div align="center">

<!-- 비로그인 사용자는 아래 버튼을 보여주지 않는다. -->

<sec:authorize access="isAuthenticated()">
<a href="${pageContext.request.contextPath}/board/tech/write">글작성</a>
</sec:authorize>
 
 


<form name="form1" method="post" action="${pageContext.request.contextPath}/board/tech/list">
		<input name="keyword" value=${map.keyword}> 
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="submit" value="조회">
	
</form> 
	
	${map.count}의 게시물이 있습니다.
<table border="1" width="650" cellpadding="2">
	
	<!-- @@@@@이 부분 반드시 수정 @@@@-->
	<c:forEach var="bvo" items="${requestScope.map.lvo.list}">
		<tr>
			<td>${bvo.boardNo} 
			<c:forEach var="result" items="${requestScope.map.tagList}">
			<%-- 보드넘버:${bvo.boardNo}  태그넘버: ${result.BOARD_NO} --%>
			<c:if test="${bvo.boardNo == result.BOARD_NO}">
			<span style="font-size:10px">	${result.TAG} </span>
			</c:if>
			</c:forEach>
			<br>   
			<a href="${pageContext.request.contextPath}/board/tech/showContent?boardNo=${bvo.boardNo}&&keyword=${map.keyword}">${bvo.title}</a> 
			</td>
			<td>  <span style="color:red">(${bvo.cntReply})</span></td>
			<td> <img id="profile" src="${path}/resources/upload/${bvo.member.imgProfile}" > ${bvo.member.userId} 
			<br><span style="font-size:10px"><fmt:formatDate value="${bvo.regDate}" pattern="yyyy.MM.dd HH:mm:ss" /></span>
			</td>
			
			
					
		</tr>
		
	</c:forEach>
</table><p>

<a href="${pageContext.request.contextPath}">홈으로</a>




<!--@@@@@ 페이징 처리@@@@@@ -->
<br><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<!-- 페이징 처리 -->	
	<%-- 이전 페이지 그룹이 있으면 이미지 보여준다.
		  이미지 링크는 현 페이지 그룹 시작페이지 번호 -1 =>
		   이전 페이지 그룹의 마지막 페이지 번호로 한다. 
	 --%>
	
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
	 
 	 다음? ${requestScope.map.lvo.pagingBean.nextPageGroup}
	나우: ${requestScope.map.lvo.pagingBean.nowPageGroup}
	토탈: ${requestScope.map.lvo.pagingBean.totalPageGroup} 
	
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





















