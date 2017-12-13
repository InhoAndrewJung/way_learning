<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<sec:authentication var="mvo" property="principal" />

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>LectureList</title>
	<script src= "http://code.jquery.com/jquery-3.1.0.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/css_kei.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/lesson.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/loader.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/loop.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/modal.css">

  <script type="text/javascript">
  function navSet(){
    document.getElementById('subnav_blackbox').style.transition = "all 0.2s ease 0.2s"
    document.getElementById('subnav_blackbox').style.opacity = "0"
    document.getElementById('subnav_blackbox').style.display = "none"
    var list = document.getElementsByClassName('nav_item')
    for(var i=list.length-1;i>=0;i--){
       list[i].addEventListener("mouseover", navMouseOver);
    }

    document.getElementById('loader_box').style.display = "none"
    document.body.classList.remove('scroll-lock')
  }


  function navMouseOver() {
    setTimeout(function() {
      openSubnav()
    }, 600)
  }
  function openSubnav() {
    document.body.classList.add('scroll-lock')
    document.getElementById('subnav_box').classList.add('subnav_box_open')
    document.getElementById('subnav_blackbox').style.display = "block"
    document.getElementById('subnav_blackbox').style.opacity = "0.7"
    blurRtCont("add")
  }
  function closeSubnav(event, flag) {
    if(event.clientY>=document.getElementById('subnav_box').offsetHeight || flag == true) {
      document.getElementById('subnav_box').classList.remove('subnav_box_open')
      document.getElementById('subnav_blackbox').style.opacity = "0"
      document.body.classList.remove('scroll-lock')

      setTimeout(function() {
        document.getElementById('subnav_blackbox').style.display = "none"
        blurRtCont("remove")
      },400)
    }
  }

  function blurRtCont(command) {
    if(command==="add")
      document.getElementById('root_container').classList.add('blur-5px')
      else document.getElementById('root_container').classList.remove('blur-5px')
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

  </script>
  </head>
  <body>
  <div class="loader_box" id="loader_box">
    <div class="loader loader_init" id="loader" ></div>
  </div>
  <nav id="nav" class="nav_init">
    <div id="subnav_btn" onclick="openSubnav()">OPEN</div>
    <div class="nav_bg" id="nav_bg"></div>
    <div id="nav_logo" class="nav_logo" onclick="home()">
    </div>
    <ul id="nav_ul">
      <a href="${pageContext.request.contextPath}/course/showMyCourseList"><li class="nav_item nav_item_init">COURSE</li></a>
      <a href="${pageContext.request.contextPath}/question/general/getList"><li class="nav_item nav_item_init">TEST</li></a>
      <a href="${pageContext.request.contextPath}/board/tech/list"><li class="nav_item nav_item_init">BOARD</li></a>
    </ul>
		<sec:authorize access="isAnonymous()">
			<div id="nav_profile" class="nav_profile nav_profile_init">
				<span id="profile_img" class="profile_img" style="background:url(${path}/resources/img/man.png);background-size:100%;background-color:white;"></span>
				<span id="profile_info" class="profile_info">
					login
				</span>
			</div>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<div id="nav_profile" class="nav_profile nav_profile_init">
				<span id="profile_img" class="profile_img" style="background:url(${path}/resources/upload/${mvo.imgProfile});background-size:100%;background-color:white;"></span>
				<span id="profile_info" class="profile_info">
					${mvo.userId}
				</span>
			</div>
		</sec:authorize>

  </nav>
  <div id="subnav_box" class="subnav_box" onmouseout="closeSubnav(event)">
  <div><img src="${path}/resources/img/logo_white.png" style="width:100px;"/></div>

  <section class="subnav_item">
    <h3>COURSES</h3>
    <div class="si_course" id="si_course">
    </div>
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
								 var h4 = document.createElement('h4')
								 h4.appendChild(document.createTextNode(list[i].courseName))
								 var p = document.createElement('p')
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
  <section class="subnav_item"><h3>TEST</h3></section>
  <section class="subnav_item"><h3>BOARD</h3></section>
  <section class="subnav_item si_profile">
    <div>
			<sec:authorize access="isAnonymous()">
				<img src="${path}/resources/img/man.png" />
				<h3>LOGIN</h3>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<img src="${path}/resources/upload/${mvo.imgProfile}" />
				<h3>${mvo.userId}</h3>
			</sec:authorize>
      <span class="si_btn si_btn_mp" onclick="mypage()">MY PAGE</span>
      <span class="si_btn si_btn_so" onclick="logout()">SIGN OUT</span>
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
        $(document).ready(function() {
          document.body.scrollTop = document.documentElement.scrollTop = 0
          document.body.classList.add('scroll-lock')
          navSet()
        });
      </script>
    </div>
  </section>

  <div class="subnav_box_bottom"><span onclick="closeSubnav(event, true)">CLOSE</span></div>
  </div>
  <div id="subnav_blackbox" class="subnav_blackbox"></div>

  <section id="root_container">
  <section id="top_block" class="top_block top_block_init" style="height:200px;background-image:url('https://cdn-images-1.medium.com/max/2000/1*LZZ9Sr4XL7j2-LjSJ5uq9Q.jpeg');"></section>
  <hr id="nav_line" class="nav_line nav_line_init" />
