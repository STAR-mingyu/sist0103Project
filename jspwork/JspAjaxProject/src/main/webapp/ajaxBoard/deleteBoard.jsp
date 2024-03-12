<%@page import="ajaxboard.AjaxBoardDao"%>
<%@page import="ajaxboard.AjaxBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String num = request.getParameter("num");

AjaxBoardDto dto = new AjaxBoardDto();
AjaxBoardDao dao = new AjaxBoardDao();

dao.deleteBoard(num);
%>