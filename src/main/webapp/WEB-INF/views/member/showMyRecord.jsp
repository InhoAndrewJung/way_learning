<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%-- spring security custom tag를 사용하기 위한 선언 --%>
 <%@ include file="../include/common.jsp" %>

<div align="center">
내가 푼 문제 :  <c:forEach var="row" items="${rightList }" varStatus="status"> ${row}번 <c:if test = "${!status.last}">,</c:if></c:forEach> <br>


내가 못 푼 문제: <c:forEach var="row" items="${wrongList }" varStatus="status">  ${row}번 <c:if test = "${!status.last}">,</c:if> </c:forEach> <br>

내 record : <br>
<table border="1px" >
<tr> <td nowrap>아이디:${answerResult.userId}</td></tr>

<tr> <td>나의 순위(제출순):${myRanking}위</td></tr>
<tr> <td>제출수:${answerResult.myCntSubmit}개</td></tr>
<tr> <td>맞은수:${answerResult.myCntRight}개</td></tr>
<tr> <td>틀린갯수:${answerResult.myCntWrong}개</td></tr>
<tr> <td>런타임에러:${answerResult.myCntError}개</td></tr>





</table>

 
<a href="${path}/"> 메인페이지로 이동</a>
</div>