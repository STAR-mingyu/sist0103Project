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
</head>
<body>
	<div style="margin: 50px 100px; width: 500px">
		<form action="addMember.jsp" method="post"
			enctype="multipart/form-data" name="mfrm">
			<table class="table table-bordered">
				<caption align="top">
					<b>회원가입</b>
				</caption>
				<tr>
					<td width="120" class="table-primary">아이디</td>
					<td>
						<div class="d-inline-flex">
							<input type="text" class="form-control" style="width: 120px;"
								name="m_id" required="required" readonly="readonly">
							<button type="button" class="btn btn-danger btn-sm"
								style="margin-left: 20px" onclick="openId()">아이디 입력</button>
						</div>
					</td>

				</tr>

				<tr>
					<td width="120" class="table-primary">비밀번호</td>
					<td><input type="password" class="form-control"
						style="width: 120px" name="m_pass" required="required"></td>
				</tr>
				<tr>
					<td width="120" class="table-primary">회원명</td>
					<td><input type="text" class="form-control"
						style="width: 120px" name="m_name" required="required"></td>
				</tr>
				<tr>
					<td width="120" class="table-primary">사진</td>
					<td><input type="file" class="form-control"
						style="width: 200px" name="m_photo"></td>
				</tr>
				<tr>
					<td width="120" class="table-primary">핸드폰</td>
					<td><input type="tel" class="form-control"
						style="width: 180px" name="m_hp" required="required"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-info" id="btnsubmit">회원가입신청</button>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script>
		function openId() {
			window.open("idSearch.jsp", "idxcheck",
					"left=100px,top=100px,width=400,height=200");
		}

		$("#btnsubmit").click(function() {
			if (mfrm.m_id.value.length == 0) {
				alert("아이디 입력버튼을 눌러주세요");
				return false //form action 호출 안됨
			}
		})
	</script>
</body>
</html>