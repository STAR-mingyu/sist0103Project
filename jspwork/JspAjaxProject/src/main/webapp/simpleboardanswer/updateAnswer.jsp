<%@page import="simpleboardanswer.model.SimpleboardanswerDao"%>
<%@page import="simpleboardanswer.model.SimpleboardanswerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="dao"
	class="simpleboardanswer.model.SimpleboardanswerDao"></jsp:useBean>
<jsp:useBean id="dto"
	class="simpleboardanswer.model.SimpleboardanswerDto"></jsp:useBean>
<jsp:setProperty property="*" name="dto" />
<%
dao.update(dto);
%>

