<%@page import="data.dto.AnswerGuestDto"%>
<%@page import="data.dao.AnswerGuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String num = request.getParameter("num");
String content = request.getParameter("content");
String myid = request.getParameter("myid");
String currentPage = request.getParameter("currentPage");
System.out.println(num);
System.out.println(content);
System.out.println(myid);
System.out.println(currentPage);
AnswerGuestDao dao = new AnswerGuestDao();
AnswerGuestDto dto = new AnswerGuestDto();

dto.setNum(num);
dto.setMyid(myid);
dto.setContent(content);

dao.insertAnswer(dto);
String url = "../index.jsp?main=memberguest/guestList.jsp?currentPage=" + currentPage;
response.sendRedirect(url);
%>