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
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
td {
	vertical-align: middle;
}
</style>
</head>
<body>
	<%
	UploadBoardDao dao = new UploadBoardDao();
	List<UploadBoardDto> list = dao.getAllDatas();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	%>
	<div style="margin: 50px 100px">
		<button type="button" class="btn btn-info"
			onclick="location.href='addform.jsp'">게시글 추가</button>
		<button type="button" onclick="location.href='boardlist2.jsp'"
			class="btn btn-success">앨범형 목록</button>
	</div>
	<h6 class="alert alert-info">
		총<%=list.size()%>개의 게시글이 있습니다
	</h6>
	<br>
	<br>
	<table class="table table-hover">
		<tr>
			<th width="80">번호</th>
			<th width="380">제목</th>
			<th width="160">작성자</th>
			<th width="250">작성일</th>
			<th width="100">조회</th>
		</tr>
		<%
		for (int i = 0; i < list.size(); i++) {

			//1번열에 출력할번호
			int no = list.size() - i;
			//i번째 dto얻기

			UploadBoardDto dto = list.get(i);
		%>
		<tr>
			<td><%=no%></td>

			<td><a href="content.jsp?num=<%=dto.getNum()%>"
				style="text-decoration: none; color: #000; font-weight: 600"> <%=dto.getSubject()%>
					<img alt="" src="../save/<%=dto.getImgname()%>">
			</a></td>
			<td><%=dto.getWriter()%></td>
			<td><%=sdf.format(dto.getWriteday())%></td>
			<td><%=dto.getReadcount()%></td>

		</tr>
		<%
		}
		%>
	</table>
</body>
</html>