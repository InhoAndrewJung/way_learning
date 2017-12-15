<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.js"></script>



<script>

function changeAccept(isAccept, courseNo) {
	if (isAccept == '1') {
		if (confirm("승인된 강의를 미승인 상태로 변경하시겠습니까?")) {
					$.ajax({
						type : "post",
						url : "${path}/admin/changeAcceptStatus",
						data : "${_csrf.parameterName}=${_csrf.token}&isAccept=accept&courseNo="
								+ courseNo,
						success : function(result) {
							console.log(result);
							if (result == '1')
								alert("강의 승인여부가 변경되었습니다.");
							else
								alert("강의 승인여부  변경에 실패했습니다.");
							showAllCourse('change');
						}
					});
		}
	} else {
		if (confirm("미승인된 강의를 승인상태로 변경하시겠습니까?")) {
					$.ajax({
						type : "post",
						url : "${path}/admin/changeAcceptStatus",
						data : "${_csrf.parameterName}=${_csrf.token}&isAccept=notAccept&courseNo="
								+ courseNo,
						success : function(result) {
							console.log(result);
							if (result == '1')
								alert("강의 승인여부가 변경되었습니다.");
							else
								alert("강의 승인여부  변경에 실패했습니다.");
							showAllCourse('change');
						}
					});
		}
	}
}
</script>

<style>

.boardTable{
	background: #ffffff;
    margin: 20px auto 70px auto;
    width: 30%;
    border-radius: 3px;
    border: 2px solid #e5e9f2;
    box-shadow: 5px 5px 5px #cccccc;
    border-collapse: collapse;
}

.left_title{
    margin: 16px 10px 0px 15px;
    font-size: 23px;
    text-decoration: none;
}



#changeAccept{
cursor:pointer;border-radius: 50%;

}



#profile{width:50px; height:50px; border-radius: 50% }
a{text-decoration:none; cursor: pointer;}
#tag{font-size:10px;border:1px solid grey;border-radius:10%; background-color:grey; color:white; margin-left:10px;}
</style>



</head>
<body>

<div align="center">

<!-- 비로그인 사용자는 아래 버튼을 보여주지 않는다. -->


 
 


           <c:forEach var="cvo" items="${list}"  varStatus="status" >
			<table class="boardTable">
				
				<tr><td align="center" colspan="2" nowrap><img id="profile" src="${path}/resources/upload/${cvo.courseImage}" width="100"></td></tr>
				<tr ><td class="left_title" nowrap>코 스 명</td> <td nowrap>&nbsp;&nbsp;${cvo.courseName}</td></tr>
				
				<tr><td class="left_title" nowrap>코스설명</td><td nowrap>&nbsp;<a href="${pageContext.request.contextPath}/lectureBoard/showLectureList?courseNo=${cvo.courseNo}"> <span onclick="move()">${cvo.description}</span></td></tr>
				
				<tr><td class="left_title" nowrap>승인여부 </td><td nowrap>&nbsp; <c:if test="${cvo.isAccept =='1'}"> 승인</c:if>  <c:if test="${cvo.isAccept =='0'}"> 미승인</c:if> <input type="button" id="changeAccept"  onclick="changeAccept('${cvo.isAccept}','${cvo.courseNo}')" value="변경" /> </td></tr>
			
			</table>
			</c:forEach>	
	





	 </div>  
</body>
</html>





















