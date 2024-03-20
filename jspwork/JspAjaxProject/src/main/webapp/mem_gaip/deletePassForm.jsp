<%@page import="memgaip.model.MemgaipDao"%>
<%@page import="ajaxboard.AjaxBoardDao"%>
<%@page import="memgaip.model.MemgaipDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<%
String m_num = request.getParameter("m_num");
System.out.println(m_num);
%>
</head>
<body>
	<form action="deletePassAction.jsp" method="post" id="form">
		<input type="hidden" name="m_num" value="<%=m_num%>">
		<div style="display: flex;">
			<input type="text" required="required" placeholder="비밀번호 입력"
				class="form-control pw" style="width: 160px" name=password>
			<button type="submit" class="btn btn-success">확인</button>
		</div>

	</form>


</body>
</html>