<%@page import="memgaip.model.MemgaipDao"%>
<%@page import="ajaxboard.AjaxBoardDao"%>
<%@page import="memgaip.model.MemgaipDto"%>
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
<%
String m_num = request.getParameter("m_num");
System.out.println("form " + m_num);

MemgaipDao dao = new MemgaipDao();
MemgaipDto dto = dao.getData(m_num);
%>
</head>
<body>
	<div style="margin: 50px 100px; width: 500px">
		<form action="updateMember.jsp" method="post"
			enctype="multipart/form-data" name="mfrm">
			<input type="hidden" value="<%=m_num%>" name="m_num">
			<table class="table table-bordered">
				<caption align="top">
					<b>정보 수정</b>
				</caption>
				<tr>
					<td width="120" class="table-primary">아이디</td>
					<td><b><%=dto.getM_id()%></b></td>
				</tr>
				<tr>
					<td width="120" class="table-primary">회원명</td>
					<td><input type="text" class="form-control"
						style="width: 120px" name="m_name" required="required"
						value="<%=dto.getM_name()%>"></td>
				</tr>
				<tr>
					<td width="120" class="table-primary">사진</td>
					<td><input type="file" class="form-control"
						style="width: 200px" name="m_photo" value="<%=dto.getM_photo()%>"></td>
				</tr>
				<tr>
					<td width="120" class="table-primary">핸드폰</td>
					<td><input type="tel" class="form-control"
						style="width: 180px" name="m_hp" required="required"
						value="<%=dto.getM_hp()%>"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-info" id="btnsubmit">회원
							정보 수정</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>