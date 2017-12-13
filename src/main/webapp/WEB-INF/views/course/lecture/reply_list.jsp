<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${not empty list}">
  <div class="reply-title">
    <span class="footer_comment">
      <img src="${pageContext.request.contextPath}/resources/img/reply.png" id="footer_image_reply">
    </span>
  </div>
</c:if>
<c:forEach var="row"  items="${list}">
<div class="reply-center">
  <div class="reply-body" style="width:100%">
    <div class="reply-head">
      <div class="userList">
        <img src="${pageContext.request.contextPath}/resources/upload/${row.member.imgProfile}" id="image_profile">
        <div class="userList-info">
          <a class="userId">${row.member.userId}</a>
          <div class="activity">
            <span class="fa fa-graduation-cap"></span> ${row.member.activity}
          </div>
          <div class="date" style="text-align:left;margin-top: -5px;margin-bottom: 5px;">
            <span class="timeago"><fmt:formatDate value="${row.regDate}" pattern="YYYY.MM.dd"/></span>
          </div>
        </div>
      </div>
    <div class="edit-delete">
       <!-- 본인의 댓글만 수정,삭제가 가능하도록 처리 -->
          <sec:authorize access="isAuthenticated()">
            <sec:authentication var="mvo" property="principal" />
            <c:if test="${mvo.userId == row.member.userId}">
            <span class="replyEdit">
              <a id="modify${row.replyNo}" onclick="showModify('${row.replyNo}')" >
              <img src="${pageContext.request.contextPath}/resources/img/replyEdit.png" class="image_replyEdit"></a>
            </span>
            <span class="delete">
              <a id="deleteReply${row.replyNo}" onclick="deleteReply('${row.replyNo}')">
              <img src="${pageContext.request.contextPath}/resources/img/eraser.png" class="image_eraser"></a>
            </span>
          </c:if>
         </sec:authorize>
    </div>
  </div>
  <!-- 댓글 내용 -->

  <div class="reply-text" title="modifyResult${row.replyNo}">${row.replytext}</div>
    <!-- 디자인 수정 해야함************************** -->
    <a  id="modifyDo${row.replyNo}" class="edit_done" onclick="modify('${row.replyNo}')">
    <img src="${pageContext.request.contextPath}/resources/img/replyEdit.png" class="image_replyEditDone"></a>
    <a id="modifyCancel${row.replyNo}" class="modifyCancel" onclick="modifyCancel('${row.replytext}','${row.replyNo}')">
    <img src="${pageContext.request.contextPath}/resources/img/cancel.png" class="image_replyCancel"></a>
  </div>
    <hr>
</c:forEach>
