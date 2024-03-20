<%@page import="ajaxwrite.model.AjaxwriteDao"%>
<%@page import="ajaxwrite.model.AjaxwriteDto"%>
<%@page import="ajaxboard.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");
AjaxwriteDao dao = new AjaxwriteDao();
AjaxwriteDto dto = new AjaxwriteDto();
dto.setNum(num);
dao.delete(num);
%>