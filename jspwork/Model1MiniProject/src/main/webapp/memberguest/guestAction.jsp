<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="data.dto.GusetDto"%>
<%@page import="data.dao.GusetDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String myid = (String) session.getAttribute("myid");
String realPath = getServletContext().getRealPath("/save");

int uploadSize = 1024 * 1024 * 3;

MultipartRequest multi = null;
try {

	multi = new MultipartRequest(request, realPath, uploadSize, "utf-8", new DefaultFileRenamePolicy());
	String contetn = multi.getParameter("contetn");
	String photoname = multi.getFilesystemName("photo");

	//dto 저장
	GusetDto dto = new GusetDto();
	dto.setMyid(myid);
	dto.setContetn(contetn);
	dto.setPhotoname(photoname);

	//dao
	GusetDao dao = new GusetDao();
	dao.insertGuest(dto);
    System.out.println(realPath);
	//방명록 목록으로 이동
	response.sendRedirect("../index.jsp?main=memberguest/guestList.jsp");
} catch (Exception e) {

}
%>