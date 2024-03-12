<%@page import="quizshop.model.QuizShopDao"%>
<%@page import="quizshop.model.QuizShopDto"%>
<%@page import="ajaxboard.AjaxBoardDao"%>
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

<title>Insert title here</title>
<%
String num = request.getParameter("num");
System.out.println(num);
QuizShopDao dao = new QuizShopDao();
QuizShopDto dto = dao.detailShop(num);
%>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Dongle';
	font-size: 26px;
}

.container {
	width: 600px;
	padding: 0;
}

.container .main {
	display: flex;
}

.container .main  .text {
	margin-left: 40px;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.container .main  .text span {
	display: block;
}

.container .main  .text span:first-child {
	font-size: 30px;
	font-weight: 700;
}

.container .main  .text span:last-child {
	font-size: 22px;
	color: #a9a0a0;
}

.btn {
	padding: 0;
	margin: 0;
	display: flex;
	justify-content: space-between;
	margin-top: 40px;
}

.btn button {
	width: 30%;
	background-color: transparent;
	border-radius: 30px;
	background: #d2eaff;
}

.btn button:first-child {
	background: #d2eaff;
}

.btn button:nth-child(2) {
	background: #f7c477;
}

.btn button:last-child {
	background: #f54848;
}
</style>
</head>
<body>
	<!-- 이미지가 크게 나오고 옆에 설명추가 -->
	<div class="container">
		<div class="main">
			<div class="img">
				<img alt="" src="../image/쇼핑몰사진/<%=dto.getPhoto()%>.jpg">
			</div>
			<div class="text">
				<span><%=dto.getSang_name()%></span> <span><%=dto.getPrice()%></span>
				<span><%=dto.getIpgoday()%></span>
			</div>
		</div>
		<div class="btn">
			<button type="button" onclick="location.href='shoplist.jsp'">목록</button>
			<button type="button">수정</button>
			<button type="button">삭제</button>
		</div>
	</div>
	<!-- 상품명 가격 입고일 -->
</body>

<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script type="text/javascript">
	
</script>
</html>