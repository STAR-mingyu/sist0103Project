<%@page import="data.dto.CartDto"%>
<%@page import="data.dao.CartDao"%>
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
	String shopnum = request.getParameter("shopnum");
	String num = request.getParameter("num");
	int cnt = Integer.parseInt(request.getParameter("cnt"));

	System.out.println(shopnum + "상품넘");
	System.out.println(num + "넘");
	System.out.println(cnt + "씨엔티");

	CartDao dao = new CartDao();
	CartDto dto = new CartDto();

	dto.setShopnum(shopnum);
	dto.setNum(num);
	dto.setCnt(cnt);

	dao.cartinsrt(dto);
	%>
</body>
</html>