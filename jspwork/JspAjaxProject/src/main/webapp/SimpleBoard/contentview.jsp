<%@page import="SimpleBoard.SimpleBoardDto"%>
<%@page import="SimpleBoard.SimpleBoardDao"%>
<%@page import="java.text.SimpleDateFormat"%>
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

<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	font-family: 'Pretendard Variable';
	box-sizing: border-box;
}

span.day {
	color: #ccc;
	font-size: 12px;
}
</style>
</head>
<body>
	<%
	String num = request.getParameter("num");
	SimpleBoardDao dao = new SimpleBoardDao();

	//dto
	SimpleBoardDto dto = dao.detail(num);
	//조회수 1증가
	dao.count(num);
	//날짜
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	%>

	<div style="margin: 50px 100px; width: 500px">
		<table class="table table-bordered">
			<caption align="top">
				<b><%=dto.getSubject()%>&nbsp;&nbsp;&nbsp;&nbsp;조회<%=dto.getReadcount()%></b>
			</caption>
			<tr>
				<td><b>작성자 : <%=dto.getWriter()%></b></td>
				<p class="day"><%=sdf.format(dto.getWriteday())%></p>


			</tr>
			<tr>
				<td><%=dto.getContent()%></td>

			</tr>
			<tr>
				<td>
					<button type="button" class="btn btn-outline-info"
						onclick="location.href='boardlist.jsp'">목록</button>
					<button type="button" class="btn btn-outline-success"
						onclick="location.href='addform.jsp'">글쓰기</button>
					<button type="button" class="btn btn-outline-primary"
						onclick="location.href='updatepassform.jsp?num=<%=dto.getNum()%>'">수정</button>
					<button type="button" class="btn btn-outline-warning"
						onclick="location.href='deletepassform.jsp?num=<%=dto.getNum()%>'">삭제</button>
				</td>
			</tr>
		</table>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</body>
</html>