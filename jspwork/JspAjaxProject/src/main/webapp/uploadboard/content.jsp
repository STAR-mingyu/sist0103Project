<%@page import="java.text.SimpleDateFormat"%>
<%@page import="uploadBoard.UploadBoardDto"%>
<%@page import="uploadBoard.UploadBoardDao"%>
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
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
* {
	padding: 0;
	margin: 0;
	font-family: "Dongle";
	font-size: 26px;
	box-sizing: border-box;
}

table {
	border: 1px solid #000;
	text-align: center;
	border-collapse: collapse;
	padding: 20px;
	margin-top: 40px;
}

table td {
	width: 120px;
}

button {
	width: 140px;
	background-color: #6f8bc5;
	font-size: 24px;
	border-radius: 40px;
	margin-top: 40px;
	height: 50px;
}

.btn {
	display: flex;
	justify-content: space-around;
	width: 100%;
	padding: 0;
}

button.list {
	background-color: #6f8bc5;
}

button.write {
	background-color: #40c5c3;
}

button.update {
	background-color: #9fdd36;
}

button.delete {
	background-color: #d10b0b;
}

.flex {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	display: flex;
	flex-direction: column;
	align-items: center;
	flex-direction: column;
}

.img {
	width: 200px;
	height: 200px;
}

.img img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
</style>
</head>
<body>
	<%
	String num = request.getParameter("num");
	UploadBoardDao dao = new UploadBoardDao();
	dao.updateReadCount(num);
	UploadBoardDto dto = dao.getData(num);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	%>

	<div class="flex">
		<div class="img">
			<img alt="" src="../save/<%=dto.getImgname()%>">
		</div>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회</th>

			</tr>

			<tr>
				<td><%=dto.getNum()%></td>
				<td><%=dto.getSubject()%></td>
				<td><%=dto.getContent()%></td>
				<td><%=dto.getWriter()%></td>
				<td><%=dto.getWriteday()%></td>
				<td><%=sdf.format(dto.getReadcount())%></td>
			</tr>
		</table>
		<div class="btn">
			<button type="button" onclick="location.href='addform.jsp'"
				class="write">글쓰기</button>
			<button type="button" onclick="location.href='boardlist.jsp'"
				class="list">목록</button>
			<button type="button"
				onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'"
				class="update">수정</button>
			<button type="button"
				onclick="location.href='deleteform.jsp?num=<%=dto.getNum()%>'"
				class="delete">삭제</button>
		</div>

	</div>

</body>
</html>