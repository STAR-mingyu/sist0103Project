<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
	List<String> list = new ArrayList();
	list.add("yellow");
	list.add("gray");
	list.add("magenta");
	list.add("orange");
	list.add("blue");

	for (String a : list) {
	%>

	<div style="background-color:<%=a%>; width:100px; height:50px"><%=a%></div>

	<%
	}
	%>

	<h3>이미지 배열로 출력</h3>

	<%
	String[] imgArr = { "1.jpg", "10.jpg", "11.jpg", "12.jpg", "5.jpg", "6.jpg", "8.jpg", "9.jpg", "2.jpg" };

	int n = 0;
	%>

	<table>
		<%
		for (int i = 0; i < 3; i++) {
		%>
		<tr height="100">
			<%
			for (int j = 0; j < 3; j++) {
			%>
			<td><img alt="" src="../img/Food/<%=imgArr[n]%>" width="80"
				height="80"></td>

			<%
			n++;
			}
			%>
		</tr>

		<%
		}
		%>
	</table>

	<h2>문제 : 연예인사진 20개가 있다 4행 5열로 출력해주세요</h2>
	<table>
		<%
		int num = 1;
		for (int i = 0; i < 4; i++) {
		%>

		<tr>

			<%
			for (int j = 0; j < 5; j++) {
			%>

			<td><img src="../img/연예인사진/<%=num%>.jpg"
				style="width: 100px; height: 100px; object-fit: cover;"></td>
			<%
			num++;
			}
			%>

		</tr>
		<%
		}
		%>

	</table>
</body>
</html>