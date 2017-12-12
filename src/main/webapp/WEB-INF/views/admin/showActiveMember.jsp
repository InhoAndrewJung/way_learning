<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp" %> 
<title>Insert title here</title>
</head>

<style>
#profile {
	width: 50px;
	height: 50px;
	border-radius: 50%
}

#activity{font-size: 10px;}
a{text-decoration:none}
</style>

<script>
	function check(userId, role) {
		if (role == 'ROLE_AUTHOR') {
			//alert(role)
			if (confirm("해당 강사를 일반멤버로 변경 하시겠습니까?")) {
				$.ajax({
					type : "post",
					url : "${path}/admin/changeAuthority",
					data : "${_csrf.parameterName}=${_csrf.token}&userId="+ userId + "&role=" + role,
					success : function(result) {
						console.log(result);
						if (result == '1') {
							alert("회원 자격이 변경되었습니다.");
						} else {
							alert("회원 자격 변경에 실패했습니다.");
						}
						showActiveMember();
					}
				});
			}
		} else {
			//alert(role)
			if (confirm("해당 멤버를 강사 자격으로 등업시키겠습니까?")) {
				$.ajax({
					type : "post",
					url : "${path}/admin/changeAuthority",
					data : "${_csrf.parameterName}=${_csrf.token}&userId="+ userId + "&role=" + role,
					success : function(result) {
						console.log(result);
						if (result == '1') {
							alert("회원 자격이 변경되었습니다.");
						} else {
							alert("회원 자격 변경에 실패했습니다.");
						}
						showActiveMember();
					}
				});
			}
		}
	}
</script>


<body>
활동점수 200점이상 멤버:<br><br><br><br><br><br><br>
<c:forEach var="row" items="${list }">
<c:if test="${row.ROLE =='ROLE_AUTHOR'}">1) 200점이상이면서 강사:<img id="profile" src="${path}/resources/upload/${row.IMG_PROFILE}" alt="이미지" /> <a href="#" onclick="check('${row.USER_ID}','${row.ROLE}')">${row.USER_ID}</a> <span id="activity"> ${row.ACTIVITY} </span></c:if>


</c:forEach>
<br><br><br><br>

<c:forEach var="row" items="${list }">

<c:if test="${row.ROLE =='ROLE_MEMBER'}">2) 200점이면서 일반 멤버:<img id="profile" src="${path}/resources/upload/${row.IMG_PROFILE}" alt="이미지" /> <a href="#" onclick="check('${row.USER_ID}','${row.ROLE}')">${row.USER_ID}</a> <span id="activity"> ${row.ACTIVITY} </span></c:if>

</c:forEach>
</body>
</html>