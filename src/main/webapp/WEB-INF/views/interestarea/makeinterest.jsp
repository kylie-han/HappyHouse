<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<title>SSAFY</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function makeinterest() {
		if (document.getElementById("sidoName").value == "") {
			alert("시,도명을 입력하세요.");
			return;
		} else if (document.getElementById("gugunName").value == "") {
			alert("구,군명을 입력하세요.");
			return;
		} else if (document.getElementById("dongName").value == "") {
			alert("동이름을 입력하세요.");
			return;
		} else {
			document.getElementById("makeinterestform").action = "${root}/addInterest";
			document.getElementById("makeinterestform").submit();
		}
	}
</script>
</head>

<body>
	<%@ include file="../user/login.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel-heading">
					<div class="row">
						<h2>관심지역 등록</h2>
					</div>
					<hr>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-12">
							<form id="makeinterestform" method="post" action=""
								class="was-validated">
								<input type="hidden" name="action" id="action"
									value="makeinterest">
								<div class="form-group" align="left">
									<label for="userid">아이디</label><span class="text-danger small">*</span>
									<input type="text" class="form-control" id="userid"
											placeholder="${userinfo.userid}" name="userid" readonly
											value="${userinfo.userid}" required>
								</div>
								<div class="form-group" align="left">
									<label for="sidoName">시,도명 </label><span
										class="text-danger small">*</span> <input type="text"
										class="form-control" id="sidoName" placeholder=""
										name="sidoName" required>
								</div>
								<div class="form-group" align="left">
									<label for="gugunName">구,군명</label><span
										class="text-danger small">*</span> <input type="text"
										class="form-control" id="gugunName" placeholder=""
										name="gugunName" required>
								</div>
								<div class="form-group" align="left">
									<label for="dongName">동 명</label><span
										class="text-danger small">*</span> <input type="text"
										class="form-control" id="dongName" placeholder=""
										name="dongName" required>
								</div>
								<div class="form-group" align="center">
									<button type="button" class="btn btn-primary"
										onclick="javascript:makeinterest();">추가하기</button>
									<button type="reset" class="btn btn-danger" onclick="">초기화</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../user/footer.jsp"%>
</body>
</html>

