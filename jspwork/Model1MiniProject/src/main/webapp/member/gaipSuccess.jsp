<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
//System.out.println(name);
MemberDao dao = new MemberDao();
MemberDto dto = new MemberDto();

boolean bname = dao.gaipSuccess(id);

//프로젝트 경로
String root = request.getContextPath();
%>
</head>
<body>

	<div class="signUp">
		<div class="sign_title">
			<p><%=id%><span> 님 가입을 축하드립니다!!</span>
			</p>
		</div>
		<div class="img">
			<img alt="" src="<%=root%>/img/success.jpg">
		</div>
		<div class="btn">
			<a href="<%=root%>">메인</a> <a
				href="<%=root%>?main=login/loginMain.jsp">로그인</a>	
		</div>
	</div>
</body>
</html>