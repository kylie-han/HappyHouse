<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.6">
<title>HappyHouse</title>

<link href="jumbotron.css" rel="stylesheet">
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>


<script type="text/javascript">
	function join() {
		var pwd = document.getElementById("muserpwd").value;
		var pwdcheck = document.getElementById("muserpwdcheck").value;
		var email = document.getElementById("memail").value;
		var en = /[a-z]/i;
		var no = /[0-9]/;
		var nNo = /[^0-9]/;
		var em = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if (document.getElementById("muserid").value == "") {
			alert("아이디를 입력하세요.");
			return;
		} else if (check) {
			alert("아이디 중복확인하세요");
			return;
		} else if (!en.test(pwd) || !no.test(pwd) || pwd.length < 6) {
			alert("비밀번호는 영문 숫자 포함 6자리 이상 입니다.");
			return;
		} else if (pwd != pwdcheck) {
			alert("비밀번호를 다시 확인해주세요");
			return;
		} else if (document.getElementById("mname").value == "") {
			alert("이름을 입력하세요.");
			return;
		} else if (!em.test(email)) {
			alert("형식에 맞는 이메일을 입력하세요.");
			return;
			// 	} else if (nNo.test(document.getElementById("mphone").value)) {
			// 		alert("전화번호는 숫자만 입력하세요.");
			// 		return; 
			// 	} else if (document.getElementById("mphone").value == "") {
			// 		alert("전화번호를 입력하세요.");
			// 		return; 
		} else {
			document.getElementById("writeform").action = "register";
			document.getElementById("writeform").submit();
		}
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/login.jsp"%>
	<div class="container">
		<div class="text-center">
			<strong><a href="/">Home</a></strong>
		</div>
		<div class="container text-center">
			<h1>회원가입</h1>
			<form id="writeform" method="post" action="">
				<input type="hidden" name="act" id="act" value="join">
				<div class="form-group" align="left">
					<label for="name">아이디</label> <input type="text"
						class="form-control" id="muserid" placeholder="" name="userid">
					<button class="btn btn-sm btn-primary"
						onclick="javascript:idcheck()">아이디 중복확인</button>
				</div>
				<div class="form-group" align="left">
					<label for="name">비밀번호</label> <input type="password"
						class="form-control" id="muserpwd" placeholder="영문 숫자 포함 6자리 이상"
						name="userpwd">
				</div>
				<div class="form-group" align="left">
					<label for="name">비밀번호 확인</label> <input type="password"
						class="form-control" id="muserpwdcheck" placeholder="비밀번호 확인"
						name="muserpwdcheck">
				</div>
				<div class="form-group" align="left">
					<label for="content">이름</label> <input type="text"
						class="form-control" id="mname" placeholder="User Name"
						name="username">
				</div>
				<div class="form-group" align="left">
					<label for="content">이메일</label> <input type="text"
						class="form-control" id="memail" placeholder="____@__.__"
						name="email">
				</div>
				<div class="form-group" align="left">
					<label for="content">전화번호</label> <input type="text"
						class="form-control" id="mphone" placeholder="숫자만 입력하세요"
						name="phone">
				</div>
				<div align="left">
					<button type="submit" class="btn btn-primary"
						onclick="javascript:join();">등록</button>
					<button type="reset" class="btn btn-primary">초기화</button>
				</div>
			</form>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>