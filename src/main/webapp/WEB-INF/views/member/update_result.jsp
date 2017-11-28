<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%-- spring security custom tag를 사용하기 위한 선언 --%>
 <%@ include file="../include/common.jsp" %>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
 <sec:authentication property="principal.userId"/>님 회원정보수정되었습니다. 
 
<a href="${path}/"> 메인페이지로 이동</a>
