<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>
<style>
.logo {
	color: black;
	text-decoration: none;
}
</style>
<%
//프로젝트 경로
String root = request.getContextPath();
%>
</head>
<body>
	<a href="<%=root%>" class="logo"><img alt=""
		src="<%=root%>/img/logo.jpg"></a>

	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</body>
</html>