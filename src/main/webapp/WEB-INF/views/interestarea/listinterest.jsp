<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Happy House</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</head>

<body>
	<%@ include file="../user/login.jsp"%>
	<br>
	<div class="container">
		<h2>관심지역 목록</h2>
		<table class="table" id="interestTable">
			<thead class="thead-dark">
				<tr>
					<th>관심지역 주소</th>
					<th>관심지역 제거</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty interestlist}">
						<tr>
							<td colspan="2">입력된 관심지역이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${interestlist}" var="area">
							<c:if test="${area.userid == userinfo.userid}">
								<tr>
								<td>${area.sidoName}시 ${area.gugunName}구 ${area.dongName}동</td>
								<td><a href="${root}/delInterest/${area.userid}/${area.dongName}">관심지역 제거</a></td>
								</tr>
							</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>

	<br>
	<%@ include file="../user/footer.jsp"%>
</body>
</html>

