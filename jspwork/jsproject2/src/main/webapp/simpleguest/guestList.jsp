<%@page import="java.text.SimpleDateFormat"%>
<%@page import="simpleguset.model.GuestDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="simpleguset.model.GuestDao"%>
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
<style type="text/css">
span.day {
	float: right;
	color: #222
}

body {
	font-family: 'Dongle';
	font-size: 22px;
}

.edit {
	float: right;
}

svg {
	width: 22px;
	height: 22px;
	cursor: pointer;
	margin-left: 10px;
}
</style>
</head>
<body>
	<%
	GuestDao dao = new GuestDao();
	ArrayList<GuestDto> list = dao.getAlldatas();
	%>
	<div style="margin: 50px 100px; width: 600px;">
		<button type="button" class="btn btn-info btn-sm"
			onclick="location.href='InsertForm.jsp'"
			style="padding: 10 16pxpx; font-size: 18px;">글쓰기</button>

		<%
		for (int i = 0; i < list.size(); i++) {
			GuestDto dto = list.get(i);
			int no = list.size() - i;
			SimpleDateFormat sdf = new SimpleDateFormat();
		%>
		<div class="edit">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16"
				onclick="location.href='upDateForm.jsp?num=<%=dto.getNum()%>'">
  <path
					d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.5.5 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11z" />
</svg>
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16"
				onclick="location.href='deleteAction.jsp?num=<%=dto.getNum()%>'">
  <path
					d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47M8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5" />
</svg>
		</div>
		<table class="table table-bordered" style="width: 600px">
			<tr>
				<td><b>No.<%=i + 1%></b>&nbsp;&nbsp; <b><%=dto.getNickname()%></b>
					<span class="day"><%=sdf.format(dto.getWriteday())%></span></td>
			</tr>
			<tr>
				<td>
					<div>
						<img alt="" src="../image/avata/b<%=dto.getImage()%>.png"
							align="left" hspace="20">
						<pre>
			<%=dto.getContent()%></pre>
					</div>
				</td>
			</tr>
		</table>

		<%
		}
		%>
	</div>

</body>
</html>