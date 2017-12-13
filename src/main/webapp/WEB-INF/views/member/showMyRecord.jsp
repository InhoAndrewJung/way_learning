<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../include/common.jsp" %>

<h2 class="mypage_title">내가 푼 문제 기록</h2>

<div class="my_rank">
  <div class="profile_img" style="background-image:url('${path}/resources/upload/${mvo.imgProfile}')"></div>
  <h3>${answerResult.member.userId}</h3>
  <p>제출한 문제 : ${answerResult.myCntSubmit}</p><p>${myRanking}위</p>
</div>

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
<section class="testList rightList">
  <div class="header">내가 푼 문제</div>
  <div class="list"><c:forEach var="row" items="${rightList }" varStatus="status"><span data-path="${row}"> ${row}번 </span><c:if test = "${!status.last}">,</c:if></c:forEach></div>
</section>
<section class="testList wrongList">
  <div class="header">내가 못 푼 문제</div>
  <div class="list"><c:forEach var="row" items="${wrongList }" varStatus="status"> <span  data-path="${row}"> ${row}번 </span><c:if test = "${!status.last}">,</c:if></c:forEach></div>
</section>
<%--
1~1000 : 객/주관식
1000~ 알고리즘문제
--%>
<style type="text/css">
.testList {
  overflow: hidden;
  box-sizing: border-box;
  min-height:35px;
  border:1px #ccc solid;
  border-radius: 7px;
  margin:10px 0;
}
.header {    width: 120px;text-align: center;    color: white;background-color:#687abe;}
.header, .list {  min-height:35px;display: table-cell; line-height: 35px;font-size: 0.9em;}
.list {padding-left: 15px;}
.my_rank h3 {
  font-size: 1.7em;
  font-weight: bold;
  text-align: left;
  margin: 10px;
  padding-top: 30px;
}
  .my_rank {width:100%; height:160px;}
  .my_rank .profile_img { width: 150px; height:150px; border-radius: 50%; margin-right:20px;}
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
    width:100%;
    height:35px;
    overflow: hidden;
    margin: 0 auto;
  }
  .course_progress_bar {
    width:0;
    height:35px;
    background: linear-gradient(170deg, #0fb8ad 0%, #1fc8db 51%, #2cb5e8 75%);
    float: left;
    transition: all 0.5s ease 0s;
    color: white;
    font-size: 0.9em;
    line-height: 35px;
    text-align:center;
    text-shadow: 0px 0px 2px #000000;
  }
</style>
<script type="text/text/javascript">
  var myId = '${answerResult.member.userId}'
  var myRank = ${myRanking}
  var submitCnt = ${answerResult.myCntSubmit}
  var rightCnt = ${answerResult.myCntRight}
  var wrongCnt = ${answerResult.myCntWrong}
  var errCnt = ${answerResult.myCntError}
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