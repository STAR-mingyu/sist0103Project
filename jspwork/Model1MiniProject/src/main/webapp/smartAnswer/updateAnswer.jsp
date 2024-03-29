<%@page import="data.dto.SmartAnswerDto"%>
<%@page import="data.dao.SmartAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String idx = request.getParameter("update_num");
String nickname = request.getParameter("nickname");
String content = request.getParameter("content");
System.out.println(idx);
SmartAnswerDao dao = new SmartAnswerDao();
SmartAnswerDto dto = new SmartAnswerDto();

dto.setContent(content);
dto.setNickname(nickname);
dto.setIdx(idx);

dao.updateAnswer(dto);
%>