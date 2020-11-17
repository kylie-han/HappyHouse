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

<link href="jumbotron.css" rel="stylesheet">
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<script type="text/javascript">
	function getDealInfo() {
		if (document.getElementById("sword").value == "") {
			if (document.getElementById("skey").value != "all") {
				alert("검색어 입력!!!");
				return;
			}
		}
		document.getElementById("searchform").action = "/house/getDeal";
		document.getElementById("searchform").submit();
	}
</script>
</head>
<body>
	<div class="container">
		<!-- Example row of columns -->
	</div>
	<%@ include file="/WEB-INF/views/user/login.jsp"%>
	<form name="pageform" id="pageform" method="post" action="">
		<input type="hidden" name="pg" id="pg" value=""> <input
			type="hidden" name="key" id="key" value="${key}"> <input
			type="hidden" name="word" id="word" value="${word}">
	</form>



	<div class="south-search-area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="advanced-search-form" align="center">
						<!-- Search Title -->
						<div class="search-title">
							<p>Search for your home</p>
						</div>
						<!-- Search Form -->
						<form action="" method="post" id="searchform">
							<div class="row-5">
								<input type="hidden" name="pg" id="pg" value="1">

								<div class="col-12 col-md-4 col-lg-3">
									<div class="form-group">
										<select class="form-control" name="key" id="skey">
											<option value="all">all</option>
											<option value="apt">아파트별</option>
											<option value="dong">동별</option>
										</select>
									</div>
								</div>
								<div class="col-12 col-md-4 col-lg-3">
									<div class="form-group">
										<input type="text" class="form-control" placeholder="검색어 입력."
											name="word" id="sword"
											onkeydown="javascript:if(event.keyCode == 13) {getDealInfo();}">
									</div>
								</div>
								<!-- Submit -->
								<div class="form-group mb-0">
									<button type="button" class="btn south-btn"
										onclick="javascript:getDealInfo();">검색</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<hr>
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>
