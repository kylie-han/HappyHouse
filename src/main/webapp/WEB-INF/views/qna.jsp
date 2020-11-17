<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href=${root}/css/chunk-vendors.084c0951.css rel=preload as=style>
<link href=${root}/js/app.1cab002f.js rel=preload as=script>
<link href=${root}/js/chunk-vendors.f67a1f38.js rel=preload as=script>
<link href=${root}/css/chunk-vendors.084c0951.css rel=stylesheet>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/login.jsp" %>
	<noscript>
		<strong>We're sorry but vue-happyhouse doesn't work properly
			without JavaScript enabled. Please enable it to continue.</strong>
	</noscript>
	<div id=app></div>
	<script src=${root}/js/chunk-vendors.f67a1f38.js></script>
	<script src=${root}/js/app.1cab002f.js></script>
	
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>