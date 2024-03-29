<%@page import="data.dto.GusetDto"%>
<%@page import="data.dao.GusetDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>

<style>
.bi.bi-camera-fill {
	font-size: 24px;
	cursor: pointer;
}

.img_show {
	width: 300px;
}

td.img {
	width: 80px;
}
</style>
</head>
<body>
	<%
	//num,currentPage
	String num = request.getParameter("num");
	String currentPage = request.getParameter("currentPage");

	GusetDao dao = new GusetDao();
	GusetDto dto = dao.getData(num);
	%>
	<div style="margin: 50px 100px; width: 600px">
		<form action="memberguest/updateAction.jsp" method="post"
			enctype="multipart/form-data">
			<!-- nu, hidden : 페이징처리는 currentPage  hidden 처리 -->
			<input type="hidden" name="num" value="<%=num%>"> <input
				type="hidden" name="currentPage" value="<%=currentPage%>">
			<table class="table table-bordered">
				<caption align="top">
					<b>방명록 수정</b> <i class="bi bi-camera-fill"></i> <input type="file"
						name="photo" id="photo" style="visibility: hidden;"
						onchange="readURL(this);">
				</caption>
				<tr>
					<td><textarea style="width: 500px; height: 100px;"
							name="content" class="form-control" required>
    <%=dto.getContetn()%>
</textarea></td>
					<td style="vertical-align: middle;">
						<button type="submit" class="btn btn-info"
							style="width: 100px; height: 40px;">수정</button>
					</td>
					<td style="vertical-align: middle;" class="img"><img alt=""
						id="img_show"
						src="<%=(dto.getPhotoname() == null ? "" : "save/" + dto.getPhotoname())%>"></td>
				</tr>
			</table>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script>
		$(".bi.bi-camera-fill").click(function() {
			$("#photo").click();

		});

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById('img_show').src = e.target.result;
				};
				reader.readAsDataURL(input.files[0]);
			} else {
				document.getElementById('img_show').src = "";
			}
		}
	</script>
</body>
</html>