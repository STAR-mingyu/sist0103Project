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
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<title>Insert title here</title>
<style>
body {
	padding: 120px 0;
	display: flex;
	justify-content: center;
}

table {
	position: relative;
}

.write_btn {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	top: -38px;
}

* {
	font-family: 'Pretendard Variable';
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

textarea {
	resize: none;
}

td, td {
	text-align: center;
}

td.title {
	cursor: pointer;
}
</style>
</head>
<body>
	<!-- 추가폼 -->
	<div class="board addform" style="margin: 50px 100px; width: 400px;">
		<form id="addfrm">
			<table class="table table-bordered">
				<caption align="top">
					<b>글쓰기</b>
				</caption>
				<tr>
					<th width="100" class="table-warning">작성자</th>
					<td><input type="text" name="witer" id="witer"
						class="form-control" required="required" style="width: 130px">
					</td>
				</tr>
				<tr>
					<th width="100" class="table-warning">제목</th>
					<td><input type="text" name="subject" id="subject"
						class="form-control" required="required" style="width: 130px">
					</td>
				</tr>
				<tr>
					<th width="100" class="table-warning">내용</th>
					<td><textarea style="width: 300px; height: 100px" name="story"
							required="required" class="form-control" id="story"></textarea></td>
				</tr>
				<tr>
					<th width="100" class="table-warning">이미지</th>
					<td><input type="hidden" name="image" id="image" width="100%">
						<select id="selimage" style="width: 100px" class="form-control">
							<option value="../image/avata/b1.png">사랑해</option>
							<option value="../image/avata/b2.png">우울함</option>
							<option value="../image/avata/b5.png">배고파</option>
							<option value="../image/avata/b6.png">좌절</option>
							<option value="../image/avata/b10.png">심심해</option>
							<option value="../image/avata/b8.png">최고</option>
					</select><br>
						<div id="imgview"></div></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="button" class="btn btn-danger" id="btninsert">DB추가</button>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<div class="board updateform">수정폼</div>
	<div class="board list">목록</div>
	<div class="board detailview">
		<table class="table table-bordered" style="width: 600px">
			<caption align="top">
				<b>게시물 확인</b>
			</caption>
			<tr>
				<td><span class="title"></span> <span class="day">날짜</span></td>
			</tr>
			<tr>
				<td><span class="witer">작성자</span> <span class="likes">
						<i class="bi bi-balloon-heart-fill" style="color: red"></i> <span
						class="su">0</span>
				</span></td>
			</tr>
			<tr>
				<td style="height: 200px" valign="top"><div class="story">내용</div>
					<span class="image">이미지</span></td>
			</tr>

			<tr>
				<td>
					<button type="button" class="btn btn-outline-info btn-sm"
						onclick="location.href='mainPage.jsp'">목록</button>
					<button type="button" class="addbtn btn btn-outline-info btn-sm">글쓰기</button>
					<button type="button" class="updatebtn btn btn-outline-info btn-sm">수정</button>
					<button type="button" class="deletebtn btn btn-outline-info btn-sm">삭제</button>
				</td>
			</tr>
		</table>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script>
		$(".addform").hide();
		$(".updateform").hide();
		$(".detailview").hide();
		//$(".list").hide();

		list();

		//이미지 선택시 
		$("#selimage").change(function() {
			var img = $(this).val();
			//alert(img);
			//이미지명을 현재값에 추가로 더하기
			$("#image").val(img);

			//아래 이미지뷰에 추가로 이미지가 보이게
			var s = "<img src ='" + img + "'width=50>";
			$("#imgview").html(s);
		})

		$("#btninsert").click(function() {
			var witer = $("#witer").val();
			var subject = $("#subject").val();
			var story = $("#story").val();
			var image = $("#selimage option").val();

			//alert(witer + subject + story + image);
			$.ajax({
				type : "get",
				dataType : "html",
				url : "insertWrite.jsp",
				data : {
					"witer" : witer,
					"subject" : subject,
					"story" : story,
					"image" : image
				},
				success : function() {

					list();
					$("#witer").val("");
					$("#subject").val("");
					$("#story").val("");
					$("#selimage option").val("");
					$("#imgview").empty();

					$(".addform").hide();
					$(".list").show();
				}
			})
		})

		//제목 클릭시 이벤트

		$(document).on("click", "table.board td.title", function() {
			var num = $(this).attr("num");
			//alert(num);

			$.ajax({
				type : "get",
				dataType : "json",
				url : "detDataWrite.jsp",
				data : {
					"num" : num
				},
				success : function(data) {
					$("span.title").html(data.subject);
					$("span.day").html(data.writeday);
					$("span.witer").html(data.writeday);
					$(".story").html("<pre>" + data.story + "</pre>");
					$(".image").html("<img src='" + data.image+"'>");

					$(".list").hide();
					$(".detailview").show();
				}

			})
		});

		//addbtn
		$(".addbtn").click(function() {
			$(".detailview").hide();
			$(".addform").show();
		});

		$(".deletebtn").click(function() {

		});

		//list
		function list() {
			$
					.ajax({
						type : "get",
						dataType : "json",
						url : "listWrite.jsp",
						success : function(res) {
							//alert(res.length);
							var s = "";

							s += "<table class='board table table table-bordered table-striped' style='display:flex'>";
							s += "<caption><button type='button' class='btn btn-info write_btn'>";
							s += "<i class='bi bi-pen'>글쓰기</i></button></caption>";
							s += "<tr>";
							s += "<td width='100'>번호</td>";
							s += "<td width='300'>제목</td>";
							s += "<td width='150'>작성자</td>";
							s += "<td width='200'>작성일</td>";
							s += "<td width='100'>추천</td>";
							s += "</tr>";

							var n = res.length;
							if (n == 0) {
								s += "<tr>";
								s += "<td colspan='5' align='center'>";
								s += "<b>게시된 글이 없습니다</b></td></tr>"
							} else {
								$
										.each(
												res,
												function(i, ele) {
													//출력
													s += "<tr>";
													s += "<td>" + (i + 1)
															+ "</td>";
													s += "<td class='title' num='" + ele.num + "'>"
															+ ele.subject
															+ "</td>";
													s += "<td>" + ele.witer
															+ "</td>";
													s += "<td>" + ele.writeday
															+ "</td>";
													s += "<td>" + ele.likes
															+ "</td>";
													s += "<tr>";

												})
							}
							s += "</table>"
							$(".list").html(s);
						}
					})
		}

		$(document).on("click", ".write_btn", function() {
			$(".addform").show();
			$(".list").hide();
		});
	</script>
</body>
</html>