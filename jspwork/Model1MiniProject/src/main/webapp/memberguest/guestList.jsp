<%@page import="data.dao.AnswerGuestDao"%>
<%@page import="data.dto.AnswerGuestDto"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.dto.GusetDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.GusetDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>

</head>
<body>
	<%
	//로그인 상태 확인
	String loginok = (String) session.getAttribute("loginok");
	String myid = (String) session.getAttribute("myid");
	%>

	<%
	if (loginok != null) {
	%>
	<jsp:include page="guestForm.jsp"></jsp:include>
	<%
	}
	%>
	<div style="margin: 50px 100px" class="guestlist">
		<%
		MemberDto memdto = new MemberDto();
		MemberDao memdao = new MemberDao();
		GusetDao dao = new GusetDao();

		//전체갯수
		int totalCount = dao.getTotalCount();
		int perPage = 5; //한페이지당 보여질 글의 갯수
		int perBlock = 5; //한블럭당 보여질 페이지 갯수
		int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이0번,오라클은 1번);
		int startPage; //각블럭당 보여질 시작페이지
		int endPage; //각블럭당 보여질 끝페이지
		int currentPage; //현재페이지
		int totalPage; //총페이지수
		int no; //각페이지당 출력할 시작번호

		//현재페이지 읽는데 단 null일경우는 1페이지로 준다
		if (request.getParameter("currentPage") == null)
			currentPage = 1;
		else
			currentPage = Integer.parseInt(request.getParameter("currentPage"));

		//총페이지수 구한다
		//총글갯수/한페이지당보여질갯수로 나눔(7/5=1)
		//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
		totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

		//각블럭당 보여질 시작페이지
		//perBlock=5일경우 현재페이지가 1~5일경우 시작페이지가1,끝페이지가 5
		//현재가 13일경우 시작:11 끝:15
		startPage = (currentPage - 1) / perBlock * perBlock + 1;
		endPage = startPage + perBlock - 1;

		//총페이지가 23일경우 마지막블럭은 끝페이지가 25가 아니라 23
		if (endPage > totalPage)
			endPage = totalPage;

		//각페이지에서 보여질 시작번호
		//1페이지:0, 2페이지:5 3페이지: 10.....
		startNum = (currentPage - 1) * perPage;

		//각페이지당 출력할 시작번호 구하기
		//총글개수가 23  , 1페이지:23 2페이지:18  3페이지:13
		no = totalCount - (currentPage - 1) * perPage;

		//페이지에서 보여질 글만 가져오기
		List<GusetDto> list = dao.getList(startNum, perPage);
		//List<SimpleBoardDto>list=dao.getAllDatas();

		if (list.size() == 0 && currentPage != 1) {
		%>
		<script type="text/javascript">
    location.href = "index.jsp?main=memberguest/guestList.jsp?currentPage=<%=currentPage - 1%>
			";
		</script>
		<%
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//int count=list.size();
		%>
		<div class="total">
			<p>
				총<span><%=totalCount%></span>개의 게시글이 있습니다
			</p>

		</div>

		<%
		if (totalCount == 0) {
		%>
		<div class="total">
			<p>등록된 게시물이 없습니다</p>
		</div>
		<%
		} else {
		int num = (currentPage - 1) * perPage; // 현재 페이지에서 시작하는 게시물 번호
		for (int i = 0; i < list.size(); i++) {
			GusetDto dto = list.get(i);
			num++; // 각 게시물마다 번호를 1씩 증가시킴
		%>
		<div class="block">
			<div class="top">
				<div>
					<div class="no">
						(<%=num%>)
					</div>
					<div class="id"><%=dto.getMyid()%></div>
					<div class="answer">
						<%
						//각방명록에 달린 댓글 목록 가져오기
						AnswerGuestDao adao = new AnswerGuestDao();
						List<AnswerGuestDto> alist = adao.getAllAnswers(dto.getNum());
						%>
						<span class="span">댓글 <%=alist.size()%></span> <span class="chu"
							num=<%=dto.getNum()%>> <i
							class="bi bi-suit-heart-fill heart"><%=dto.getChu()%></i>
						</span>
					</div>
				</div>
				<div class="day"><%=sdf.format(dto.getWriteday())%></div>
			</div>
			<div class="body">
				<div class="content">
					<p><%=dto.getContetn()%></p>
				</div>
				<div class="img">
					<img alt="" src="save/<%=dto.getPhotoname()%>">
				</div>
				<div class="comment">
					<%
					if (loginok != null) {
					%>
					<div class="comment_form">
						<form action="memberguest/answerInsert.jsp" method="post">
							<input type="hidden" name="num" value="<%=dto.getNum()%>">
							<input type="hidden" name="myid" value="<%=myid%>"> <input
								type="hidden" name="currentPage" value="<%=currentPage%>">
							<table>
								<tr>
									<td width="500"><textarea
											style="width: 480px; height: 70px;" name="content"
											required="required" class="form-control"></textarea></td>
									<td>
										<button type="submit" class="btn btn-info"
											style="width: 70px; height: 70px;">등록</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
					<%
					}
					%>
					<div class="comment_list">
						<table style="width: 500px">
							<%
							for (AnswerGuestDto adto : alist) {
							%>
							<tr>
								<td class="user"><i class="bi bi-person-circle"></i></td>
								<td>
									<%
									//작성자명
									String aname = memdao.getName(adto.getMyid());
									%> <b><%=aname%></b> &nbsp; <%
 //글작성자와 댓글작성자가 같을경우
 if (dto.getMyid().equals(adto.getMyid())) {
 %> <span style="color: red;">작성자</span> <%
 }
 %> <span style="font-size: 14px; color: #ccc; margin-left: 20px"><%=sdf.format(adto.getWriteday())%></span>
									<!-- 댓글 수정삭제는 보인만 보이게 --> <%
 if (loginok != null && adto.getMyid().equals(myid)) {
 %> <i class="bi bi-pencil-square answer_update"
									idx="<%=adto.getIdx()%>"></i> <i
									class="bi bi-trash-fill delete" idx="<%=adto.getIdx()%>"></i> <%
 }
 %> <br> <span style="font-size: 14px"><%=adto.getContent()%></span>
								</td>
							</tr>
							<%
							}
							%>
						</table>

					</div>
				</div>
			</div>

			<%
			if (loginok != null && dto.getMyid().equals(myid)) {
			%>
			<div class="guest_btn">
				<i class="bi bi-pencil-square"
					onclick="location.href='index.jsp?main=memberguest/updateForm.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>'"></i>
				<i class="bi bi-trash-fill del" num=<%=dto.getNum()%>
					currentPage=<%=currentPage%>></i>

			</div>
			<%
			}
			%>


		</div>
		<%
		}
		}
		%>
	</div>

	<ul class="pagination justify-content-center">
		<%
		//이전
		if (startPage > 1) {
		%>
		<li class="page-item "><a class="page-link"
			href="index.jsp?main=memberguest/guestList.jsp?currentPage=<%=startPage - 1%>"
			style="color: black;">이전</a></li>
		<%
		}
		for (int pp = startPage; pp <= endPage; pp++) {
		if (pp == currentPage) {
		%>
		<li class="page-item active"><a class="page-link"
			href="index.jsp?main=memberguest/guestList.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
		<%
		} else {
		%>
		<li class="page-item"><a class="page-link"
			href="index.jsp?main=memberguest/guestList.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
		<%
		}
		}

		//다음
		if (endPage < totalPage) {
		%>
		<li class="page-item"><a class="page-link"
			href="index.jsp?main=memberguest/guestList.jsp?currentPage=<%=endPage + 1%>"
			style="color: black;">다음</a></li>
		<%
		}
		%>

	</ul>


	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">댓글 수정</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">


					<input type="hidden" name="idx" id="idx"> <input
						type="text" name="content" id="ucontent">
					<button type="button" class="btn btn-warning answer_update_btn">수정</button>

				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal">닫기</button>
				</div>

			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
	 $("i.heart").click(function() {
		 
	        var num = $(this).parent("span").attr("num");
	        //alert(num);
	        var clickedSpan = $(this).parent();
	        var target = $(this);
	        $.ajax({
	            type: "post",
	            dataType: "json",
	            url: "memberguest/updateIncreChu.jsp",
	            data: {
	                "num": num	
	            },
	            success: function(data) {
	            	target.text(data.chu);
	            }
	        });
	    });
	 
	 //삭제
$("i.del").click(function(){
    var num = $(this).attr("num");
    var currentPage = $(this).attr("currentPage");
    var yes = confirm("정말 삭제하시겠어요?");
    if(yes) {
        location.href = 'memberguest/deleteAction.jsp?num=' + num + "&currentPage=" + currentPage;
    }
});
	 
	 //댓글부분은 무조건 처음에는 안보이게 처리
	 $(".comment").hide();
	 //댓글 클릭시 댓글 부분이 보였다 안보였다 하기
	 $(".answer .span").click(function(){
		 $(this).parents(".block").find(".comment").toggle();
	 })
	 
	 $(".comment_list i.delete").click(function(){
		 
		 var a = confirm("삭제하려면 [확인]을 눌러주세요");
		 
		 if (a) {
			 
		 var idx = $(this).attr("idx");
		 //alert(idx);
		 $.ajax({
			 type:"get",
			 dataType:"html",
			 url:"memberguest/deleteAnswer.jsp",
			 data:{
				 "idx":idx
			 },
			 success:function(){
				location.reload();
			 }
		 });
		 }	
	 })
	 
	 $(".answer_update").click(function(){
		 $("#myModal").modal("show");
		 var idx =  $(this).attr("idx");
		 //alert(idx);
		 $("#idx").val(idx);
		 
		 $.ajax({
			 type:"get",
			 dataType:"json",
			 url:"memberguest/answerContent.jsp",
			 data:{
				 "idx":idx
			 },
			 success:function(res){
				 alert("dsf")
				 $("#idx").val(res.idx);
				 $("#ucontent").val(res.story);
			
			 }
		 })
	 });
	 $("button.answer_update_btn").click(function(){
		 var content = $("#ucontent").val();
		 //alert(content);
		 var idx2 = $("#idx").val();
		 //alert(idx2);
		 
		 $.ajax({
			 type:"get",
			 dataType:"html",
			 url:"memberguest/updateAnswer.jsp",
			 data:{
				 "content":content,
				 "idx":idx2
			 },
			 success:function(){
				 location.reload();
			 }
		 })
	 });
	 
	
</script>
</body>
</html>