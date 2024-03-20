<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="memgaip.model.MemgaipDto"%>
<%@page import="memgaip.model.MemgaipDao"%>
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
	MemgaipDao dao = new MemgaipDao();
	MemgaipDto dto = new MemgaipDto();

	String savePath = getServletContext().getRealPath("upload");
	int maxSize = 1024 * 1024 * 10; // 10MB

	MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8");

	String m_num = multi.getParameter("m_num");
	System.out.println("action " + m_num);
	String m_name = multi.getParameter("m_name");
	String m_pass = multi.getParameter("m_pass");
	String m_hp = multi.getParameter("m_hp");
	String m_photo = multi.getFilesystemName("m_photo");

	dto.setM_num(m_num);
	dto.setM_name(m_name);
	dto.setM_pass(m_pass);
	dto.setM_hp(m_hp);
	dto.setM_photo(m_photo);

	dao.update(dto);
	%>
</body>
</html>