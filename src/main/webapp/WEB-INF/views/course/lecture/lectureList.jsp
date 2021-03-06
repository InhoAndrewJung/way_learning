<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp"%>
<%@ include file="../../include/header.jsp"%>
	<script src="${path}/ckeditor/ckeditor.js"></script>
	<script>
		$(document).ready(function() {
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/lectureBoard/likeStatus",
				data:"${_csrf.parameterName}=${_csrf.token}&courseNo=${cvo.courseNo}",
				success: function(result){
					
					if(result == 1) document.getElementById('rcm-btn').classList.add('btn_course_recommanded')
				}
			});
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/lectureBoard/selectCntCourseLike",
				data: "${_csrf.parameterName}=${_csrf.token}&courseNo=${cvo.courseNo}",
				success: function(result){
					$("#recommendCnt").html(result);	
				}
			});
		});
		
		var lecNo= ${lecList[0].lectureNo};
		function showLecture(lectureNo){
			lecNo=lectureNo;
			$.ajax({
				type:"post",
				url: "${pageContext.request.contextPath}/lectureBoard/showLecture",
				data:"${_csrf.parameterName}=${_csrf.token}&courseNo=${cvo.courseNo}&lectureNo="+lecNo,
				success: function(result){
					$("#lecture").html(result);
				}
			});
		}
		function deleteLecture(){
			 if(confirm("해당 코스를 삭제하시겠습니까?")){
				location.href="${pageContext.request.contextPath}/lectureBoard/deleteLecture?courseNo=${cvo.courseNo}&lectureNo="+lecNo;
			}
		}
		function updateLecture(){
			if(confirm("해당 코스를 수정하시겠습니까?")){
				 $.ajax({
					type:"post",
					url: "${pageContext.request.contextPath}/lectureBoard/updateForm",
					data:"${_csrf.parameterName}=${_csrf.token}&courseNo=${cvo.courseNo}&lectureNo="+lecNo,
					success: function(result){
						$("#lecture").html(result);
					}
				});
			}
		}
		function courseLikeChange(){
		var param="${_csrf.parameterName}=${_csrf.token}&courseNo=${cvo.courseNo}";
		$.ajax({
			type: "post",
			url: "${pageContext.request.contextPath}/lectureBoard/changeLike",
			data: param,
			success: function(result){
				$("#recommendCnt").html(result);
				document.getElementById('rcm-btn').classList.toggle('btn_course_recommanded')
			}
		});
	}
	</script>
</head>
<body>
<c:if test="${lecList != null && lectureNo =='0' }">
	<script>showLecture('${lecList[0].lectureNo}');</script>
</c:if>
 <c:if test="${lectureNo !='0' }">
	<script>showLecture('${lectureNo}');</script>
</c:if>
  <section class="page_block">
    <header class="page_block_top">
      <div class="lesson_course_img" style="background-image:url('${path}/resources/upload/${cvo.courseImage}')"></div><!--
   --><div class="lesson_course_info">
        <div class="lesson_course_tags">
					<c:forEach var="tag" items="${tags}" varStatus="status">
							<span class="tag">${tag}</span>
					</c:forEach>
				</div>
        <p>${cvo.description}</p>
        <span class="lesson_course_long">총 26강 / 12시간 40분</span>
        <div class="author">
          <h3>강의 작성자</h3>
          <span class="author_name">${cvo.member.userId}</span>
          <span class="auth_date"><fmt:formatDate
							value="${cvo.regDate}" pattern="YYYY.MM.dd" /></span>
          <div class="author_img" style="background-image:url('${path}/resources/upload/${cvo.member.imgProfile}')"></div>
          <div class="btn_course_recommand" id="rcm-btn" onclick="courseLikeChange()"><span>이 코스 추천하기</span></div>
          <span align="center" id="recommendCnt" style="height:20px;width:20px;border:1px solid red;color:white;text-align:center;background-color:red;border-radius:50%;float:right;margin-top:5px"></span>
        </div>
      </div>
    </header>
    <section class="nav_lesson_list">
      <h1>${cvo.courseName}</h1>
      <ul>
				<c:forEach var="row" items="${lecList}" varStatus="status">
					<li data-lec-no="${row.lectureNo}" onclick="showLecture('${row.lectureNo}')">${row.lectureOrder}강, ${row.lectureName}</li>
				</c:forEach>
				<sec:authorize access="isAuthenticated()">
					<c:if test="${mvo.userId == cvo.member.userId}">
						<article data-course-no="my" class="my-course-article common-btn letucre-mycourse-btn" style="width: 60%; margin: 20px auto;" onclick="course()">
							<span data-course-no="my">내 코스 관리</span>
						</article>
					</c:if>
				</sec:authorize>
				<script type="text/javascript">
					var lectures = document.querySelectorAll("[data-lec-no]")
					lectures = Array.prototype.slice.call(lectures)
					lectures.forEach(checkLecture)
					function checkLecture(lecture, idx){
						var lno = lecture.dataset.lecNo
						var xhr = new XMLHttpRequest()
						xhr.open('get', '${pageContext.request.contextPath}/lectureBoard/isMyLectureRecordExist?lectureNo='+lno+'&courseNo=${cvo.courseNo}')
						xhr.send(null)
						xhr.onload = function() {
							if(xhr.response==1) lecture.classList.add('finish_lesson')
						}
					}
				</script>
        <%-- <li class="finish_lesson">제1강, 반복문(for, while)</li> --%>
      </ul>
    </section>
    <section class="lesson_content">
			<sec:authorize access="isAuthenticated()">
				<sec:authentication var="mvo" property="principal" />
				<c:if test="${mvo.userId == cvo.member.userId  || mvo.userId == 'james'}">
					<input type="button" class="common-btn" value="강의수정" onclick="updateLecture()" style="background-color:#4e737c;width:49%;margin-bottom: 30px;">
					<input type="button" class="common-btn" value="강의삭제" onclick="deleteLecture()" style="background-color:#c61919;width:49%">
				</c:if>
			</sec:authorize>
			<div id="lecture"></div>
    </section>
  </section>
</section>

<%@ include file="../../include/footer.jsp"%>
