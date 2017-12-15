


<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../../include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no , user-scalable=no">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
	integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
	integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
	crossorigin="anonymous"></script>


<style>
a {
	text-decoration: none;
	color: black;
}

#image_list{
	width: 60px;
	
}

</style>

<title>Home</title>
</head>
<body>
	<div class="container ">
		<div class="row ">
			<div class="col">
				<br /> <br /> <a href="index.jsp"
					style="text-decoration: none; color: black;"><h1>The Coder</h1></a>
			</div>
		</div>
		<div class="dropdown-divider"></div>

		<div class="crow ">
			<br>
			<c:if test="${result == '1'}">
				<div class="alert alert-success" role="alert">
					<strong>맞췄습니다! :)</strong>
				</div>
			</c:if>

			<c:if test="${result !='1'}">
				<div class="alert alert-danger" role="alert">
					<strong>틀렸습니다! 다시 도전해 보세요.</strong>
				</div>
			</c:if>


		</div>
		<div class="form-group"></div>



	</div>
	<div align="center">


		<c:if test="${multipleChoice != null}">
			<a
				href="${path}/question/general/multipleChoiceContent?questionNo=${questionNo}">
				<button type="button" class="btn btn-primary">객관식 문제 다시풀기</button> </a>
		</c:if>
		<c:if test="${shortAnswer !=null}">
			<a
				href="${path}/question/general/shortAnswerContent?questionNo=${questionNo}">
				<button type="button" class="btn btn-primary">주관식 문제 다시풀기</button></a>
		</c:if>


		<a href="${pageContext.request.contextPath}/question/general/getList">
			<img src="${pageContext.request.contextPath}/resources/img/list.png"
			id="image_list">
		</a>
		<!-- 메인으로 이동 -->
		<a href="${path}/"> <img
			src="${pageContext.request.contextPath}/resources/img/house.png"
			id="image_list">
		</a>



	</div>



</body>
</html>

