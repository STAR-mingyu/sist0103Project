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
<%

%>
<body>
	<form action="">
		<input type="button" value="입력폼" onclick="location.href='addform.jsp'"
			class="btn btn-info">

	</form>
	<table class="table table-bordered" style="width: 1000px">
		<caption align="top">
			<b>info 전체목록</b>
		</caption>
		<tr>
			<th width="80">No</th>
			<th width="120">이름</th>
			<th width="120">나이</th>
			<th width="180">헨드폰</th>
			<th width="80">운전면허</th>
			<th width="200">수정/삭제</th>
		</tr>
		
		<%
		for(int i=0;i<list.size();i++) {
			
		}
		%>

	</table>
</body>
</html>