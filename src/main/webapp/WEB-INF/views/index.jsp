<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>LectureList</title>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<sec:authentication var="mvo" property="principal" />
<script src= "http://code.jquery.com/jquery-3.1.0.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/css_kei.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/lesson.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/loader.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/loop.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/modal.css">

  <script type="text/javascript">
  function navSet(){
    document.getElementById('nav').classList.toggle('nav_init')
    document.getElementById('loader').classList.toggle('loader_init')
    document.getElementById('nav_line').classList.toggle('nav_line_init')
    document.getElementById('top_block').classList.toggle('top_block_init')
    var list = document.getElementsByClassName('nav_item')
    for(var i=list.length-1;i>=0;i--){
       setTimeoutForNavSet(list[i], i)
       list[i].addEventListener("click", subnav);
    }
    document.getElementById('nav_line_2').classList.toggle('nav_line_2_init')
    document.getElementById('nav_profile').classList.toggle('nav_profile_init')

		var courses = document.getElementById('courses').children
    for(var i=courses.length-1;i>=0;i--){
     	 setTimeoutForCourseSet(courses[i], i)
       courses[i].addEventListener("mouseover", coursesMouseOver);
    }

    setTimeout(function(){
      document.getElementById('loader_box').style.display = "none"
      document.body.classList.remove('scroll-lock')
    },1500)
  }
  function setTimeoutForNavSet(i, idx) {
    setTimeout(function() {
      i.classList.toggle('nav_item_init')
    }, 100*idx)
  }
	function setTimeoutForCourseSet(i, idx) {
		setTimeout(function() {
			i.classList.toggle('course_init')
		}, 100*idx)
	}
	function coursesMouseOver(event) {

	}
	function subnav() {
		closeSubnav()
		var targetName = event.target.dataset.snTarget
		var rect = event.target.getBoundingClientRect();
		var submenu = document.querySelector('[data-sn-name='+targetName+']')
		if(submenu.dataset.snName=='mypage') {
			$('#profile_img').hide()
			$('#profile_info').hide()
		}
		submenu.classList.toggle('sn-open')
	}
	function closeSubnav() {
		$('[data-sn-name]').each(function(idx, item){
			item.classList.remove('sn-open')
			if(item.dataset.snName=='mypage'){
				$('#profile_img').show()
				$('#profile_info').show()
			}
		})
	}


  window.onscroll = function() {navControll()};

  function navControll() {
		if (document.body.scrollTop > 72 || document.documentElement.scrollTop > 72) {
			document.getElementById("nav_bg").classList.add("nav_bg_scroll")
			document.getElementById("nav_logo").classList.add("nav_logo_scroll")
			document.getElementById("profile_info").classList.add("color-white")
			navItemScrollOn();
		} else {
			document.getElementById("nav_bg").classList.remove("nav_bg_scroll")
			document.getElementById("nav_logo").classList.remove("nav_logo_scroll")
			document.getElementById("profile_info").classList.remove("color-white")
			navItemScrollOff();
		}
  }
  function navItemScrollOn(){
    var list = document.getElementsByClassName('nav_item')
    for(var i=list.length-1;i>=0;i--){
       list[i].classList.add("nav_item_scroll")
    }
  }
  function navItemScrollOff(){
    var list = document.getElementsByClassName('nav_item')
    for(var i=list.length-1;i>=0;i--){
       list[i].classList.remove("nav_item_scroll")
    }
  }


  function mb_quiz(selectId){
    var result = document.getElementById('mb_quiz_result')
    var emoji = document.getElementById('loop_flip')
    if(selectId == "test4") {
      result.classList.add('mb_quiz_right')
      emoji.style.backgroundImage="url(${path}/resources/img/mb_quiz_emoji_1.png)"
      setTimeout(function() {
        toggleModal('modal_quiz')
        result.classList.remove('mb_quiz_right')
      },1000)

    } else {
      result.classList.add('mb_quiz_wrong')
      emoji.style.backgroundImage="url(${path}/resources/img/mb_quiz_emoji_0.png)"
      setTimeout(function() {
        result.classList.remove('mb_quiz_wrong')
      },1000)
    }
  }
  function scrollToTop() {
    if (document.body.scrollTop !== 0 || document.documentElement.scrollTop !== 0) {
        window.scrollBy(0, -100);
        requestAnimationFrame(scrollToTop);
    }
  }
  function toggleModal(modalId){
    document.getElementById(modalId).classList.toggle('modal_back_on')
    document.body.classList.toggle('scroll-lock')
  }
  function showDialog() {
    document.getElementById('mb_apply_dialog').classList.toggle('mb_apply_dialog_view')
  }
	function logout() {
		document.getElementById("logoutFrm").submit();
	}
	function home() {
		location.href="${path}/"
	}
	function board(board){
		event.stopPropagation()
		location.href="${path}/board/"+board+"/list"
	}
	function course(){
		event.stopPropagation()
		var courseNo = event.target.dataset.courseNo
		if(courseNo == 'new') location.href="${path}/course/writeCourse"
		else if(courseNo == 'my') location.href="${path}/course/showMyCourseList"
		else location.href="${path}/lectureBoard/showLectureList?courseNo="+courseNo
	}
	function quiz(quiz){
		event.stopPropagation()
		if(quiz=='essay') location.href="${path}/question/essay/getList"
		else location.href="${path}/question/general/getList?sorting="+quiz
	}
  </script>
  </head>
  <body>
  <div class="loader_box" id="loader_box">
    <div class="loader" id="loader"></div>
  </div>
  <nav id="nav">
    <div id="subnav_btn" onclick="openSubnav()">OPEN</div>
    <div class="nav_bg" id="nav_bg"></div>
    <div id="nav_logo" class="nav_logo" onclick="home()">
    </div>
    <ul id="nav_ul">
      <li class="nav_item" data-sn-target="course">
				COURSE
				<section class="subnav_item" data-sn-name="course">
			    <div class="si_course" id="si_course"></div>
					<script type="text/javascript">
						$(document).ready(function() {
							$.ajax({
								type: "post",
								url: "${pageContext.request.contextPath}/course/selectAccetpedCourseList",
								data:"${_csrf.parameterName}=${_csrf.token}",
								success: function(result){
									var list = result.list
									for(var i=0;i<list.length;i++){
										console.log(list[i])
										makeCourseCard(list[i])
										var target = document.getElementById('si_course')
										var article = document.createElement('article')
									<sec:authorize access="isAuthenticated()">
										var myId = "${mvo.userId}"
										var teacherId = list[i].member.userId
										if(myId == teacherId){
											var addBtn = document.createElement('SPAN')
											addBtn.addEventListener('click', newLecture)
											addBtn.innerText = '강좌 추가'
											addBtn.className = 'new-lecture-btn'
											addBtn.dataset.courseNo = list[i].courseNo
											article.appendChild(addBtn)
											function newLecture(){
												event.stopPropagation()
												location.href="${path}/lectureBoard/writeLecture?cno="+event.target.dataset.courseNo
											}
										}
										</sec:authorize>
										article.dataset.courseNo = list[i].courseNo
										article.addEventListener('click', course)
											 var h4 = document.createElement('h4')
											 h4.dataset.courseNo = list[i].courseNo
											 h4.appendChild(document.createTextNode(list[i].courseName))
											 var p = document.createElement('p')
											 p.dataset.courseNo = list[i].courseNo
											 p.appendChild(document.createTextNode(list[i].description))
										article.appendChild(h4)
										article.appendChild(p)
										target.appendChild(article)
									}
									//관리자와 강사만 코스추가 가능하게 변경함
								<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_AUTHOR')">
									var target = document.getElementById('si_course')
									var courseMgnArticle = document.createElement('article')
 									courseMgnArticle.dataset.courseNo = 'my'
 									courseMgnArticle.className ='my-course-article'
 									courseMgnArticle.addEventListener('click', course)
 										 var h32 = document.createElement('h3')
 										 h32.dataset.courseNo = 'my'
 										 h32.appendChild(document.createTextNode("내 코스 관리"))
 									courseMgnArticle.appendChild(h32)
 									target.appendChild(courseMgnArticle)

									var article = document.createElement('article')
									article.dataset.courseNo = 'new'
									article.className ='new-course-article'
									article.addEventListener('click', course)
										 var h3 = document.createElement('h3')
										 h3.dataset.courseNo = 'new'
										 h3.appendChild(document.createTextNode("새로운 코스 등록하기"))
									article.appendChild(h3)
									target.appendChild(article)
									</sec:authorize>
								}
							});
						});
					</script>
			  </section>
			</li>
      <li class="nav_item" data-sn-target="test">
				TEST
				<section class="subnav_item" data-sn-name="test">
					<article onclick="quiz('multiple')"><h3>객관식</h3></article>
					<article onclick="quiz('short')"><h3>주관식</h3></article>
					<article onclick="quiz('essay')"><h3>알고리즘</h3></article>
				</section>
			</li>
      <li class="nav_item" data-sn-target="board">
				BOARD
				<section class="subnav_item" data-sn-name="board">
					<article onclick="board('tech')"><h3>TECH</h3></article>
					<article onclick="board('qna')"><h3>QnA</h3></article>
				</section>
			</li>
    </ul>
		<sec:authorize access="isAnonymous()">
			<div id="nav_profile" class="nav_profile" onclick="subnav()" data-sn-target="mypage">
				<span id="profile_img" data-sn-target="mypage" class="profile_img" style="background:url(${path}/resources/img/man.png);background-size:100%;background-color:white;"></span>
				<span id="profile_info" data-sn-target="mypage" class="profile_info">
					login
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<div id="nav_profile" class="nav_profile" onclick="subnav()" data-sn-target="mypage">
				<span id="profile_img" data-sn-target="mypage" class="profile_img" style="background:url(${path}/resources/upload/${mvo.imgProfile});background-size:100%;background-color:white;"></span>
				<span id="profile_info" data-sn-target="mypage" class="profile_info">
					${mvo.userId}
		</sec:authorize>
				</span>
				<section class="subnav_item si_profile" data-sn-name="mypage">
					<div>
						<sec:authorize access="isAnonymous()">
							<img src="${path}/resources/img/man.png" />
							<h3>LOGIN</h3>
							<span class="si_btn si_btn_mp" onclick="login()">LOGIN</span>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<img src="${path}/resources/upload/${mvo.imgProfile}" />
							<h3>${mvo.userId}</h3>
							<span class="si_btn si_btn_mp" onclick="mypage()">MY PAGE</span>
							<span class="si_btn si_btn_so" onclick="logout()">SIGN OUT</span>
						</sec:authorize>
						<form id="logoutFrm" action="${path}/member/logout" method="post" style:"display:none">
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						</form>
						<script type="text/javascript">
							function logout() {
								document.getElementById("logoutFrm").submit();
							}
							function mypage() {
								location.href = "${pageContext.request.contextPath}/member/myPage"
							}
							function login() {
									location.href = "${pageContext.request.contextPath}/member/loginForm"
							}
							$(document).ready(function() {
								document.body.scrollTop = document.documentElement.scrollTop = 0
								document.body.classList.add('scroll-lock')
								setTimeout(function(){navSet()}, 700)
							});
						</script>
					</div>
				</section>
			</div>
  </nav>
  <section id="root_container">
  <section id="top_block" class="top_block" style="background-image:url('https://cdn-images-1.medium.com/max/2000/1*LZZ9Sr4XL7j2-LjSJ5uq9Q.jpeg');"></section>
  <hr id="nav_line" class="nav_line" />
  <hr id="nav_line_2" class="nav_line_2" />


	<section class="main_block">
    <ul class="courses" id="courses">
    <!-- 강사와 관리자만 강의 등록가능함 -->
   <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_AUTHOR')">
      <li class="course new_course" onclick="course()" data-course-no="new">
        <div class="course_img" data-course-no="new"></div>
        <h3 data-course-no="new">내 코스 등록하기</h3>
        <hr data-course-no="new" />
        <p data-course-no="new" class="course_desc" style="line-height:80px;font-size:1em">
          자신의 코스를 등록해보세요!
        </p>
      </li>
      </sec:authorize>
			<script type="text/javascript">
				function makeCourseCard(courseObj) {
					var target=document.getElementById('courses')
					var li = document.createElement('LI')
					li.className = "course course_nor"
						var courseImg = document.createElement('DIV')
						courseImg.className = "course_img"
						courseImg.setAttribute('style', 'background-image:url(${path}/resources/upload/'+courseObj.courseImage+')')
						courseImg.dataset.courseNo = courseObj.courseNo
						var title = document.createElement('H3')
						title.appendChild(document.createTextNode(courseObj.courseName))
						title.dataset.courseNo = courseObj.courseNo
						var hr = document.createElement('hr')
						hr.dataset.courseNo = courseObj.courseNo
						var p = document.createElement('p')
						p.dataset.courseNo = courseObj.courseNo
						p.className = "course_desc"
						p.appendChild(document.createTextNode(courseObj.description))
					li.dataset.courseNo = courseObj.courseNo
					li.addEventListener('click', course)
					li.appendChild(courseImg)
					li.appendChild(title)
					li.appendChild(hr)
					li.appendChild(p)

					target.appendChild(li)
				}
			</script>
    </ul>
  </section>
  <section class="main_block mb_apply">
    <h1>in is there anyone</h1>
    <p>ystem, and expound the actual teachings of the great explorer
       of the truth, the master-builder of human happiness. No one rejects,
      dislikes, or avoids pleasure itself, because it is pleasure, but because
      those who do not know how to pursue pleasure rationally encounter
      consequen</p>
      <input type="button" value="→ 수강신청" onclick="showDialog()"/>
      <div class="loop_square loop_green loop_square_60s" style="width:1200px; height:1200px; left:-1000px;top:-1000px;"></div>
      <div class="loop_square loop_blue loop_square_40s" style="width:1200px; height:1200px; left:-1400px;top:-1500px;z-index:1;"></div>
      <div class="mb_apply_dialog" id="mb_apply_dialog" onclick="showDialog()"><div></div></div>
  </section>

  <section class="main_block mb_quiz">
    <div class="mb_quiz_content">
      <h1>WHO IS THE WINNER?</h1>
      <p>
        <input type="radio" id="test1" name="radio-group" onchange="mb_quiz(this.id)">
        <label for="test1">Apple</label>
      </p>
      <p>
        <input type="radio" id="test2" name="radio-group" onchange="mb_quiz(this.id)">
        <label for="test2">SAMSUNG</label>
      </p>
      <p>
        <input type="radio" id="test3" name="radio-group" onchange="mb_quiz(this.id)">
        <label for="test3">TOYOYA</label>
      </p>
      <p>
        <input type="radio" id="test4" name="radio-group" onchange="mb_quiz(this.id)">
        <label for="test4">BLACKBERRY</label>
      </p>
    </div>
    <div class="mb_quiz_result" id="mb_quiz_result"></div>
    <div class="loop_flip loop_green" id="loop_flip" style="width:350px; height:350px; left:50%;top:5%;margin-left:-500px;"></div>
  <div class="loop_circle loop_green loop_circle_10s" style="width:100px; height:100px; left:50%;top:25%;"></div>
  <div class="loop_circle loop_blue loop_circle_8s" style="width:160px; height:160px; left:47%;top:28%;z-index:1;"></div>
  <div class="loop_circle loop_blue loop_circle_10s" id="loop_circle_bg" style="width:300px; height:300px; left:60%;top:-50%;z-index:1;"></div>

  </section>
  <section class="main_block mb_movie">
    <iframe width="100%" height="100%" src="http://www.youtube.com/embed/RF5_MPSNAtU?showinfo=0&fs=0&rel=0" frameborder="0" allowfullscreen></iframe>
  </section>



<form id="logoutFrm" action="${path}/member/logout" method="post" style:"display:none">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
</form>
<!-- MODAL -->
<section id="modal_quiz" class="modal_back">
  <section class="modal_card">
    <span onclick="toggleModal('modal_quiz')">&#x2717;</span>
    <h1><img src="${path}/resources/img/confetti.png" />Wow! GREAT!</h1>
    <p>AETAETASFASD~~~!@!~@!~@!~@SDFASFSEFQ#RSEFSDFSD</p>
    <h3>How about this Course?</h3>
    <iframe width="40%" height="200" src="https://www.youtube.com/embed/BkRZfxznaOo" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
    <article class="modal_quiz_desc">
      <h2>Spring MVC 박살내기</h2>
      <p>blah blah </p>
    </article>
    <div class="btn_apply">COURSE APPLY</div>
  </section>
</section>

	<%@ include file="include/footer.jsp"%>
