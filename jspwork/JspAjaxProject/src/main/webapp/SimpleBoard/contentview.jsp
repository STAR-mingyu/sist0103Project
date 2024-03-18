<%@page import="SimpleBoard.SimpleBoardDto"%>
<%@page import="SimpleBoard.SimpleBoardDao"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	font-family: 'Pretendard Variable';
	box-sizing: border-box;
}

span.day {
	color: #ccc;
	font-size: 12px;
}

span.aday {
	float: right;
	font-size: 0.8em;
	color: #bbb;
}

div.alist {
	margin-left: 20px;
}
</style>
</head>
<body>
	<%
	String num = request.getParameter("num");
	SimpleBoardDao dao = new SimpleBoardDao();

	//dto
	SimpleBoardDto dto = dao.detail(num);

	//조회수 1증가
	dao.count(num);
	//날짜
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	%>

	<input type="hidden" id="num" value="<%=num%>">

	<div style="margin: 50px 100px; width: 500px">
		<table class="table table-bordered">
			<caption align="top">
				<b><%=dto.getSubject()%>&nbsp;&nbsp;&nbsp;&nbsp;조회<%=dto.getReadcount()%></b>
			</caption>
			<tr>
				<td><b>작성자 : <%=dto.getWriter()%></b></td>
				<p class="day"><%=sdf.format(dto.getWriteday())%></p>


			</tr>
			<tr>
				<td><%=dto.getContent()%></td>

			</tr>

			<!-- 댓글 -->
			<tr>
				<td><b class="acount">댓글<span>0</span></b>
					<div class="alist">
						<span>댓글목록</span>
					</div>
					<div class="input-group_box">
						<div class="aform input-group">
							<input type="text" id="nickname" class="form-control"
								style="width: 80px;" placeholder="닉네임"> <input
								type="text" id="content" class="form-control"
								style="width: 300px; margin-left: 10px" placeholder="댓글 메시지">
							<button type="button" id="btnsend" class="btn btn-info btn-sm"
								style="margin-left: 10px">저장</button>
						</div>
						<div class="updateform input-group">
							<input type="hidden" id="idx"> <input type="text"
								id="unickname" class="form-control" style="width: 80px;"
								placeholder="닉네임"> <input type="text" id="ucontent"
								class="form-control" style="width: 300px; margin-left: 10px"
								placeholder="댓글 메시지">
							<button type="button" id="btnaUsend"
								class="btn btn-warning btn-sm" style="margin-left: 10px">수정</button>
						</div>
					</div></td>

				</td>
			</tr>
			<tr>
				<td>
					<button type="button" class="btn btn-outline-info"
						onclick="location.href='boardlist.jsp'">목록</button>
					<button type="button" class="btn btn-outline-success"
						onclick="location.href='addform.jsp'">글쓰기</button>
					<button type="button" class="btn btn-outline-primary"
						onclick="location.href='updatepassform.jsp?num=<%=dto.getNum()%>'">수정</button>
					<button type="button" class="btn btn-outline-warning"
						onclick="location.href='deletePass.jsp?num=<%=dto.getNum()%>'">삭제</button>
				</td>
			</tr>
		</table>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script type="text/javascript">
		//ajax insert

		list();

		//alert(num);

		$("#btnsend").click(function() {
			var num = $("#num").val();
			var nickname = $("#nickname").val().trim();
			var content = $("#content").val().trim();

			if (nickname == "") {
				alert("닉네임을 입력후 저장해주세요");
				return false;
			}
			if (content == "") {
				alert("댓글 내용을 입력후 저장해주세요");
				return false;
			}
			$.ajax({
				type : "get",
				dataType : "html",
				url : "../simpleboardanswer/insertAnswer.jsp",
				data : {
					"num" : num,
					"nickname" : nickname,
					"content" : content
				},
				success : function() {
					list();
					$("#nickname").val("");
					$("#content").val("");
				}
			})

		})

		//댓글 글자 누르면 댓글창 나오게
		$("b.acount").click(function() {
			$(".input-group_box").toggle();

		});

		$("#btnaUsend").click(function() {
			var idx = $("#idx").val();
			var nick = $("#unickname").val();
			var content = $("#ucontent").val();
		
			$.ajax({
				type : "get",
				url : "../simpleboardanswer/updateAnswer.jsp",
				dataType : "html",
				data : {
					"idx" : idx,
					"nickname" : nick,
					"content" : content
				},
				success : function() {
					list();
					$(".updateform").hide();
					$(".aform").show();
				}
			})
		})

		//있던 수정창 안보이게
		$(".updateform").hide();

		//댓글리스트의 수정아이콘 누르면 수정댓글창에 해당idx의 내용 띄우기
		$(document).on("click", ".update_btn", function() {
			$(".aform").hide();
			$(".updateform").show();
			var idx = $(this).attr("idx");
			$("#idx").val(idx);
			$.ajax({
				type : "get",
				dataType : "json",
				url : "../simpleboardanswer/oneDataAnswer.jsp",
				data : {
					"idx" : idx
				},
				success : function(res) {
					$("#idx").val(res.idx);
					$("#unickname").val(res.nick);
					$("#ucontent").val(res.content);
				}
			})
		});

		function list() {
			console.log("list num=" + $("#num").val());
			//	alert($("#num").val());

			$
					.ajax({
						type : "get",
						url : "../simpleboardanswer/listAnswer.jsp",
						dataType : "json",
						data : {
							"num" : $("#num").val()
						},
						success : function(res) {
							// 댓글 개수 출력
							$("b.acount>span").text(res.length);
							var s = "";
							$
									.each(
											res,
											function(idx, item) {
												s += "<div>" + item.nick + ": "
														+ item.content;
												s += "<span class='aday'>"
														+ item.writeday
														+ "</span>";
												s += "<i class='bi bi-pencil-square amod update_btn' idx='" + item.idx + "'></i>";
												s += "<i class='bi bi-trash2 adel delete_btn' name='"+ item.idx+"'></i>";

											});
							$("div.alist").html(s);
						}
					});
		};

		$(document).on("click", ".delete_btn", function() {
			var idx = $(this).attr("name");
			$.ajax({
				type : "get",
				dataType : "html",
				url : "../simpleboardanswer/deleteAnswer.jsp",
				data : {
					"idx" : idx
				},
				success : function(idx, ele) {
					list();
				}
			})
		});
	</script>
</body>
</html>