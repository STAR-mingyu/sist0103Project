<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>
<style>
.table-success {
	font-size: 16px
}
</style>
</head>
<body>
	<div style="margin: 100px; width: 500px">
		<form action="member/addAction.jsp" method="post"
			onsubmit="return check(this)">
			<table class="table table-bordered" style="width: 500px">
				<caption align="top">
					<b>회원가입</b>
				</caption>
				<tr>
					<th width="100" class="table-success">아이디</th>
					<td>
						<div class="d-inline-flex">
							<input type="text" name="id" maxlength="8" class="form-control"
								required="required" style="width: 120px" id="id">
							<button type="button" class="btn btn-danger" id="btnIdCheck"
								style="margin-left: 20px">중복체크</button>
							<span class="idsuccess"
								style="margin-left: 20px; font-size: 12px; display: flex; align-items: center;"></span>
						</div>
					</td>
				</tr>
				<tr>
					<th width="100" class="table-success">비밀번호</th>

					<td>
						<div class="d-inline-flex">
							<input type="password" name="pass" class="form-control"
								required="required" style="width: 140px" placeholder="비밀번호">
							<input type="password" name="pass2" class="form-control"
								required="required" style="width: 140px; margin-left: 20px"
								placeholder="비밀번호 확인">
						</div>

					</td>

				</tr>

				<tr>
					<th width="100" class="table-success">이름</th>
					<td><input type="text" name="name" class="form-control"
						required="required" style="width: 120px"></td>
				</tr>
				<tr>
					<th width="100" class="table-success">핸드폰</th>
					<td><input type="tel" name="hp" class="form-control"
						required="required" style="width: 120px"></td>
				</tr>
				<tr>
					<th width="100" class="table-success">주소</th>
					<td><input type="tel" name="addr" class="form-control"
						required="required" style="width: 120px"></td>
				</tr>
				<tr>
					<th width="100" class="table-success">이메일</th>
					<td>
						<div class="d-inline-flex">
							<input type="text" name="email" class="form-control"
								required="required" style="width: 80px"><b
								style="margin-left: 20px">@</b> <input type="text" name="email2"
								id="email2" class="form-control" required="required"
								style="width: 80px; margin-left: 20px"> <select
								id="selemail" class="form-control" style="margin-left: 20px">
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
						<button type="submit" class="btn btn-outline-info">가입하기</button>
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