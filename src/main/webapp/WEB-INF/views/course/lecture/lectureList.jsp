<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/common.jsp"%>
<%@ include file="../../include/header.jsp"%>
	<script src="${path}/ckeditor/ckeditor.js"></script>
	<link rel="stylesheet" href="${path}/resources/css/reply_list.css?ver=2">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>

	</style>
	<script>
		$(document).ready(function() {
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/lectureBoard/likeStatus",
				data:"${_csrf.parameterName}=${_csrf.token}&courseNo=${cvo.courseNo}",
				success: function(result){
				//alert(result)
					if(result == 1){
						document.getElementById('rcm-btn').classList.add('btn_course_recommanded')
					}
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
			alert("lectno:"+lecNo);
			 alert("courseNo"+${cvo.courseNo});
			 if(confirm("해당 코스를 삭제하시겠습니까?")){
				location.href="${pageContext.request.contextPath}/lectureBoard/deleteLecture?courseNo=${cvo.courseNo}&lectureNo="+lecNo;
			}
		}
		function updateLecture(){
			alert("코스넘:"+${cvo.courseNo});
			alert("렉쳐넘:"+lecNo);
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

  <section id="root_container">

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
        </div>
      </div>
    </header>
    <section class="nav_lesson_list">
      <h1>${cvo.courseName}</h1>
      <ul>
				<c:forEach var="row" items="${lecList}" varStatus="status">
					<li data-lec-no="${row.lectureNo}" onclick="showLecture('${row.lectureNo}')">${row.lectureOrder}강, ${row.lectureName}</li>
				</c:forEach>
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
							console.log(xhr.response)
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
				<c:if test="${mvo.userId == cvo.member.userId }">
					<img alt="삭제"
						src="${pageContext.request.contextPath}/resources/img/delete_btn.jpg"
						onclick="deleteLecture()">
					<img alt="수정"
						src="${pageContext.request.contextPath}/resources/img/modify_btn.jpg"
						onclick="updateLecture()">
				</c:if>
			</sec:authorize>
			<div id="lecture"></div>
    </section>
  </section>
</section>

<%@ include file="../../include/footer.jsp"%>
