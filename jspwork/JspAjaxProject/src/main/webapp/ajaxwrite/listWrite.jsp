<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ajaxwrite.model.AjaxwriteDao"%>
<%@page import="ajaxwrite.model.AjaxwriteDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
AjaxwriteDao dao = new AjaxwriteDao();
List<AjaxwriteDto> list = dao.dataList();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
JSONArray arr = new JSONArray();

for (AjaxwriteDto dto : list) {
	JSONObject ob = new JSONObject();

	ob.put("num", dto.getNum());
	ob.put("witer", dto.getWiter());
	ob.put("subject", dto.getSubject());
	ob.put("story", dto.getStory());
	ob.put("image", dto.getImage());
	ob.put("likes", dto.getLikes());
	ob.put("writeday", sdf.format(dto.getWriteday()));

	arr.add(ob);
}
%>

<%=arr.toString()%>