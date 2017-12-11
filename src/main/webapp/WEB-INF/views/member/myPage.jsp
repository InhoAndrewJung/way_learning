<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/common.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/member/myPage.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script>
showContent('showMyRecord');

function showContent(page){
	//alert(page);
$.ajax({
		
		type: "post",
		url: "${path}/member/"+page,
		data:"${_csrf.parameterName}=${_csrf.token}",
		success: function(result){
			
			
			
			
			$("#showContent").html(result);
			
		}
		
	});
	
	
	
}

</script>
<title>Insert title here</title>

</head>
<body>

	<div id="wrap">
		<ul>
			<li id="left">
				<ul>
					<li> <span class="leftMenu"onclick="showContent('showMyRecord')" ">내가 푼 문제 기록</span></li>
					<li> <span class="leftMenu" onclick="showContent('showAllRanking')">전체 랭킹보기</span></li>
					<li> <span class="leftMenu" onclick="showContent('myFavoriteList')">내 좋아요 목록 링크</span></li>
					<li> <span class="leftMenu" onclick="showContent('showMyLectureRecord')">나의 강의 기록 보기</span> </li>
					<li><span class="leftMenu" onclick="showContent('updateForm')">정보 수정 폼</span></li>
					<li><span class="leftMenu" onclick="showContent('deleteForm')">회원 탈퇴</span></li>
				</ul>
			</li>
			<li id="right"> 
				<ul><div id="showContent"></div></ul>
			</li>
		</ul>
	</div>

</body>
</html>
