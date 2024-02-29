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
<style>
span {
	font-weight: 700;
}
</style>
<body>

	<%request.setCharacterEncoding("utf-8");
String grade = request.getParameter("grade");
String[] lang = request.getParameterValues("lang");
String height = request.getParameter("height");
String weight = request.getParameter("weight");
String ipsaday = request.getParameter("ipsaday");
String like = request.getParameter("like");
%>

	<div class="result">
		<div>
			<p>
				최종 학년은 : <span><%=grade %></span>
			</p>
			<p>
				가능한 컴퓨터 언어는 :
				<%if(lang==null) {%>
                    
				<span>아무 언어도 못합니다</span>
				<%}else {
					for(int i=0;i<lang.length;i++) {%>
						<span>&nbsp;&nbsp;<%=lang[i] %></span>
					<%}
				}
				%>

			</p>
			<p>
				같은 조 하고 싶은 사람은 : <span><%=like %></span>
			</p>
			<p>
				키는 : <span><%=height %></span>
			</p>
			<p>
				몸무게는 : <span><%=weight %></span>
			</p>
			<p>
				날짜는 : <span><%=ipsaday %></span>
			</p>
		</div>
	</div>

</body>
</html>