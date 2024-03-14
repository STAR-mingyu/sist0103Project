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
<style type="text/css">
.table-info {
	width: 200px;
}

textarea {
	resize: none;
}
</style>
</head>
<body>
	<div style="margin: 50px 100px; width: 500px">
		<form action="addaction.jsp" method="post"
			enctype="multipart/form-data">
			<table class="table table-bordered">
				<tr>
					<th width="100" class="table-info">작성자</th>
					<td><input type="text" name="writer" class="form-control"
						style="width: 120px" required="required"></td>
				</tr>
				<tr>
					<th width="100" class="table-info">제목</th>
					<td><input type="text" name="subject" class="form-control"
						style="width: 300px" required="required"></td>
				</tr>
				<tr>
					<th width="100" class="table-info">사진 업로드</th>
					<td style="display: flex;"><input type="file" name="photo"
						class="form-control" style="width: 300px" required="required"
						onchange="readURL(this);"> <img alt="" src="" id="preshow"
						style="width: 40px; height: 40px; margin-left: 20px;"
						onerror="this.src='../image/Food/1.jpg'"></td>

				</tr>
				<tr>
					<th width="100" class="table-info">비밀번호</th>
					<td><input type="text" name="pass" class="form-control"
						style="width: 200px" required="required" id="password"></td>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="" cols=""
							style="width: 480px; height: 100px;" class="form-control"
							name="content" required="required"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" style="width: 100px;"
							class="btn btn-success btn-md submit">저장하기</button>
						<button type="button" style="width: 100px;"
							class="btn btn-warning btn-md"
							onclick="location.href='boardlist.jsp'">목록보기</button>
					</td>
				</tr>
			</table>
		</form>

	</div>
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script type="text/javascript">
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById('preshow').src = e.target.result;
				};
				reader.readAsDataURL(input.files[0]);
			} else {
				document.getElementById('preshow').src = "";
			}
		}

		var pwd = document.querySelector("#password");
		function checkPwd() {
			if (pwd.value.length < 4) {
				alert("4자리 이상의 비밀번호를 입력하세요");
				document.querySelector("#password").value = "";
				pwd.focus();
			}
		}

		$("button.submit").click(function() {
			checkPwd();
		});
	</script>
</body>
</html>