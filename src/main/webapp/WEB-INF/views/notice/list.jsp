<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${userinfo == null}">
	<script laguage="javascript">
		alert("로그인후 이용해주세요");
		window.location='/';
	</script>

</c:if>
<c:if test="${userinfo != null}">
<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>공지사항</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		function movewrite() {
				location.href="/notice/mvwritenotice";
// 			if(${userinfo.userid} != 'admin'){
// 				alert("권한이 없습니다.");
// 				window.location='';
// 				return;
// 			}else {
// 			}
		}
		function searchNotice() {
			if(document.getElementById("word").value == "") {
				alert("검색어입력!!");
				return;
			}
			document.getElementById("searchform").action = "/notice/listnotice";
			document.getElementById("searchform").submit();
		}
		</script>
	</head>
	<body>	
	<%@ include file="/WEB-INF/views/user/login.jsp" %>
	<div class="container" align="center">

	  <div class="col-lg-8" align="center">
	  <h2>공지사항</h2>
	  <table class="table table-borderless">
	  	<tr>
	  		<td align="right"><button type="button" class="btn south-btn btn-2" onclick="javascript:movewrite();">글쓰기</button></td>
	  	</tr>
	  </table>
	  <form id="searchform" method="get" class="form-inline" action="">
	  <input type="hidden" name="act" id="act" value="listnotice">
	  <table class="table table-borderless">
	  	<tr>
	  		<td align="right">
		  	  <select class="form-control" name="key" id="key">
			    <option value="userid" selected="selected">아이디</option>
			    <option value="noticeno">글번호</option>
			    <option value="subject">제목</option>
			  </select>
			  <input type="text" class="form-control" placeholder="검색어 입력." name="word" id="word">
			  <button type="button" id="search" class="btn south-btn" onclick="javascript:searchNotice();">검색</button>
			</td>
	  	</tr>
	  </table>
	  </form>
	  <c:if test="${notices.size() != 0}">
	  	<c:forEach var="notice" items="${notices}">
	  <table class="table table-hover">
	  <thead class="thead-dark">
	      <tr>
	        <th colspan="2" class="table-danger"><strong>${notice.noticeno}. ${notice.subject}</strong></th>
	      </tr>
	  </thead>
	    <tbody>
	      <tr>
	        <td colspan="2">${notice.content}</td>
	      </tr>
	      <tr class="text-truncate">
	        <td>작성자 : ${notice.userid}</td>
	        <td align="right">작성일 : ${notice.regtime}</td>
	      </tr>
	      <c:if test="${userinfo.userid == notice.userid}">
	      <tr class="text-truncate">
	        <td colspan="2">
			<a href="/notice/moveModifyNotice/${notice.noticeno}">수정</a>
			<a href="/notice/deletenotice/${notice.noticeno}">삭제</a>
			</td>
	      </tr>
	      </c:if>
	    </tbody>
	  </table>
	  	</c:forEach>
	  </c:if>
	  <c:if test="${notices.size() == 0}">
	  <table class="table table-hover">
	    <tbody>
	      <tr class="text-truncate" align="center">
	        <td>작성된 글이 없습니다.</td>
	      </tr>
	    </tbody>
	  </table>
	  </c:if>
	  </div>
	</div>
	<%@ include file="../user/footer.jsp"%>
	</body>
</html>
</c:if>