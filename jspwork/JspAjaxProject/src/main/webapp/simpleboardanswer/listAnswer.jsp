<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="simpleboardanswer.model.SimpleboardanswerDto"%>
<%@page import="java.util.List"%>
<%@page import="simpleboardanswer.model.SimpleboardanswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");
SimpleboardanswerDao dao = new SimpleboardanswerDao();
List<SimpleboardanswerDto> list = dao.list(num);

JSONArray arr = new JSONArray();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

for (SimpleboardanswerDto dto : list) {
	JSONObject ob = new JSONObject();

	ob.put("idx", dto.getIdx());
	ob.put("num", dto.getNum());
	ob.put("nick", dto.getNickname());
	ob.put("content", dto.getContent());
	ob.put("writeday", sdf.format(dto.getWriteday()));

	arr.add(ob);
}
%>

<%=arr.toString()%>