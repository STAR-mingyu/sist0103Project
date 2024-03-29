<%@page import="data.dao.SmartDao"%>
<%@page import="data.dto.SmartDto"%>
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
	String nums = request.getParameter("nums");
	System.out.println(nums);

	String arr[] = nums.split(",");
	System.out.println(arr);

	for (int i = 0; i <= arr.length; i++) {
		SmartDto dto = new SmartDto();
		SmartDao dao = new SmartDao();
		dao.deleteSmart(nums);

	}
	response.sendRedirect("../index.jsp?main=smartBoard/boardList.jsp");
	%>

</body>
</html>