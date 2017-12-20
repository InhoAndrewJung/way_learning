<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp"%>


<h2 class="mypage_title">내가 본 강의 목록</h2>

<style type="text/css">

</style>
<section class="course_list" id="course_list">
</section>
<script type="text/javascript">
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
      article.className = "mycourse common-card"
      var title = document.createElement('h3')
      title.dataset.path = 'lectureBoard/showLectureList?courseNo='+item.courseNo
      title.appendChild(document.createTextNode(item.courseName))
      var courseImage = document.createElement('img')
      courseImage.dataset.path = 'lectureBoard/showLectureList?courseNo='+item.courseNo
      courseImage.setAttribute('src', '${path}/resources/upload/'+item.courseImage)
      var author = document.createElement('span')
      author.appendChild(document.createTextNode(item.author))
      var lectureList = document.createElement('div')
      lectureList.className = 'mycourse-lecture-list';
      for(var i=0; i<lectures.length; i++) {
        if(item.courseNo == lectures[i].courseNo){
          var lectureItem = document.createElement('span');
          lectureItem.dataset.path = 'lectureBoard/showLectureList?courseNo='+item.courseNo+'&lectureNo='+lectures[i].lectureNo
          lectureItem.appendChild(document.createTextNode(lectures[i].lectureOrder+'강'))
          lectureList.appendChild(lectureItem);
        }
      }
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
      article.appendChild(lectureList)
      article.appendChild(progress)
      target.appendChild(article)
   } else {
     course.push(item)
       console.log(course)
   }
   course = courses.get(item.courseName)
    // if(drawed.get(item.courseName)==-1){
    //   drawed.push(item.courseName)
    //     var course = document.createElement('article')
    //     course.appendChild(document.createTextNode(item.courseName+', 총 '+item.cnt+'강'))
    //     course.className = "mycourse"
    //     target.appendChild(course)
    // }
    //console.log(course)
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
