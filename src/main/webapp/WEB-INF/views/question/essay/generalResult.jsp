<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp"%>
<%@ include file="../../include/header.jsp"%>

	<div align="center">

		${result}
		<c:if test="${multipleChoice != null}">
		<a href="${path}/question/general/multipleChoiceContent?questionNo=${questionNo}"> 객관식 문제 다시풀기</a>
		</c:if>
		<c:if test="${shortAnswer !=null}">
		<a href="${path}/question/general/shortAnswerContent?questionNo=${questionNo}">  주관식 문제 다시풀기</a>
		</c:if>

		<a href="${path}/question/general/getList"> 문제리스트로가기</a>
		<a href="${path}/"> 메인페이지로 이동</a>
	</div>
</body>
</html>
