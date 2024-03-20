<%@page import="ajaxwrite.model.AjaxwriteDto"%>
<%@page import="ajaxwrite.model.AjaxwriteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String witer = request.getParameter("witer");
String subject = request.getParameter("subject");
String story = request.getParameter("story");
String image = request.getParameter("image");

AjaxwriteDto dto = new AjaxwriteDto();
AjaxwriteDao dao = new AjaxwriteDao();
dto.setWiter(witer);
dto.setSubject(subject);
dto.setStory(story);
dto.setImage(image);

dao.insert(dto);
%>