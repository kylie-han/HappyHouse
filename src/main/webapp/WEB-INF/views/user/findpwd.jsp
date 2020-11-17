<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>SSAFY</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
function find() {
	var email = document.getElementById("memail").value;
	var em = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if (document.getElementById("muserid").value == "") {
		alert("아이디를 입력하세요.");
		return;
	} else if (!em.test(email)) {
		alert("형식에 맞는 이메일을 입력하세요.");
		return; 
	} else {
		document.getElementById("modifyform").action = "/user/findpwd";
		document.getElementById("modifyform").submit();
	}
}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/user/login.jsp" %>
<div class="text-center">
<strong><a href="${root}/index.jsp">Home</a></strong>
</div>
<div class="container text-center">
	<h1>비밀번호 찾기</h1>
	<form id="modifyform" method="post" action="">
	<input type="hidden" name="act" id="act" value="find">
		<div class="form-group" align="left">
			<label for="name">아이디</label>
			<input type="text" class="form-control" id="muserid"
				 placeholder="" name="userid" >
		</div>
		<div class="form-group" align="left">
			<label for="content">이메일</label> 
			<input type="text" class="form-control" id="memail"
				placeholder="회원가입시 작성했던 메일" name="email" >
		</div>
		<div align="left">
		<h3>비밀번호를 조회하겠습니까?</h3>
		<button type="submit" class="btn btn-primary" onclick="javascript:find();"> 전송 </button>
		</div>
	</form>
</div>

	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>