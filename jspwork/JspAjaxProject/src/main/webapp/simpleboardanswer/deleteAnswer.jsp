<%@page import="simpleboardanswer.model.SimpleboardanswerDto"%>
<%@page import="simpleboardanswer.model.SimpleboardanswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String idx = request.getParameter("idx");

SimpleboardanswerDao dao = new SimpleboardanswerDao();
SimpleboardanswerDto dto = new SimpleboardanswerDto();

dto.setNum(idx);

dao.delete(idx);
%>