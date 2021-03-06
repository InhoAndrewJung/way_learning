<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/common.jsp"%>
  <h2 class="mypage_title">내가 푼 문제</h2>
  <div class="common-card" style="padding:20px">

	<sec:authorize access="isAuthenticated()">
	<sec:authentication var="mvo" property="principal" />
	<div class="container-head">
		<div class="userList">
				<img src="${pageContext.request.contextPath}/resources/upload/${mvo.imgProfile}" id="myrecord-image_profile">
				<div class="userList-info">
					<a class="myrecord-userId">${mvo.userId}</a>
					<div class="myrecord-activity">
						<span class="fa fa-graduation-cap"></span>
						${mvo.activity}
					</div>
					<div class="register_time">
						<span class="timeago">
							<fmt:formatDate value="${mvo.regDate}" pattern="yyyy.MM.dd" />
						</span>
					</div>

				</div>

		</div>
	</div>
	</sec:authorize>
  <div class="course_progress">
    <section>
      <div class="course_progress_bar" id="test_right" data-test-progress="${answerResult.myCntRight/answerResult.myCntSubmit*100}">
        정답(<fmt:formatNumber value="${answerResult.myCntRight/answerResult.myCntSubmit*100}" pattern=".00"/>%)
      </div>
      <div class="course_progress_bar" id="test_wrong" data-test-progress="${answerResult.myCntWrong/answerResult.myCntSubmit*100}">
        오답(<fmt:formatNumber value="${answerResult.myCntWrong/answerResult.myCntSubmit*100}" pattern=".00"/>%)
      </div>
      <div class="course_progress_bar" id="test_error" data-test-progress="${answerResult.myCntError/answerResult.myCntSubmit*100}">
        에러(<fmt:formatNumber value="${answerResult.myCntError/answerResult.myCntSubmit*100}" pattern=".00"/>%)
      </div>
    </section>
  </div>
			<div class="myrecord">
				<span class="myrecord-rank">
					<div class="myrecord-no">${myRanking}</div>
					<div class="myrecord-text">Rank</div>
				 </span>
				<span class="myrecord-total">
					<div class="myrecord-no">${answerResult.myCntSubmit}</div>
					<div class="myrecord-text">Total</div>
				</span>
				<span class="myrecord-correct">
						<div class="myrecord-no">${answerResult.myCntRight}</div>
						<div class="myrecord-text">Correct</div>
					</span>

			 	<span class="myrecord-wrong">
						<div class="myrecord-no">${answerResult.myCntWrong}</div>
						<div class="myrecord-text">Wrong</div>
				</span>

				<span class="myrecord-error">
						<div class="myrecord-no">${answerResult.myCntError}</div>
						<div class="myrecord-text">Error</div>
				</span>
			</div>


    <style type="text/css">
  #test_right{background:linear-gradient(to right, #21b80f 0%, #66db1f 51%, #75e82c 75%);}
  #test_wrong{background: linear-gradient(to right, #ff8f00, red );}
  #test_error{}
  .course_progress {
    position:relative;
    margin:10px 0;
    margin-bottom:20px;
    border-radius: 25px;
    overflow: hidden;
  }
 .course_progress section{
    height:35px;
    overflow: hidden;
    margin: 0 auto;
  }
  .course_progress_bar {
    height: 35px;
    transition: all 1s ease 0s;
    color: white;
    border-radius: 0;
    line-height: 35px;
    text-align: center;
    text-shadow: 0px 0px 2px #000000;
  }
</style>
<script type="text/text/javascript">
function drawProgress() {
  var resultList = document.querySelectorAll("[data-test-progress]")
  resultList = Array.prototype.slice.call(resultList)
  resultList.forEach(graph)
  function graph(item, idx){
    var progress = item.dataset.testProgress
    item.style.width = progress + '%'
  }
}
function eventListenerInit() {
  var naviList = document.querySelectorAll("[data-path]")
  naviList = Array.prototype.slice.call(naviList)
  naviList.forEach(addPath)
  function addPath(item, idx){
    item.addEventListener('click', navi)
  }
}
function navi(event){
  location.href = '${path}/'+event.target.dataset.path;
  //course/showCourse?courseNo=2
}
setTimeout(drawProgress, 50)
</script>
			<div class="container-footer">
				<hr>
				<div class="detail">
					<div class="detail-correct">
						<div>Complete</div>
						<c:forEach var="row" items="${rightList }" varStatus="status">
						<span> ${row} </span>
						 <c:if test = "${!status.last}"></c:if></c:forEach>
					</div>
					<div class="detail-wrong">
						<div>Not Yet!</div>
						 <c:forEach var="row" items="${wrongList }" varStatus="status">
						 <span>${row}</span>
						 <c:if test = "${!status.last}"></c:if></c:forEach>
					</div>
				</div>
			</div>
	</div>
</div>
