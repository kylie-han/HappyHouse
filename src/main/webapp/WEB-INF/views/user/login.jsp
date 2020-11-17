<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.6">
<title>HappyHouse</title>

<!-- <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/jumbotron/"> -->

<!-- Bootstrap core CSS -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- <script -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script> -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	
<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/4.4/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/4.4/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="/docs/4.4/assets/img/favicons/safari-pinned-tab.svg"
	color="#563d7c">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon.ico">
<meta name="msapplication-config"
	content="/docs/4.4/assets/img/favicons/browserconfig.xml">
<meta name="theme-color" content="#563d7c">

<!-- Favicon  -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Style CSS -->
<link rel="stylesheet" href="/style.css">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<!-- Custom styles for this template -->
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<c:if test="${cookie.save_id.value ne null}">
	<c:set var="save_id" value="${cookie.save_id.value}" />
	<c:set var="save_btn" value="checked" />
</c:if>

<script type="text/javascript">
	function login() {
		if (document.getElementById("userid").value == "") {
			alert("아이디 입력!!!");
			return;
		} else if (document.getElementById("userpwd").value == "") {
			alert("비밀번호 입력!!!");
			return;
		} else {
			document.getElementById("loginform").action = "/user/login";
			document.getElementById("act").value = "login";
			document.getElementById("loginform").submit();
		}
	}

	function findPwd() {
		document.getElementById("loginform").action = "/user/mvfindpwd";
		document.getElementById("act").value = "mvfindpwd";
		document.getElementById("loginform").submit();
	}

	function moveJoin() {
		document.getElementById("loginform").action = "/user/mvjoin";
		document.getElementById("act").value = "mvjoin";
		document.getElementById("loginform").submit();
	}
</script>
</head>
<body>
	<c:if test="${msg!=null}">
		<script>
			alert("${msg}");
		</script>
	</c:if>
	<header class="header-area">

		<!-- Main Header Area -->
		<div class="main-header-area" id="stickyHeader">
			<div class="classy-nav-container breakpoint-off">
				<!-- Classy Menu -->
				<nav class="classy-navbar justify-content-between" id="southNav">

					<!-- Logo -->
					<a class="nav-brand text-white" href="/">Happy House</a>

					<!-- Menu -->
					<div class="classy-menu">

						<!-- Nav Start -->
						<div class="classynav">
							<ul>
								<li><a href="/">Home</a></li>
								<li><a href="/map">Search Map</a></li>
								<li><a href="/notice">Notice</a></li>
								<li><a href="/api/qna/link">QnA</a></li>
								<c:if test="${userinfo != null}">
								<li><a href="#">관심지역</a>
                                    <ul class="dropdown">
                                        <li><a href="/mvinterest">관심지역 등록</a></li>
                                        <li><a href="/searchInterest/${userinfo.userid}">관심지역 목록</a></li>
                                    </ul>
                                </li>
								</c:if>
							</ul>
							<c:if test="${userinfo == null}">
								<div class="nav-item dropdown btn btn-secondary btn-sm">
									<a class="nav-link dropdown-toggle text-white" href=""
										id="dropdown01" data-toggle="dropdown" aria-haspopup="false"
										aria-expanded="true">Login</a>
									<div class="dropdown-menu dropdown-menu-right"
										aria-labelledby="dropdown01">
										<div class="px-2 py-5" align="center">
											<form id="loginform" method="post" action="">
												<input type="hidden" name="act" id="act" value="">
												<div class="form-group" align="left">
													<label for="">아이디</label> <input type="text"
														class="form-control" id="userid" name="userid"
														placeholder="" value="${save_id}">
												</div>
												<div class="form-group" align="left">
													<label for="">비밀번호</label> <input type="password"
														class="form-control" id="userpwd" name="userpwd"
														placeholder=""
														onkeydown="javascript:if(event.keyCode == 13) {login();}">
												</div>
												<div class="form-group form-check" align="right">
													<label class="form-check-label"> <input
														class="form-check-input" type="checkbox" id="idsave"
														name="idsave" value="saveok" ${save_btn}> 아이디저장
													</label>
												</div>
												<div class="btn-group-vertical" align="center">
													<button type="button" class="btn south-btn"
														onclick="javascript:login();">로그인</button>
													<button type="button" class="btn btn-secondary"
														onclick="javascript:findPwd();">비밀번호 찾기</button>
													<button type="button" class="btn btn-secondary"
														onclick="javascript:moveJoin();">회원가입</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${userinfo != null}">
								<div class="text-right text-white">
									<strong>${userinfo.username}(${userinfo.userid})</strong>님
									환영합니다. <a class="btn btn-secondary btn-sm text-white"
										type="button" href="/user/logout">로그아웃</a> <a
										class="btn btn-secondary btn-sm text-white" type="button"
										href="/user/info">회원정보</a>
								</div>
							</c:if>
						</div>
						<!-- Nav End -->
					</div>
				</nav>
			</div>
		</div>
	</header>

	</div>
	</div>
	<section class="breadcumb-area bg-img"
		style="background-image: url(${pageContext.request.contextPath}/img/bg-img/hero1.jpg);">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12">
					<div class="breadcumb-content">
						<h3 class="breadcumb-title">Happy House</h3>
					</div>
				</div>
			</div>
		</div>
	</section>
	
    <!-- jQuery (Necessary for All JavaScript Plugins) -->
    <script src="${pageContext.request.contextPath}/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath}/js/classy-nav.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
    <!-- Active js -->
    <script src="${pageContext.request.contextPath}/js/active.js"></script>
    <!-- Google Maps -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAwuyLRa1uKNtbgx6xAJVmWy-zADgegA2s"></script>
    <script src="${pageContext.request.contextPath}/js/map-active.js"></script>
	