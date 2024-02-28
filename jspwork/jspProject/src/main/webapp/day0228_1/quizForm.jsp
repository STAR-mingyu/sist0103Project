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
 <form action="quizWrite.jsp" method="post">
 <div>
 <input type="text" name="name" placeholder="이름" required="required">
 </div>
  <div>
 <input type="date" name="date" required="required">
 </div>
  <div>
 <input type="radio" name="radio" value="../img/Food/1.jpg">
 <input type="radio" name="radio" value="../img/Food/2.jpg">
 <input type="radio" name="radio" value="../img/Food/3.jpg">
 <input type="radio" name="radio" value="../img/Food/4.jpg">
 </div>
   <div>
  <select multiple="multiple" name="select">
  <option value="쌀국수">쌀국수</option>
  <option value="마라탕">마라탕</option>
  <option value="원하는 메뉴 없음">원하는 메뉴 없음</option>
 </select>
 </div>
 <div>
 <input type="submit" value="제출하기">
 </div>
 </form>
</body>
</html>