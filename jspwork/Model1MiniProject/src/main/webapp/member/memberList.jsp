<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>
<%
request.setCharacterEncoding("utf-8");
MemberDao dao = new MemberDao();
List<MemberDto> list = dao.getAllMembers();
SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
%>
</head>
<body>

	<div class="member_list">
		<table class="table">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>핸드폰</th>
				<th>주소</th>
				<th>이메일</th>
				<th>가입일</th>
				<th>편집</th>
			</tr>

			<%
			int no = 1;
			for (MemberDto dto : list) {
			%>
			<tr>
				<td><%=no++%></td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getId()%></td>
				<td><%=dto.getHp()%></td>
				<td><%=dto.getAddr()%></td>
				<td><%=dto.getEmail()%></td>
				<td><%=date.format(dto.getGaipday())%></td>
				<td>
					<button type="button" class="btn btn-danger btn-sm delete_btn"
						onclick="delete_btn('<%=dto.getNum()%>')">강퇴</button>
				</td>
			</tr>
			<%
			}
			%>
		</table>
	</div>

	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script>
		function delete_btn(num) {
			var delete_btn = confirm("정말 삭제하시겠습니까?");
			if (delete_btn) {
				location.href = 'member/memberDlete.jsp?num=' + num;
			}
		}
	</script>

</body>
</html>