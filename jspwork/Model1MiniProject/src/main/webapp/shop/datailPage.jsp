<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>

<style>
img.large {
	width: 400px;
	height: 500px;
}
</style>
</head>
<body>
	<%
	String shopnum = request.getParameter("shopnum");
	String loginok = (String) session.getAttribute("loginok");
	String myid = (String) session.getAttribute("myid");
	//아이디에 해당하는 멤버 시퀀스

	System.out.println(shopnum);
	MemberDao mdao = new MemberDao();
	String num = mdao.getNum(myid);

	ShopDao sdao = new ShopDao();
	ShopDto dto = sdao.getData(shopnum);

	NumberFormat nf = NumberFormat.getCurrencyInstance();
	%>

	<div style="margin: 50px 100px; width: 800px;">
		<form id="frm">
			<!-- hidden:장바구니 db에 넣어야 할것 -->
			<input type="hidden" name="shopnum" value="<%=dto.getShopnum()%>">
			<input type="hidden" name="num" value="<%=num%>">
			<table class="table">
				<tr>
					<td style="width: 500px;"><img alt=""
						src="shopsave/<%=dto.getPhoto()%>" class="large img-thumnail">
					</td>
					<td style="width: 300px">
						<h3>
							카테고리 :
							<%=dto.getCategory()%></h3>
						<h3>
							상품명 :
							<%=dto.getSangpum()%></h3>
						<h3>
							가격 :
							<%=nf.format(dto.getPrice())%></h3>
						<h4>
							갯수 : <input type="number" min="1" max="10" value="1" step="1"
								name="cnt">
						</h4> <br>
						<div style="margin-top: 100px; margin-left: 60px;">
							<button type="button" class="btn btn-info" id="btncart">장바구니</button>
							<button type="button" class="btn btn-success"
								onclick="location.href='index.jsp?main=shop/shopList.jsp'">상품목록</button>
						</div>
					</td>
				</tr>

			</table>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script type="text/javascript">
		$("#btncart").click(function() {
			var login = "<%=loginok%>";
			if (login == "null") {
				alert("먼저 로그인을 해주세요");
				return false;
			} else {
				//form태그 가져오기
				var data = $("#frm").serialize();
		        //alert(data);

				$.ajax({
					type : "get",
					dataType : "html",
					url : "shop/datailProcess.jsp",
					data:data,
					success : function() {
						var a = confirm("장바구니에 저장하였습니다\n장바구니로 이동하려면 [확인을 눌러주세요]");
						if(a){
							location.href="index.jsp?main=shop/myCart.jsp";
							
						} else {
							return false;
						}
					}
				})
			}

		});
	</script>
</body>
</html>