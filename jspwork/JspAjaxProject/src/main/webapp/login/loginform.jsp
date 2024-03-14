<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
.logform {
	width: 500px;
	margin: 100px auto 0 auto;
}
</style>
</head>
<body>
	<%
	//세션으로부터 아이디와 체크값을 얻는다
	String myid = (String) session.getAttribute("idok");
	String savaid = (String) session.getAttribute("savaok");

	boolean save = true;

	if (savaid == null) {
		myid = ""; //아이디 저장을 체그하지 않은 경우 아이디 없앤다
		save = false;
	}
	%>
	<div class="logform">
		<h2 class="alert alert-warning">회원 로그인</h2>
		<br>
		<form action="loginAction.jsp" method="post">
			<input type="text" name="id" class="form-control"
				style="width: 200px;" placeholder="로그인할 아이디" required="required"
				value="<%=myid%>"> <br> <input type="text" name="pass"
				class="form-control" style="width: 200px;" placeholder="로그인할 패스워드"
				required="required"> <br>
			<button type="submit" class="btn btn-success btn-lg"
				style="width: 200px; height: 50px;">로그인</button>
			<br> <input type="checkbox" name="savecheck" <%=save?"cheked":"" %>>아이디 저장
		</form>
	</div>
</body>
</html>