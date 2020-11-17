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
	<div align="center">
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
		<c:if test="${houseInfo == null}">
			<h2>주택 정보가 없습니다.</h2>
		</c:if>
		<c:if test="${houseInfo != null}">
		<br>
			<img alt="house_image" src="${root}/img/${houseInfo.aptName}.jpg"
				onError="this.onerror=null; this.src ='${ root }/img/다세대주택.jpg'"
				width="800" height="400" align="center" />
			<div style="width: 1200px">
				<table class="table table-active">
					<tbody>
						<tr class="table-info" align="center">
							<td width="100px"><strong>번호</strong></td>
							<td width="100px"><strong>동</strong></td>
							<td width="400px"><strong>아파트명</strong></td>
							<td width="100px"><strong>법정동코드</strong></td>
							<td width="100px"><strong>건축년도</strong></td>
						</tr>
						<tr class="table-danger" align="center">
							<td width="100px"><strong>${houseInfo.no}</strong></td>
							<td width="100px"><strong>${houseInfo.dong}</strong></td>
							<td width="400px"><strong>${houseInfo.aptName}</strong></td>
							<td width="100px"><strong>${houseInfo.code}</strong></td>
							<td width="100px"><strong>${houseInfo.buildYear}</strong></td>
						</tr>
					</tbody>
				</table>
			</div>
		</c:if>
	</div>

	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>