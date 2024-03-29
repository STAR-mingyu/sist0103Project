<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>
<style>
.table-success {
	font-size: 16px
}
</style>
<%
String num = request.getParameter("num");
System.out.println(num);
//String id = request.getParameter("id");
//String name = request.getParameter("name");
//String hp = request.getParameter("hp");
//String addr = request.getParameter("addr");

//System.out.println(email);

MemberDao dao = new MemberDao();
MemberDto dto = dao.getDataMember(num);
String email = dto.getEmail();
String[] parts = email.split("@");
String username = parts[0]; // 사용자 이름
String domain = parts[1]; // 도메인
%>
</head>
<body>
	<div style="margin: 100px;">
		<div class="common_title">회원정보 수정</div>

		<form action="member/updateAction.jsp" method="post"
			onsubmit="return check(this)">
			<input type="hidden" name="num" value="<%=num%>">
			<table class="table table-bordered" style="width: 500px">
				<caption align="top"></caption>
				<tr>
					<th width="100" class="table-success">아이디</th>
					<td><b><%=dto.getId()%></b></td>
				</tr>
				<tr>
					<th width="100" class="table-success">이름</th>
					<td><input type="text" name="name" class="form-control"
						required="required" style="width: 120px"
						value="<%=dto.getName()%>"></td>
				</tr>
				<tr>
					<th width="100" class="table-success">핸드폰</th>
					<td><input type="tel" name="hp" class="form-control"
						required="required" style="width: 120px" value="<%=dto.getHp()%>"></td>
				</tr>
				<tr>
					<th width="100" class="table-success">주소</th>
					<td><input type="tel" name="addr" class="form-control"
						required="required" style="width: 120px"
						value="<%=dto.getAddr()%>"></td>
				</tr>
				<tr>
					<th width="100" class="table-success">이메일</th>
					<td>
						<div class="d-inline-flex">
							<input type="text" name="email" class="form-control"
								required="required" style="width: 80px" value="<%=username%>"><b
								style="margin-left: 20px">@</b> <input type="text" name="email2"
								id="email2" class="form-control" required="required"
								style="width: 80px; margin-left: 20px" value="<%=domain%>">
							<select id="selemail" class="form-control"
								style="margin-left: 20px">
								<option value="-">직접입력</option>
								<option value="naver.com">네이버</option>
								<option value="nate.com">네이트</option>
								<option value="gmail.com">구글</option>
								<option value="daum.com">다음</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-info">수정하기</button>
						<button type="reset" class="btn btn-outline-danger">초기화</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script>
		$("#btnIdCheck").click(function() {
			var id = $("#id").val();
			$.ajax({
				type : "post",
				dataType : "json",
				url : "member/idCheck.jsp",
				data : {
					"id" : id
				},
				success : function(check) {
					if ($("#id").val() == "") {
						$("span.idsuccess").text("입력해주세요").css("color", "red");

					} else if (check.count == 1) {

						$("span.idsuccess").text("사용 불가").css("color", "red");
						$("#id").val("");
					} else {
						$("span.idsuccess").text("사용 가능").css("color", "blue");
					}

				},

			});
		})

		function check(f) {
			if (f.pass.value != f.pass2.value) {
				alert("비밀번호가 서로 다릅니다");
				//초기화 
				f.pass.value = "";
				f.pass2.value = "";
				return false; //action 호출하지 않는다
			}
		}

		$("#selemail").change(function() {
			var selVal = $(this).val();
			//alert(selVal);
			$("#email2").val(selVal);
		});
	</script>


</body>
</html>