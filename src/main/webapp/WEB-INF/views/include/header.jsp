<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@include file="../include/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>LectureList</title>
	<script src= "http://code.jquery.com/jquery-3.1.0.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/css_kei.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/lesson.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/loader.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/loop.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/modal.css">

		<script type="text/javascript">
	  function navSet(){
	    var list = document.getElementsByClassName('nav_item')
	    for(var i=list.length-1;i>=0;i--){
	       list[i].addEventListener("click", subnav);
	    }
      document.getElementById('loader_box').style.display = "none"
      document.body.classList.remove('scroll-lock')
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
	  function scrollToTop() {
	    if (document.body.scrollTop !== 0 || document.documentElement.scrollTop !== 0) {
	        window.scrollBy(0, -100);
	        requestAnimationFrame(scrollToTop);
	    }
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
	  <div class="loader_box loader_init" id="loader_box">
	    <div class="loader" id="loader"></div>
	  </div>
	  <nav id="nav" class="nav_init">
	    <div id="subnav_btn" onclick="openSubnav()">OPEN</div>
	    <div class="nav_bg" id="nav_bg"></div>
	    <div id="nav_logo" class="nav_logo" onclick="home()">
	    </div>
	    <ul id="nav_ul">
	      <li class="nav_item nav_item_init" data-sn-target="course">
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
											 h3.appendChild(document.createTextNode("새 코스 등록"))
										article.appendChild(h3)
										target.appendChild(article)
										</sec:authorize>
									}
								});
							});
						</script>
				  </section>
				</li>
	      <li class="nav_item nav_item_init" data-sn-target="test">
					TEST
					<section class="subnav_item" data-sn-name="test">
						<article onclick="quiz('multipleChoice')"><h3>객관식</h3></article>
						<article onclick="quiz('shortAnswer')"><h3>주관식</h3></article>
						<article onclick="quiz('essay')"><h3>알고리즘</h3></article>
					</section>
				</li>
	      <li class="nav_item nav_item_init" data-sn-target="board">
					BOARD
					<section class="subnav_item" data-sn-name="board">
						<article onclick="board('tech')"><h3>TECH</h3></article>
						<article onclick="board('qna')"><h3>QnA</h3></article>
					</section>
				</li>
	    </ul>
			<sec:authorize access="isAnonymous()">
				<div id="nav_profile" class="nav_profile nav_profile_init" onclick="subnav()" data-sn-target="mypage">
					<span id="profile_img" data-sn-target="mypage" class="profile_img" style="background-image:url(${path}/resources/img/logo.png);"></span>
					<span id="profile_info" data-sn-target="mypage" class="profile_info">
						login
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<div id="nav_profile" class="nav_profile nav_profile_init" onclick="subnav()" data-sn-target="mypage">
					<span id="profile_img" data-sn-target="mypage" class="profile_img" style="background-image:url(${path}/resources/upload/${mvo.imgProfile});"></span>
					<span id="profile_info" data-sn-target="mypage" class="profile_info">
						${mvo.userId}
			</sec:authorize>
					</span>
					<section class="subnav_item si_profile" data-sn-name="mypage">
						<div>
							<sec:authorize access="isAnonymous()">
								<img src="${path}/resources/img/logo.png" />
								<h3>HELLO</h3>
								<span class="si_btn si_btn_login" onclick="login()">LOGIN</span>
								<span class="si_btn si_btn_signup" onclick="signup()">SIGN UP</span>
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
									navSet()
								});
							</script>
						</div>
					</section>
				</div>
	  </nav>

  <section id="root_container">
  <section id="top_block" class="top_block top_block_init" style="height:200px;background-image:url('https://cdn-images-1.medium.com/max/2000/1*LZZ9Sr4XL7j2-LjSJ5uq9Q.jpeg');"></section>
  <hr id="nav_line" class="nav_line nav_line_init" />
