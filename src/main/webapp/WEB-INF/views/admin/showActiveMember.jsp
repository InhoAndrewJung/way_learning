<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp"%>
<title>Insert title here</title>
</head>

<style>

.boardTable{
	background: #ffffff;
    margin: 20px auto 70px auto;
    width: 40%;
    border-radius: 3px;
    border: 2px solid #e5e9f2;
    box-shadow: 5px 5px 5px #cccccc;
    border-collapse: collapse;
}

.left_title{
    margin: 16px 10px 0px 15px;
    font-size: 23px;
    text-decoration: none;
    text-align:center;
}

.right_title{
    padding:10px;
    font-size: 23px;
    text-decoration: none;
}

.activity{
	color: #999999;
    display: inline-block;
    font-size: 15px;
    margin-right: 10px;
}

.fa {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    transform: translate(0, 0);
}

#profile {
	width: 50px;
	height: 50px;
	border-radius: 50%
}

#activity {
	font-size: 10px;
}

a {
	text-decoration: none
}
</style>

<script>
	function check(userId, role) {
		if (role == 'ROLE_AUTHOR') {
			//alert(role)
			if (confirm("해당 강사를 일반멤버로 변경 하시겠습니까?")) {
				$.ajax({
					type : "post",
					url : "${path}/admin/changeAuthority",
					data : "${_csrf.parameterName}=${_csrf.token}&userId="
							+ userId + "&role=" + role,
					success : function(result) {
						console.log(result);
						if (result == '1') {
							alert("회원 자격이 변경되었습니다.");
						} else {
							alert("회원 자격 변경에 실패했습니다.");
						}
						showActiveMember('change');
					}
				});
			}
		} else {
			//alert(role)
			if (confirm("해당 멤버를 강사 자격으로 등업시키겠습니까?")) {
				$.ajax({
					type : "post",
					url : "${path}/admin/changeAuthority",
					data : "${_csrf.parameterName}=${_csrf.token}&userId="
							+ userId + "&role=" + role,
					success : function(result) {
						console.log(result);
						if (result == '1') {
							alert("회원 자격이 변경되었습니다.");
						} else {
							alert("회원 자격 변경에 실패했습니다.");
						}
						showActiveMember('change');
					}
				});
			}
		}
	}
</script>


<body>

	<div align="center">
		활동점수 200점이상 멤버 현황

		<table class="boardTable" border=1px>

			<tr>
				<td class="left_title">강 &nbsp; &nbsp; &nbsp;사</td>
				<td class="right_title"><c:forEach var="row" items="${list}">

						<c:if test="${row.ROLE =='ROLE_AUTHOR'}">
							<a href="#" onclick="check('${row.USER_ID}','${row.ROLE}')"><img id="profile"
								src="${path}/resources/upload/${row.IMG_PROFILE}" alt="이미지" />
							${row.USER_ID}</a>
							<div class="activity">
								
									<span class="fa fa-graduation-cap"></span>
									${bvo.member.activity}
							</div>
						</c:if>


					</c:forEach></td>
			</tr>
			<tr>
				<td class="left_title">일반 멤버</td>
				<td><c:forEach var="row" items="${list}">

						<c:if test="${row.ROLE =='ROLE_MEMBER'}">
							<img id="profile"
								src="${path}/resources/upload/${row.IMG_PROFILE}" alt="이미지" />
							<a href="#" onclick="check('${row.USER_ID}','${row.ROLE}')">${row.USER_ID}</a>
							<div class="activity">
								
									<span class="fa fa-graduation-cap"></span>
									${bvo.member.activity}
							</div>
						</c:if>

					</c:forEach></td>
			</tr>

			<br>
			<br>
			<br>
			<br>


		</table>
	</div>
</body>
</html>