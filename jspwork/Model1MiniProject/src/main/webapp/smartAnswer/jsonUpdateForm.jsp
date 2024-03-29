<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dto.SmartAnswerDto"%>
<%@page import="data.dao.SmartAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String idx = request.getParameter("idx");
SmartAnswerDao dao = new SmartAnswerDao();
SmartAnswerDto dto = dao.getData(idx);
System.out.println(idx + "dsf");
JSONObject ob = new JSONObject();
ob.put("nick", dto.getNickname());
ob.put("content", dto.getContent());
System.out.println(dto.getNickname());
System.out.println(dto.getContent());
%>

<%=ob.toString()%>
