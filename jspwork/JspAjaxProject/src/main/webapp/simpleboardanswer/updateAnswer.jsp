<%@page import="simpleboardanswer.model.SimpleboardanswerDao"%>
<%@page import="simpleboardanswer.model.SimpleboardanswerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String idx = request.getParameter("idx");
String nickname = request.getParameter("nickname");
String content = request.getParameter("content");
SimpleboardanswerDto dto = new SimpleboardanswerDto();
SimpleboardanswerDao dao = new SimpleboardanswerDao();

dto.setIdx(idx);
dto.setNickname(nickname);
dto.setContent(content);
dao.update(dto);
%>