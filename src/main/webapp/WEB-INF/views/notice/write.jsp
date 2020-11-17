<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${userinfo == null}">
	<script laguage="javascript">
		alert("로그인이 필요한페이지입니다.");
		window.location='/index';
	</script>
	
</c:if>

<c:if test="${userinfo != null }">
<c:if test="${userinfo.userid != 'admin' }">
	<script laguage="javascript">
		alert("권한이 없습니다.");
		window.location='/notice';
	</script>
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>공지사항 작성</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  $(document).ready(function(){
		$("#regist").on("click", function(){
			let subject = $("#subject").val();
			let content = $("#content").val();
			let userid = "${userinfo.userid}";
			let data = {"subject" : subject, "content" : content, "userid" : userid};
			if(subject == "" || content == ""){
				alert("빈칸이 있습니다");
				return;
			}
			$.ajax({
				type : "POST",
				url : "/notice/writenotice",
				contentType : "application/json",
				data : JSON.stringify(data),
				success : function(data){
					console.log("등록성공");
					console.log(data);
					location.href = "/notice";
				}
			});
		});
	});
  </script>
</head>
<body>
<%@ include file="/WEB-INF/views/user/login.jsp" %>
<div class="container" align="center">

	<div class="col-lg-6" align="center">
		<h2>공지사항 작성</h2>
		<form id="writeform" method="post" action="">
		<input type="hidden" name="act" id="act" value="writenotice">
			<div class="form-group" align="left">
				<label for="subject">제목:</label>
				<input type="text" class="form-control" id="subject" name="subject">
			</div>
			<div class="form-group" align="left">
				<label for="content">내용:</label>
				<textarea class="form-control" rows="15" id="content" name="content"></textarea>
			</div>
			<button type="button" class="btn south-btn " id = "regist">글작성</button>
			<button type="reset" class="btn south-btn btn-3">초기화</button>
		</form>
	</div>
</div>

	<%@ include file="../user/footer.jsp"%>
</body>
</html>
</c:if>