<%@page import="data.dto.AnswerGuestDto"%>
<%@page import="data.dao.AnswerGuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String content = request.getParameter("content");
String idx = request.getParameter("idx");

System.out.println(content);
System.out.println(idx);
AnswerGuestDao dao = new AnswerGuestDao();
AnswerGuestDto dto = new AnswerGuestDto();

dao.updateAnswer(idx, content);
%>