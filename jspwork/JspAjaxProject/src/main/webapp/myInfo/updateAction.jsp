<%@page import="myinfo.db.MyInfoDto"%>
<%@page import="myinfo.db.MyInfoDao"%>
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

	String name = request.getParameter("name");
	String blood = request.getParameter("blood");
	String hp = request.getParameter("hp1") + "-" + request.getParameter("hp2") + "-" + request.getParameter("hp3");
	String birth = request.getParameter("birth");
	String num = request.getParameter("num");
	System.out.println(hp + birth);

	MyInfoDao dao = new MyInfoDao();
	MyInfoDto dto = new MyInfoDto();

	dto.setName(name);
	dto.setBlood(blood);
	dto.setHp(hp);
	dto.setBirth(birth);
	dto.setNum(num);

	dao.updateInfo(dto);

	response.sendRedirect("infoList.jsp");
	%>
</body>
</html>