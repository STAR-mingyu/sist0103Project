<%@page import="simpleboardanswer.model.SimpleboardanswerDao"%>
<%@page import="simpleboardanswer.model.SimpleboardanswerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String num = request.getParameter("num");
	String nickname = request.getParameter("nickname");
	String content = request.getParameter("content");

	SimpleboardanswerDto dto = new SimpleboardanswerDto();
	SimpleboardanswerDao dao = new SimpleboardanswerDao();
	
	dto.setNum(num);
	dto.setNickname(nickname);
	dto.setContent(content);
	dao.insertAnswer(dto);
	%>
