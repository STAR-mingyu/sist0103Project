<%@page import="myinfo.db.MyInfoDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="uploadBoard.UploadBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="uploadBoard.UploadBoardDao"%>
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
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Pretendard Variable'
}

.list {
	display: flex;
	width: 1200px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	flex-wrap: wrap;
}

.img_box {
	height: 180px;
}

.text_box {
	padding: 20px;
}

.text_box .no {
	font-weight: 700;
	font-size: 20px;
}

.text_box .title {
	font-size: 18px;
	margin-top: 6px;
}

.text_box .content {
	font-size: 18px;
	margin-top: 6px;
	overflow: hidden;
	display: block;
	text-overflow: ellipsis;
	display: block;
}

.text_box .day {
	font-size: 14px;
	color: #9f9797;
	margin-top: 6px;
}

.text_box .count {
	font-size: 14px;
	color: #a79f9f;
	margin-top: 6px;
}

.img_box img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.list .block {
	border: 1px solid black;
	width: calc(( 100% - 80px)/3);
	margin-right: 40px;
	margin-bottom: 40px
}

.list .block:nth-child(3n) {
	margin-right: 0;
}
</style>
</head>
<body>
	<%
	UploadBoardDao dao = new UploadBoardDao();
	List<UploadBoardDto> list = dao.getAllDatas();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	%>

	<a href="boardlist.jsp"
		style="padding: 20px; display: block; text-decoration: none; font-size: 30px; font-weight: 700;">리스트형
		목록 가기</a>

	<div class="list">

		<%
		for (int i = 0; i < list.size(); i++) {

			//1번열에 출력할번호
			int no = list.size() - i;
			//i번째 dto얻기

			UploadBoardDto dto = list.get(i);
		%>
		<div class="block">
			<div class="img_box">
				<img alt="" src="../save/<%=dto.getImgname()%>">
			</div>
			<div class="text_box">
				<div class="no">
					<span><%=dto.getNum()%></span>
				</div>
				<div class="title">
					<span><%=dto.getSubject()%></span>
				</div>
				<div class="writer">
					<span><%=dto.getWriter()%></span>
				</div>
				<div class="content">
					<span><%=dto.getContent()%></span>
				</div>
				<div class="day">
					<span><%=sdf.format(dto.getWriteday())%></span>
				</div>
				<div class="count">
					<span><%=dto.getReadcount()%></span>
				</div>
			</div>
		</div>
		<%
		}
		%>
	</div>
</body>
</html>