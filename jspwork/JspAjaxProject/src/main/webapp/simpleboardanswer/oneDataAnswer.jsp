<%@page import="org.json.simple.JSONObject"%>
<%@page import="simpleboardanswer.model.SimpleboardanswerDto"%>
<%@page import="simpleboardanswer.model.SimpleboardanswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
String idx = request.getParameter("idx");
SimpleboardanswerDao dao = new SimpleboardanswerDao();
SimpleboardanswerDto dto = dao.getAnserData(idx);

JSONObject ob = new JSONObject();
ob.put("idx", dto.getIdx());
ob.put("nick", dto.getNickname());
ob.put("content", dto.getContent());
%>

<%=ob.toString()%>