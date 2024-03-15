<%@page import="SimpleBoard.SimpleBoardDao"%>
<%@page import="SimpleBoard.SimpleBoardDto"%>
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
	String num = request.getParameter("num");
	String pass = request.getParameter("pass");

	SimpleBoardDao dao = new SimpleBoardDao();
	SimpleBoardDto dto = new SimpleBoardDto();

	boolean flag = dao.password(num, pass);
	dto.setNum(num);
	dto.setPass(pass);

	if (flag) {
		dao.delete(num);
		response.sendRedirect("boardlist.jsp");
	} else {
	%>
	<script type="text/javascript">
		alert("틀렸습니다 다시 입력해주세요");
		history.back();
	</script>

	<%
	}
	%>
</body>
</html>