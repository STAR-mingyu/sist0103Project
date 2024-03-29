
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>


<%
//세션값 얻기
String saveok = (String) session.getAttribute("saveok");
String myid = "";
if (saveok != null) {
	myid = (String) session.getAttribute("myid");
}
%>
</head>
<body>
	<div style="margin: 200px">
		<form action="login/loginAction.jsp" method="post">
			<table class="table table-bordered" style="width: 200px;">
				<caption align="top">
					<b>세션로그인</b>
				</caption>
				<tr>
					<td><input type="text" name="id" class="form-control"
						required="required" placeholder="아이디입력" style="width: 200px;"
						value="<%=myid%>"></td>
				</tr>
				<tr>
					<td><input type="password" name="pass" class="form-control"
						required="required" placeholder="패스워드입력" style="width: 200px;">
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="cbsave"
						<%=saveok == null ? "" : "checked"%>>&nbsp;아이디저장</td>
				</tr>
				<tr>
					<td>
						<button type="submit" class="btn btn-success btn-lg"
							style="width: 200px;">로그인</button>
					</td>
				</tr>

			</table>
		</form>
		<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	</div>
</body>
</html>