<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="include/header.html"></jsp:include>

<%
//프로젝트 경로
String root = request.getContextPath();
String mainPage = "layout/main.jsp";

//urp을 읽어서 main값을 읽어서 메인페이지에 출력한다
if (request.getParameter("main") != null) {
	mainPage = request.getParameter("main");
}
%>
<body>

	<div class="layout title">
		<jsp:include page="layout/title.jsp"></jsp:include>
	</div>
	<div class="layout menu">
		<jsp:include page="layout/menu.jsp"></jsp:include>
	</div>
	<div class="layout info">
		<jsp:include page="layout/info.jsp"></jsp:include>
	</div>
	<div class="layout main">
		<jsp:include page="<%=mainPage%>"></jsp:include>
	</div>


	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</body>
</html>