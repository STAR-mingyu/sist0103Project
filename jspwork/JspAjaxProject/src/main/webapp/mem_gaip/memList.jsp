<%@page import="memgaip.model.MemgaipDao"%>
<%@page import="memgaip.model.MemgaipDto"%>
<%@page import="java.util.List"%>
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

<title>Insert title here</title>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
MemgaipDao dao = new MemgaipDao();
List<MemgaipDto> list = dao.dataList();
%>
<style>
img {
	width: 50px;
	height: 50px;
	border: 1px solid gray;
}

th, th, td {
	text-align: center;
	vertical-align: middle;
}
</style>
</head>
<body>
	<div style="margin: 50px 100px; width: 1000px">
		<b>총<%=list.size()%>명의 회원이 가입되었습니다
		</b><br>
		<button type="button" class="btn btn-warning"
			onclick="location.href='addForm.jsp'"
			style="float: right; margin-left: 50px">회원가입</button>
		<table class="table table-bordered">
			<caption align="top">
				<b>전체 회원 명당</b>
			</caption>
			<tr class="table-success">
				<th width="80">번호</th>
				<th width="180">아이디</th>
				<th width="180">회원명</th>
				<th width="200">핸드폰</th>
				<th width="200">가입일</th>
				<th width="150">편집</th>
			</tr>
			<%
			int i = 1;
			for (MemgaipDto dto : list) {
			%>
			<tr>
				<td><%=i++%></td>
				<td><%=dto.getM_id()%></td>
				<td>
					<%
					if (dto.getM_photo() == null) {
					%> <img alt="" src="../image/연예인사진/noimage.png"
					class="rounded-circle"> <%
 } else {
 %> <img alt="" src="../upload/<%=dto.getM_photo()%>"
					class="rounded-circle"> <span style="display: block;"><%=dto.getM_name()%></span>
					<%
					}
					%>
				</td>
				<td><%=dto.getM_hp()%></td>
				<td><%=sdf.format(dto.getGaipday())%></td>
				<td>
					<button type="button" class="btn btn-success btn-sm"
						onclick="updateForm(<%=dto.getM_num()%>)">수정</button>
					<button type="button" class="btn btn-danger btn-sm"
						onclick="deleteForm(<%=dto.getM_num()%>)">삭제</button>
				</td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script>
		function deleteForm(m_num) {
			var url = "deletePassForm.jsp?m_num=" + m_num;
			var options = "width=400,height=400,left=50%,top=50%";
			window.open(url, "delete", options);
		}
		function updateForm(m_num) {
			var url = "updateForm.jsp?m_num=" + m_num;
			var options = "width=800,height=800,left=50%,top=50%";
			window.open(url, "delete", options);
		}
	</script>
</body>
</html>