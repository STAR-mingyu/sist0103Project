<%@page import="java.io.File"%>
<%@page import="data.dao.GusetDao"%>
<%@page import="data.dto.GusetDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");
String currentPage = request.getParameter("currentPage");

GusetDto dto = new GusetDto();
GusetDao dao = new GusetDao();
String photoname = dao.getData(num).getPhotoname();
dao.deleteGuest(num);

String realPath = getServletContext().getRealPath("/save");

//파일객체생성
File file = new File(realPath + "/" + photoname);
//파일삭제
if (file.exists()) {
	file.delete();
}
String url = "../index.jsp?main=memberguest/guestList.jsp?currentPage=" + currentPage;
response.sendRedirect(url);
%>