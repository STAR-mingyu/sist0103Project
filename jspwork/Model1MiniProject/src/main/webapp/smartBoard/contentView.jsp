<%@page import="java.util.List"%>
<%@page import="oracle.jdbc.oracore.TDSPatch"%>
<%@page import="data.dto.SmartAnswerDto"%>
<%@page import="data.dao.SmartAnswerDao"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
.answer_list {
	margin-top: 20px;
	font-size: 16px;
}

.answer_list:first-child {
	margin-top: 40px;
}

.answer_list span.aday {
	color: #ddd;
	font-size: 14px;
	margin-left: 20px;
}

.answer_list span.icon {
	margin-left: 20px;
	cursor: pointer;
}

.answer_list span.icon i {
	margin-right: 10px;
}
</style>
</head>
<body>
	<%
	String num = request.getParameter("num");
	SmartDao dao = new SmartDao();
	SmartDto dto = dao.getData(num);

	String currentPage = request.getParameter("currentPage");
	System.out.println(num);
	//조회수1증가
	dao.updateReadcount(num);
	String idx = request.getParameter("idx");

	SmartAnswerDao answerDao = new SmartAnswerDao();
	SmartAnswerDto answerDto = answerDao.getData(idx);
	System.out.println(idx);
	%>

	<div class="smart_detail">
		<div class="block">
			<div class="head">
				<div>
					<div class="no">
						(<span><%=dto.getNum()%>)</span>
					</div>
					<div class="writer">
						작성자 :
						<%=dto.getWriter()%></div>
				</div>
				<div>
					<div class="day"><%=dto.getWriteday()%></div>
					<div class="count">
						조회수 :
						<%=dto.getReadcount()%></div>
				</div>

			</div>
			<div class="subject">
				제목 :
				<%=dto.getSubject()%></div>
			<div class="content">
				<p><%=dto.getContent()%></p>
			</div>
		</div>
	</div>
	<!-- 댓글 -->
	<table>
		<tr>
			<td><b class="acount">댓글<span></span></b>

				<div>댓글목록</div>

				<div class="aform d-inline-flex">
					<input type="text" id="ninkname" class="form-control"
						style="width: 100px" placeholder="닉네임" answernum=<%=dto.getNum()%>>
					<input type="text" id="content" class="form-control"
						style="width: 200px" placeholder="댓글메세지">
					<button type="button" id="btnsend" class="btn btn-info">저장</button>
				</div></td>
		</tr>
	</table>

	<!-- 댓글 list -->
	<div class="answer_list"></div>
	<!-- 버튼 -->
	<div class="smart_btn">
		<div class="btn btn-primary">
			<a href="index.jsp?main=smartBoard/boardList.jsp">목록</a>
		</div>
		<div class="btn btn-warning">
			<a href="index.jsp?main=smartBoard/smartform.jsp">글쓰기</a>
		</div>
		<div class="btn btn-success">
			<a href="#"
				onclick="location.href='index.jsp?main=smartBoard/updateform.jsp?num=<%=num%>&currentPage=<%=currentPage%>'">수정</a>
		</div>
		<div class="btn btn-danger">
			<a href="#" onclick="funcdel(<%=num%>,<%=currentPage%>)">삭제</a>
		</div>
	</div>

	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">수정하기</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<input type="hidden" id="hidden_idx">
					<div>
						제목 : <input type="text" id="update_nick">
					</div>
					<div>
						내용 : <input type="text" id="update_content">
					</div>


				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger update_btn"
						data-bs-dismiss="modal">수정</button>
				</div>

			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
	
	list();
	function funcdel(num, currentPage){
		 var ans = confirm("삭제하려면 [확인]을 눌러주세요");
		 if(ans) {
			 location.href = 'smartBoard/smartDelete.jsp?num=' + num + "&currentPage=" + currentPage;
		 }
	}
	
	$("#btnsend").click(function(){
		
	    var nickname = $("#ninkname").val();
	    var answernum = $("#ninkname").attr("answernum");
	    var content = $("#content").val();
	    if(nickname.length == 0) {
	    	alert("닉네임을 입력해주세요.");
	    	return;
	    }
	    if(content.length == 0) {
	    	alert("댓글을 입력해주세요.");
	    	return;
	    }
	    $.ajax({
	        type: "GET",
	        dataType: "html",
	        url: "smartAnswer/insertAnswer.jsp",
	        data: {
	            "nickname": nickname,
	            "content": content,
	            "answernum": answernum
	        },
	        success: function(){
	        	list();
	        	$("#ninkname").val("");
	        	$("#content").val("");
	        
	        }
	    });
	});
	function list() {
	    var num = $("#ninkname").attr("answernum");
	    $.ajax({
	        type: "get",
	        dataType: "json",
	        url: "smartAnswer/listAnswer.jsp",
	        data: {
	            "num": num
	        },
	        success: function(res) {
	            $("b.acount span").text(res.length);
	            var s = "";
	            $.each(res, function(idx, item) {
	                s += "<div class='answer_list'>" + item.nick + ": " + item.content;
	                s += "<span class='aday'>" + item.writeday + "</span>";
	                s += "<span class='icon'>";
	                s += "<i class='bi bi-pencil-fill update' idx='" + item.idx+ "'></i>";
	                s += "<i class='bi bi-trash del' idx='" + item.idx + "'></i>";
	                s += "</span>";
	                s += "</div>";
	            });
	            $(".answer_list").html(s); // 여기서 DOM 업데이트
	        }
	    });
	}
	
	//삭제
	$(document).on("click","i.del",function(){
		 var idx = $(this).attr("idx");
		//alert(idx);
		
		var ans = confirm("댓글을 삭제하려면 [확인]을 눌러주세요");
		 if(ans) {
			 $.ajax({
					type:"get",
					dataType:"html",
					url:"smartAnswer/deleteAnswer.jsp",
					data:{
						"idx":idx
					},
					success:function(){
						list();
					}
				 })
		 }
	
	})
	
$(document).on("click", "i.update", function(){
    var idx = $(this).attr("idx");
    //alert(idx);
    $.ajax({
    	type:"get",
    	dataType: "json",
    	data:{
    		"idx":idx
    	},
    	url:"smartAnswer/jsonUpdateForm.jsp",
    	success:function(a){
    		//alert("성공");
            $("#update_nick").val(a.nick);
    		$("#update_content").val(a.content);
    		$("#hidden_idx").val(idx);
    	}    
    });
    $("#myModal").modal("show");
});
	
	$(".update_btn").click(function(){
	var update_num	= $(this).parents("#myModal").find("#hidden_idx").val();
	var nickname = $("#update_nick").val();
	var content = $("#update_content").val();
		//alert(update_num);
		
		$.ajax({
			type:"get",
			dataType:"html",
			data:{
			"update_num" : update_num,
			"nickname" : nickname,
			"content" : content
			},
		url:"smartAnswer/updateAnswer.jsp",
		success:function(){
			list();
		}
		})
	})
</script>

</body>
</html>