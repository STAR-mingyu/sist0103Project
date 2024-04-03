<%@page import="data.dao.CartDao"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>
<style>
.logo {
	color: black;
	text-decoration: none;
}

.cart {
	display: flex;
	margin-left: 20px;
	cursor: pointer;
}

.cart .count {
	margin-left: 10px;
	font-weight: 700;
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

	<div class="log_box">
		<%
		//로그인 세션 얻기
		String loginok = (String) session.getAttribute("loginok");
		//아이디 얻기
		String myid = (String) session.getAttribute("myid");

		MemberDao dao = new MemberDao();
		String name = dao.getName(myid);

		CartDao cdao = new CartDao();

		int cartSize = cdao.cartList(myid).size();

		if (loginok == null) {
		%>
		<a href="index.jsp?main=login/loginForm.jsp">Login</a>

		<%
		} else {
		%>
		<b><%=name%>님 로그인중..</b> <a href="login/logoutAction.jsp">Logout</a>

		<%
		}
		%>

		<div class="cart">
			<i class="bi bi-cart-fill"></i>
			<div class="count"><%=cartSize%></div>
		</div>

	</div>





	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

	<script type="text/javascript">
		$(".cart").click(function() {
			location.href = "index.jsp?main=shop/myCart.jsp";
		})
	</script>
</body>
</html>