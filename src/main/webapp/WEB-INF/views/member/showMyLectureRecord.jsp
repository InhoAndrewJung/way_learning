<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%-- spring security custom tag를 사용하기 위한 선언 --%>
 <%@ include file="../include/common.jsp" %>



내가 본 강의 목록
<table border =1>
<tr >
<td nowrap>코스번호</td>
<td nowrap>코스명</td>
<td nowrap>강의 순서</td>
<td nowrap>강의명</td>
<td nowrap>강사</td>

<td nowrap>총 코스 갯수</td>
<td nowrap>코스별 진도율</td>

</tr>
   <c:forEach var="list" items="${lectureList}">
<tr>

<td  nowrap>${list.COURSE_NO}</td>
<td  nowrap>${list.COURSE_NAME}</td>
<td  nowrap  align="center">${list.LECTURE_ORDER}</td>
<td  nowrap><a href="${pageContext.request.contextPath}/lectureBoard/showLectureList?courseNo=${list.COURSE_NO}&lectureNo=${list.LECTURE_NO}">${list.LECTURE_NAME}</a></td>
<td  nowrap>${list.AUTHOR}</td>

<td  nowrap align="center">${list.CNT_COURSE}</td>
<td  nowrap>${list.PROGRESS}%</td>


</tr>
</c:forEach>
</table>






</table>

 
<a href="${path}/"> 메인페이지로 이동</a>
