<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String email = request.getParameter("email") + "@" + request.getParameter("email2");
%>
<jsp:useBean id="dao" class="data.dao.MemberDao" />
<jsp:useBean id="dto" class="data.dto.MemberDto" />
<jsp:setProperty property="*" name="dto" />
<%
dto.setEmail(email);
dao.updateMember(dto);

//마이페이지
response.sendRedirect("../index.jsp?main=member/myPage.jsp");
%>