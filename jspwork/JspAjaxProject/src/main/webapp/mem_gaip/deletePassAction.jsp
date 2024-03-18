<%@page import="org.apache.catalina.startup.RealmRuleSet"%>
<%@page import="memgaip.model.MemgaipDao"%>
<%@page import="ajaxboard.AjaxBoardDao"%>
<%@page import="memgaip.model.MemgaipDto"%>
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
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String m_num = request.getParameter("m_num");
	System.out.println(m_num);
	String password = request.getParameter("password");
	MemgaipDto dto = new MemgaipDto();
	MemgaipDao dao = new MemgaipDao();
	boolean check = dao.passCheck(password);

	if (check) {
		dao.delete(m_num);
	%>

	<script type="text/javascript">
		window.close();
		window.opener.location.reload();
	</script>
	<%
	} else {
	%>

	<script type="text/javascript">
		alert("다시 입력해주세요");
		history.back();
	</script>
	<%
	}
	%>
</body>
</html>