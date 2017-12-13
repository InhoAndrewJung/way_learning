<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp"%>


<h2 class="mypage_title">내가 본 강의 목록</h2>

<style type="text/css">
  .course_list {
  }
  .mycourse {
    border: 1px #ccc solid;
    border-radius: 15px;
    position: relative;
    margin:20px 0;
    box-shadow: 1px 1px 3px rgba(0,0,0,0.3);
    overflow: hidden;
    transition: all 0.2s ease 0s;
    text-align: center;
  }
  .mycourse:hover { transform:scale(1.02, 1.02);}
  /*.mycourse:before {
    content: "";
    position: absolute;
    display: block;
    width: 100%;
    height: 100%;
    background-color: white;
    transition: all 0.1s ease 0s;
    z-index: -1;
  }
  .mycourse:hover:before {
    background-color:#fcf4ff;
  }*/
  .mycourse img {
    float: left;
    width: 70px;
    margin: 10px 50px;
    cursor: pointer;
  }
  .mycourse h3 {
    font-size: 1.7em;
    font-weight: bold;
    text-align: left;
    margin: 10px;
    cursor: pointer;
  }
  .mycourse>span {
    text-align: left;
    display:block;
    color:#666;
    font-size:0.8em;
    margin-bottom:25px;
  }

  .course_progress {
    position:relative;
    margin:10px 0;
  }
  .course_progress>span {
    position: absolute;
    left: 0;
    top: 0;
    color: white;
    font-size: 0.7em;
    width: 100%;
    line-height: 22px;
    text-shadow: 0px 0px 2px #000000;
  }
  .course_progress section{
    width:90%;
    border:1px #999 solid;
    border-radius:20px;
    height:20px;
    overflow: hidden;
    margin: 0 auto;
  }
  .course_progress_bar {
    width:0;
    height:20px;
    background: linear-gradient(170deg, #0fb8ad 0%, #1fc8db 51%, #2cb5e8 75%);
    float: left;
    border-radius: 9px;
    transition: all 0.5s ease 0s;
  }
</style>
<section class="course_list" id="course_list">
</section>
<script type="text/javascript">
  // var lectures = new Map()
  var lectures = []
  var courses = new Map()
  <c:forEach var="list" items="${lectureList}">
    lectures.push({courseName:"${list.COURSE_NAME}", progress:${list.PROGRESS}, courseNo:${list.COURSE_NO}, cnt:${list.CNT_COURSE}
                    , author:"${list.AUTHOR}", lectureNo:${list.LECTURE_NO}, lectureOrder:${list.LECTURE_ORDER}, lectureName:"${list.LECTURE_NAME}"
                    , courseImage:"${list.COURSE_IMAGE}"})
  </c:forEach>
  var target = document.getElementById('course_list')
  lectures.forEach(drawCourse)

  function drawCourse(item, idx){
    var course = courses.get(item.courseName)
    if(typeof course == 'undefined'){
      courses.set(item.courseName, [item])
      var article = document.createElement('article')
      article.className = "mycourse"
      var title = document.createElement('h3')
      title.dataset.path = 'lectureBoard/showLectureList?courseNo='+item.courseNo
      title.appendChild(document.createTextNode(item.courseName))
      var courseImage = document.createElement('img')
      courseImage.dataset.path = 'lectureBoard/showLectureList?courseNo='+item.courseNo
      courseImage.setAttribute('src', '${path}/resources/upload/'+item.courseImage)
      var author = document.createElement('span')
      author.appendChild(document.createTextNode(item.author))
      var progress = document.createElement('div')
      progress.className = 'course_progress'
      var progressGraphBox = document.createElement('section')
      var progressGraph = document.createElement('div')
      progressGraph.dataset.courseProgress = item.progress
      progressGraph.className = 'course_progress_bar'
      var progressValue = document.createElement('span')
      progressValue.appendChild(document.createTextNode(item.progress+'% / 총 '+item.cnt+'강'))
      progressGraphBox.appendChild(progressGraph)
      progressGraphBox.appendChild(progressValue)

      progress.appendChild(progressGraphBox)
      progress.appendChild(progressValue)

      article.appendChild(courseImage)
      article.appendChild(title)
      article.appendChild(author)
      article.appendChild(progress)
      target.appendChild(article)
    } else {
      course.push(item)
    }
    course = courses.get(item.courseName)
    // if(drawed.get(item.courseName)==-1){
    //   drawed.push(item.courseName)
    //     var course = document.createElement('article')
    //     course.appendChild(document.createTextNode(item.courseName+', 총 '+item.cnt+'강'))
    //     course.className = "mycourse"
    //     target.appendChild(course)
    // }
    console.log(course)
  }
  function drawProgress() {
    var courseList = document.querySelectorAll("[data-course-progress]")
    courseList = Array.prototype.slice.call(courseList)
    courseList.forEach(graph)
    function graph(item, idx){
      var progress = item.dataset.courseProgress
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
  eventListenerInit()
</script>
