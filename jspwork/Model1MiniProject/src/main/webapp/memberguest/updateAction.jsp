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

	String num = multi.getParameter("num");
	String currentPage = multi.getParameter("currentPage");
	String content = multi.getParameter("content");
	String photoname = multi.getFilesystemName("photo");

	System.out.println(num);
	System.out.println(currentPage);
	System.out.println(content);
	System.out.println(photoname);

	//기존포토명 가져오기
	GusetDao dao = new GusetDao();
	String old_photoname = dao.getData(num).getPhotoname();

	//dto 저장
	GusetDto dto = new GusetDto();
	dto.setNum(num);
	dto.setMyid(myid);
	dto.setContetn(content);
	//사진선택을 안하면 기존으로 사진으로 지정
	dto.setPhotoname(photoname == null ? old_photoname : photoname);

	//dao
	dao.updateGuest(dto);
	System.out.println(realPath);
	//방명록 목록으로 이동(수정했던 페이지로 이동)
	response.sendRedirect("../index.jsp?main=memberguest/guestList.jsp?currentPage=" + currentPage);
} catch (Exception e) {

}
%>