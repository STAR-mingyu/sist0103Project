<%@page import="data.dao.SmartAnswerDao"%>
<%@page import="data.dao.AnswerGuestDao"%>
<%@page import="data.dto.SmartAnswerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String nickname = request.getParameter("nickname");
String content = request.getParameter("content");
String answernum = request.getParameter("answernum");

System.out.println(nickname);
System.out.println(content);
System.out.println(answernum);

SmartAnswerDto dto = new SmartAnswerDto();
SmartAnswerDao dao = new SmartAnswerDao();
dto.setNickname(nickname);
dto.setContent(content);
dto.setNum(answernum);

dao.smartAnswerInsert(dto);
%>