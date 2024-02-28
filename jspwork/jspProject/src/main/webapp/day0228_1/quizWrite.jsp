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
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String date = request.getParameter("date");
	String radio = request.getParameter("radio");
	String[] select = request.getParameterValues("select");
	%>



	<div class="result">
		<div>
			<%=name%>
		</div>
		<div>
			<%=date%>
		</div>
		<div>
			<img alt="" src="<%=radio%>">
		</div>
		<div>
			<%
			for (int i = 0; i < select.length; i++) {
			%>
			<%=select[i]%>
			<%
			}
			%>

		</div>
	</div>
</body>
</html>