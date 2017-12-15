<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp"%>

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
						if (result == '1') alert("회원 자격이 변경되었습니다.");
						 else alert("회원 자격 변경에 실패했습니다.");
						
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
					data : "${_csrf.parameterName}=${_csrf.token}&userId="
							+ userId + "&role=" + role,
					success : function(result) {
						console.log(result);
						if (result == '1') alert("회원 자격이 변경되었습니다.");
						 else alert("회원 자격 변경에 실패했습니다.");
						
						showActiveMember();
					}
				});
			}
		}
	}
</script>

<h2 class="mypage_title">활동멤버 선택</h2>
<div class="common-card member-auth-div" id="auth-lc">
	<h3>강사</h3>
	<h4>teacher</h4>
	<c:forEach var="row" items="${list}">
		<c:if test="${row.ROLE =='ROLE_AUTHOR'}">
		<div>
			<img id="profile" src="${path}/resources/upload/${row.IMG_PROFILE}" alt="이미지"  />
			<a href="#" onclick="check('${row.USER_ID}','${row.ROLE}')" data-tooltip="클릭시 회원 등급이 변경됩니다.">
				${row.USER_ID}
			</a>
			<div class="activity">
				<span class="fa fa-graduation-cap"></span>
				${row.ACTIVITY}
			</div>
		</div>
		</c:if>
	</c:forEach>
</div>

<div class="common-card member-auth-div" id="auth-normal">
	<h3>일반 멤버</h3>
	<h4>General Member</h4>
	<c:forEach var="row" items="${list}">
		<c:if test="${row.ROLE =='ROLE_MEMBER'}">
		<div>
			<img id="profile" src="${path}/resources/upload/${row.IMG_PROFILE}" alt="이미지" />
			<a href="#" onclick="check('${row.USER_ID}','${row.ROLE}')"  data-tooltip="클릭시 회원 등급이 변경됩니다." >
				${row.USER_ID}
			</a>
			<div class="activity">
				<span class="fa fa-graduation-cap"></span>
				${row.ACTIVITY}
			</div>
		</div>
		</c:if>
	</c:forEach>
</div>
<script type="text/javascript">
	var lc = document.getElementById('auth-lc')
	if(lc.children.length<3)
		lc.style.display = "none"
	var normal = document.getElementById('auth-normal')
	if(normal.children.length<3)
		normal.style.display = "none"
</script>
