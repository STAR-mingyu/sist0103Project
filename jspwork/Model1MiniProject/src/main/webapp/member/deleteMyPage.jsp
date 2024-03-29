<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");
String pass = request.getParameter("pass");

//dao
MemberDao dao = new MemberDao();

//비번체크해서 맞으면 삭제
boolean b = dao.isEqualPass(num, pass);

if (b) {
	dao.deleteMember(num);

	//세션삭제
	session.removeAttribute("loginok");
	session.removeAttribute("myid");
	session.removeAttribute("saveok");
%>
<script type="text/javascript">
	alert("회원탈퇴성공!!!");
	location.href = "../index.jsp";
</script>
<%
} else {
%>

<script type="text/javascript">
	alert("비밀번호가 맞지않습니다");
	history.back();
</script>
<%
}
%>