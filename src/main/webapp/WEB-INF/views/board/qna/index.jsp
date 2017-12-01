	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/index.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> <!--  nav bar 애니메이션 -->

<script type="text/javascript">
var lastScrollTop = 0; 
var delta = 5; // 동작의 구현이 시작되는 위치 
var navbarHeight = $('ul').outerHeight(); // 영향을 받을 요소를 선택

var didScroll; // 스크롤시에 사용자가 스크롤했다는 것을 알림 

$(window).scroll(function(event){
	
	didScroll = true;
	
});

//hasScrolled()를 실행하고 didScroll 상태를 재설정 
setInterval(function() { 
	if (didScroll) { 
		hasScrolled(); didScroll = false; 
		} 
}, 250);

function hasScrolled() { // 동작을 구현 
	
	// 접근하기 쉽게 현재 스크롤의 위치를 저장한다. 
	var st = $(this).scrollTop();

	
	// 설정한 delta 값보다 더 스크롤되었는지를 확인한다. 
	if (Math.abs(lastScrollTop-st) <= delta)
		return; 

	// 헤더의 높이보다 더 스크롤되었는지 확인하고 스크롤의 방향이 위인지 아래인지를 확인한다.
	// If current position > last position AND scrolled past navbar...
	if (st > lastScrollTop && st > navbarHeight){ 
		// Scroll Down 
		$('ul').removeClass('nav-down').addClass('nav-up'); 
		} else { 
			// Scroll Up 
			// If did not scroll past the document (possible on mac)... 
			if(st + $(window).height() < $(document).height()) {
				$('ul').removeClass('nav-up').addClass('nav-down'); 
			} 
		  } 
	// lastScrollTop 에 현재 스크롤위치를 지정한다. 
	lastScrollTop = st;
	
}


</script>


</head>




<body>

	<ul class="nav-down">
		<li><a class="active" href="#home" id="li1">소 개</a></li>
		<li><a href="#news" id="li2">News</a></li>
		<li><a href="#contact" id="li3">Contact</a></li>
		<li><a href="#about" id="li4">About</a></li>
		
	</ul>


<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>

<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>
<p>Some text some text some text some text..</p>

</body>
</html>