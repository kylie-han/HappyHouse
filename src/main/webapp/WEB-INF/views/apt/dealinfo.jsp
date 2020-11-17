<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
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
	function pageMove(pg) {
		document.getElementById("pg").value = pg;
		document.getElementById("pageform").action = "/house/getDeal";
		document.getElementById("pageform").submit();
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/login.jsp"%>

	<form name="pageform" id="pageform" method="post" action="">
		<input type="hidden" name="pg" id="pg" value=""> <input
			type="hidden" name="key" id="key" value="${key}"> <input
			type="hidden" name="word" id="word" value="${word}">
	</form>
	<div align="center">
		<div>
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
			
			
			
			<div class="table-responsive-md bg-white" style="width: 800px">
				<table class="table table-hover">
					<thead class="thead-dark">
						<tr class="text-truncate" align="center">
							<th width="100px"><strong>번호</strong>
							</th>
							<th width="100px"><strong>동</strong>
							</th>
							<th width="400px"><strong>아파트명</strong>
							</th>
							<th width="100px"><strong>거래금액</strong>
							</th>
							<th width="100px"><strong>타입</strong>
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="deal" items="${dealInfo}">
							<tr class="text-truncate" align="center">
								<td width="100px"><strong>${deal.no}</strong></td>
								<td width="100px"><strong>${deal.dong}</strong></td>
								<td width="400px"><a
									href="/house/getInfo/${deal.dong}/${deal.aptName}">${deal.aptName}</a></td>
								<td width="100px"><strong>${deal.dealAmount}</strong></td>
								<td width="100px"><strong>${deal.type}</strong></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<table>
				<tr>
					<td>${navigation.navigator}</td>
				</tr>
			</table>
		</div>
	</div>

	<%@ include file="../user/footer.jsp"%>
</body>
</html>