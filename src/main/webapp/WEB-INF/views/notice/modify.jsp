<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${userinfo == null}">
	<script laguage="javascript">
		alert("로그인후 이용해주세요");
		window.location='';
	</script>
</c:if>
<c:if test="${userinfo != null}">
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>SSAFY-글수정</title>
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
			let noticeno = $("#noticeno").val();
			let userid = "${userinfo.userid}";
			let data = {"subject" : subject, "content" : content, "userid" : userid, "noticeno" : noticeno};
			if(subject == "" || content == ""){
				alert("빈칸이 있습니다");
				return;
			}
			$.ajax({
				type : "POST",
				url : "/notice/modifynotice",
				contentType : "application/json",
				data : JSON.stringify(data),
				success : function(data){
					console.log("수정성공");
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
		<h2>공지사항 수정</h2>
		<form id="writeform" method="post" action="">
		<input type="hidden" name="act" id="act" value="modifynotice">
		<input type="hidden" name="noticeno" id="noticeno" value="${notice.noticeno}">
			<div class="form-group" align="left">
				<label for="subject">제목:</label>
				<input type="text" class="form-control" id="subject" name="subject" value="${notice.subject}">
			</div>
			<div class="form-group" align="left">
				<label for="content">내용:</label>
				<textarea class="form-control" rows="15" id="content" name="content">${notice.content}</textarea>
			</div>
			<button type="button" class="btn btn-primary" id = "regist">글수정</button>
			<button type="reset" class="btn btn-warning">초기화</button>
		</form>
	</div>
</div>

	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>
</c:if>