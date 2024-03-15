<%@page import="SimpleBoard.SimpleBoardDto"%>
<%@page import="SimpleBoard.SimpleBoardDao"%>
<%@page import="uploadBoard.UploadBoardDto"%>
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
	String num = request.getParameter("num");
	System.out.println(num);

	SimpleBoardDao dao = new SimpleBoardDao();
	SimpleBoardDto dto = dao.detail(num);
	%>
	<div style="margin: 50px 100px; width: 500px">
		<form action="updateaction.jsp" method="post">
			<input type="hidden" name="num" value="<%=num%>">
			<table class="table table-bordered">
				<tr>
					<th width="100" class="table-info">작성자</th>
					<td><input type="text" name="writer" class="form-control"
						style="width: 120px" required="required"
						value="<%=dto.getWriter()%>"></td>
				</tr>
				<tr>
					<th width="100" class="table-info">제목</th>
					<td><input type="text" name="subject" class="form-control"
						style="width: 300px" required="required"
						value="<%=dto.getSubject()%>"></td>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="" cols=""
							style="width: 480px; height: 100px;" class="form-control"
							name="content" required="required"><%=dto.getContent()%></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" style="width: 100px;"
							class="btn btn-success btn-md submit">수정하기</button>
						<button type="button" style="width: 100px;"
							class="btn btn-warning btn-md"
							onclick="location.href='boardlist.jsp'">목록보기</button>
					</td>
				</tr>
			</table>
		</form>

	</div>
</body>
</html>