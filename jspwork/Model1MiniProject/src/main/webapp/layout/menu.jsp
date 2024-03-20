<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>
<%
	//프로젝트 경로
	String root = request.getContextPath();
	%>
<link rel="stylesheet" type="text/css"
	href="<%=root%>/menu/css/font-awesome.css">
<link rel="stylesheet" type="text/css"
	href="<%=root%>/menu/css/menu.css">
</head>
<body>

	<!--	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<a href="<%=root%>">메인</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="index.jsp/main?=member/addForm.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>">Q & A</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>">방명록</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>">상품 등록 게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>">이미지 게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;  -->
	<div id="wrap">
		<header>
			<div class="inner relative">
				<nav id="navigation">
					<ul id="main-menu">
						<li class="current-menu-item"><a href="#">로그인</a>
							<ul class="sub-menu">
								<li><a href="index.jsp?main=member/addForm.jsp"><i
										class="icon-wrench"></i>회원가입</a></li>
							</ul></li>
						<li class="current-menu-item"><a href="#">Home</a></li>
						<li class="parent"><a href="#">Features</a>
							<ul class="sub-menu">
								<li><a href="#"><i class="icon-wrench"></i> Elements</a></li>
								<li><a href="#"><i class="icon-credit-card"></i>
										Pricing Tables</a></li>
								<li><a href="#"><i class="icon-gift"></i> Icons</a></li>
								<li><a class="parent" href="#"><i class="icon-file-alt"></i>
										Pages</a>
									<ul class="sub-menu">
										<li><a href="#">Full Width</a></li>
										<li><a href="#">Left Sidebar</a></li>
										<li><a href="#">Right Sidebar</a></li>
										<li><a href="#">Double Sidebar</a></li>
									</ul></li>
							</ul></li>
						<li><a href="#">Portfolio</a></li>
						<li class="parent"><a href="#">Blog</a>
							<ul class="sub-menu">
								<li><a href="#">Large Image</a></li>
								<li><a href="#">Large Image</a></li>
								<li><a href="#">Large Image</a></li>
								<li><a href="#">Large Image</a></li>
								<li><a href="#">Large Image</a></li>
							</ul></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</nav>

			</div>
		</header>
	</div>
</body>
</html>