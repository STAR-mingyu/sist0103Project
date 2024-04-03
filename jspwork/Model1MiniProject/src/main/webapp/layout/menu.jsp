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
<%
String myid = (String)session.getAttribute("myid");
String loginok = (String)session.getAttribute("loginok");
%>
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
						<li class="current-menu-item"><a
							href="index.jsp?main=member/memberList.jsp">회원</a>
							<ul class="sub-menu">
								<%
								if (loginok == null) {
								%>
								<li><a href="index.jsp?main=member/addForm.jsp">회원가입</a></li>
								<%
								}
								%>

								<%
								if (loginok != null && myid.equals("admin")) {
								%>
								<li><a href="index.jsp?main=member/memberList.jsp">회원목록</a></li>
								<%
								}
								%>
								<%
								if (loginok != null) {
								%>
								<li><a href="index.jsp?main=smartBoard/boardList.jsp">마이페이지</a></li>
								<%
								}
								%>


							</ul></li>
						<li class="current-menu-item"><a
							href="index.jsp?main=memberguest/guestList.jsp">게시판</a>
							<ul class="sub-menu">
								<li><a href="index.jsp?main=memberguest/guestList.jsp">회원방명록</a></li>
								<li><a href="index.jsp?main=smartBoard/boardList.jsp">스마트게시판</a></li>
							</ul></li>
						<li class="current-menu-item" style="margin-left: 60px;"><a
							href="index.jsp?main=shop/addForm.jsp"
							style="white-space: nowrap;">Maison shop</a>
							<ul class="sub-menu">
								<%
								if (loginok != null && myid.equals("admin")) {
								%>
								<li><a href="index.jsp?main=shop/addForm.jsp">상품등록</a></li>
								<%
								} else {
								%>
								<li><a href="index.jsp?main=shop/shopList.jsp">상품목록</a></li>
								<%
								}
								%>


							</ul></li>
					</ul>
				</nav>

			</div>
		</header>
	</div>
</body>
</html>