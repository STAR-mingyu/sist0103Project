<%@page import="ajaxboard.AjaxBoardDto"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForTokens"%>
<%@page import="ajaxboard.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
AjaxBoardDao dao = new AjaxBoardDao();
AjaxBoardDto dto = new AjaxBoardDto();
request.setCharacterEncoding("utf-8");

String writer = request.getParameter("writer");
String subject = request.getParameter("subject");
String avata = request.getParameter("avata");
String content = request.getParameter("content");
String num = request.getParameter("num");

dto.setWriter(writer);
dto.setSubject(subject);
dto.setAvata(avata);
dto.setContent(content);
dto.setNum(num);

dao.updateBoard(dto);
%>