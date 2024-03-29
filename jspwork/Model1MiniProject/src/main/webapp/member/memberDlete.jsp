<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>
<%
String root = request.getContextPath();
String num = request.getParameter("num");
MemberDao dao = new MemberDao();
MemberDto dto = new MemberDto();

dto.setNum(num);

dao.deleteMember(num);

response.sendRedirect("../index.jsp?main=member/memberList.jsp");
%>
