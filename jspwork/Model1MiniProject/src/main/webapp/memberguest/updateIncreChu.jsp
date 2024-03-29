<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.GusetDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//num읽기
String num = request.getParameter("num");

GusetDao dao = new GusetDao();
dao.updateChu(num);

//증가된 chu
int chu = dao.getData(num).getChu();

JSONObject ob = new JSONObject();

ob.put("chu", chu);
%>

<%=ob.toString()%>


