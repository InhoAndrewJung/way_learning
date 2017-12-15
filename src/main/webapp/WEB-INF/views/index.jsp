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
		location.href="${path}/lectureBoard/showLectureList?courseNo="+courseNo
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
										var target = document.getElementById('si_course')
										var article = document.createElement('article')
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


<style type="text/css">
	a{text-decoration:  none;}
	ul,li{list-style:none;}
</style>
<script src= "http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	function logout() {
		document.getElementById("logoutFrm").submit();
	}
</script>

<script>

</script>



















<h2>Spring Security를 이용한 Register Member</h2>
<sec:authorize access="isAnonymous()">
<ul>
	<li><a href="${path}/member/registerForm">회원 가입 하기</a></li>
	<li><a href="${path}/member/loginForm">로그인 하기</a></li>


</ul>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
	<sec:authentication var="mvo" property="principal" />
	<b>${mvo.userId}님 환영합니다.</b><p>

	<b>${mvo}님 환영합니다.</b><p>

	<!--
		authentication의 getPrincipal().getName() ::
		Principal은 Provider 에서 Authentication에 넣어준 VO(생성자의 첫 매개변수)
	 -->
</sec:authorize>
<p></p>
<!-- 인증됬으면 -->
	<sec:authorize access="isAuthenticated()">
		<!-- 관리자인 경우 -->
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<li><a href="${path}/admin/main">ADMIN Cafe Enterance</a></li>

		</sec:authorize>

		<!--  일반 회원이거나 관리자인 두 경우. 두개 이상의 role을 비교할때 hasAnyRole()-->
		<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MEMBER','ROLE_AUTHOR')">



			<b>마이페이지용</b><br>
			<li><a href="${pageContext.request.contextPath}/member/myPage">마이페이지</a><li>

			<%-- <li><a href="${pageContext.request.contextPath}/member/showMyRecord">내가 푼 문제 기록</a><li>
			<li><a href="${pageContext.request.contextPath}/member/showAllRanking">전체 랭킹보기</a><li>
			<li><a href="${pageContext.request.contextPath}/member/myFavoriteList">내 좋아요 목록 링크</a><li>
			<li><a href="${pageContext.request.contextPath}/member/showMyLectureRecord">  나의 강의 기록 보기 </a><li>
			<li><a href="${path}/member/updateForm">정보 수정 폼</a></li>
			<li><a href="${path}/member/deleteForm">회원 탈퇴</a></li> --%>

			<b>게시판용</b><br>
			<li><a href="${pageContext.request.contextPath}/board/qna/write">qna게시판 글쓰기</a><li>
			<li><a href="${pageContext.request.contextPath}/board/qna/list">qna게시판목록</a><li>
			<li><a href="${pageContext.request.contextPath}/board/tech/write">tech게시글쓰기</a><li>
			<li><a href="${pageContext.request.contextPath}/board/tech/list">tech게시판목록</a><li>


			<b>문제 용</b> <br>
			<li><a href="${pageContext.request.contextPath}/question/general/getList">제너럴 문제 리스트</a><li>
			<li><a href="${pageContext.request.contextPath}/question/general/makeQuestion">제너럴 문제 만들기</a><li>
			<li><a href="${pageContext.request.contextPath}/question/essay/getList">에세이 문제 리스트</a><li>
			<li><a href="${pageContext.request.contextPath}/question/essay/makeQuestion">에세이 만들기</a><li>



			<b>코스용</b><br>
			<li><a href="${pageContext.request.contextPath}/course/writeCourse">코스등록</a><li> <!-- 강사용 -->
			<li><a href="${pageContext.request.contextPath}/course/showMyCourseList">내가 등록한 코스 리스트 </a><li> <!-- 강사용 -->

			<b>강의용</b><br>
			<li><a href="${pageContext.request.contextPath}/lectureBoard/writeLecture">강의등록</a><li> <!-- 강사용 -->
			<li><a href="${pageContext.request.contextPath}/lectureBoard/showLectureList?courseNo=1"> 특정코스의 전체 강의 리스트 </a><li>

		</sec:authorize>
		<li><a href="javascript:logout();">로그아웃</a></li>
	</sec:authorize>
<p>

<!--
1. 로그아웃은 스프링 시큐러티 4부터는 로그아웃시 post 방식으로 이동하며
  /logout url로 요청한다(따로 정의하지 않으면...)
2. _csrf 를 요청 파라미터로 보내야 한다.
-->


<b>승인된 코스 !!!</b>
<div id="acceptedCourse"></div>



<form id="logoutFrm" action="${path}/member/logout" method="post" style:"display:none">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
</form>
</body>
</html>
