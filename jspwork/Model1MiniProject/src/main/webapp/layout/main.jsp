<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>
<%
//프로젝트 경로
String root = request.getContextPath();
%>
</head>
<body>
	<div id="main">
		<img alt="" src="<%=root%>/img/banner_01.jpg" class="banner">
		<h3 class="title">주요 제품보기</h3>
		<div class="img_box">
			<img alt="" src="<%=root%>/img/main_01.png"> <img alt=""
				src="<%=root%>/img/main_02.png"> <img alt=""
				src="<%=root%>/img/main_03.png"> <img alt=""
				src="<%=root%>/img/main_04.png">
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script type="text/javascript" src="<%=root%>/menu/js/jquery.js"></script>
	<script type="text/javascript" src="<%=root%>/menu/js/function.js"></script>
</body>
</html>   