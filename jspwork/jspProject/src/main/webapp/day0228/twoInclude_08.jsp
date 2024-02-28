<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
   <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>

<%
String name = request.getParameter("name");
String addr = request.getParameter("addr");
String img = request.getParameter("celeb");
%>

<div>이름은 : <%=name%></div>
<div>주소는 : <%=addr%></div>
<div><img src="<%=img%>" style="width:300px;height:300px;object-fit:cover;"></div>
</body>
</html>