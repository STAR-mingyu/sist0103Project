<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String num = request.getParameter("num");
String pass = request.getParameter("pass");
MemberDao dao = new MemberDao();
MemberDto dto = new MemberDto();

dto.setNum(num);
dto.setPass(pass);

boolean b = dao.isEqualPass(num, pass);

if (b) {
%>
<script type="text/javascript">
location.href = "../index.jsp?main=member/updateForm.jsp?num=<%=num%>";
</script>


<%
} else {
%>
<script type="text/javascript">
	alert("비밀번호가 틀렸습니다");
	history.back();
</script>


<%
}
%>