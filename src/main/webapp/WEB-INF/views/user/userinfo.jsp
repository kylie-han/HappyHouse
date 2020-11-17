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
	function modify() {
		var pwd = document.getElementById("muserpwd").value;
		var email = document.getElementById("memail").value;
		var en = /[a-z]/i;
		var no = /[0-9]/;
		var nNo = /[^0-9]/;
		var em = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if (!en.test(pwd)||!no.test(pwd)||pwd.length<6) {
			alert("비밀번호는 영문 숫자 포함 6자리 이상 입니다.");
			return;
		} else if (document.getElementById("mname").value == "") {
			alert("이름을 입력하세요.");
			return; 
		} else if (!em.test(email)) {
			alert("형식에 맞는 이메일을 입력하세요.");
			return; 
		} else if (nNo.test(document.getElementById("mphone").value)) {
			alert("전화번호는 숫자만 입력하세요.");
			return; 
		} else if (document.getElementById("mphone").value == "") {
			alert("전화번호를 입력하세요.");
			return; 
		} else {
			document.getElementById("modifyform").action = "/user/modify";
			document.getElementById("act").value = "modify";
			document.getElementById("modifyform").submit();
		}
	}
	function withdrawal() {
		document.getElementById("modifyform").action = "/user/withdrawal";
		document.getElementById("act").value = "withdrawal";
		document.getElementById("modifyform").submit();
	}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/user/login.jsp" %>
<c:if test="${msg!=null}">
<script>
	alert("${msg}");
</script>
</c:if>
<div>
<div class="text-center">
<strong><a href="${root}/index.jsp">Home</a></strong>
</div>
<div class="container text-center">
	<h1>회원 정보</h1>
	<form id="modifyform" method="post" action="">
	<input type="hidden" name="act" id="act" value=""> 
		<div class="form-group" align="left">
			<label for="name">아이디</label>
			<input type="hidden" class="form-control" id="userid" name="muserid" value="${userinfo.userid}">
			<h4>${userinfo.userid}</h4>
		</div>
		<div class="form-group" align="left">
			<label for="name">비밀번호</label>
			<input type="password" class="form-control" id="muserpwd"
				placeholder="영문 숫자 포함 6자리 이상" name="userpwd" value="${userinfo.userpwd}">
		</div>
		<div class="form-group" align="left">
			<label for="content">이름</label> 
			<input type="text" class="form-control" id="mname"
				placeholder="User Name" name="username" value="${userinfo.username}">
		</div>
		<div class="form-group" align="left">
			<label for="content">이메일</label> 
			<input type="text" class="form-control" id="memail"
				placeholder=""____@__.__"" name="email" value="${userinfo.email}">
		</div>
		<div class="form-group" align="left">
			<label for="content">전화번호</label> 
			<input type="text" class="form-control" id="mphone"
				placeholder="010-xxxx-xxxx" name="phone" value="${userinfo.phone}">
		</div>
		<div align="left">
		<button type="submit" class="btn btn-primary" onclick="javascript:modify();">수정</button>
		<button type="button" class="btn btn-primary" onclick="javascript:withdrawal();">탈퇴</button>
		</div>
	</form>
</div>
</div>

	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>