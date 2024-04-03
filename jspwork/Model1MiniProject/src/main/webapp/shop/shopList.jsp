<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<jsp:include page="../include/header.html"></jsp:include>


<title>Insert title here</title>
<style type="text/css">
body {
	padding: 10px;
}

#exTab1 .tab-content {
	color: white;
	background-color: #428bca;
	padding: 5px 15px;
}

#exTab2 h3 {
	padding: 5px 15px;
}

/* remove border radius for the tab */
#exTab1 .nav-pills>li>a {
	border-radius: 0;
}

/* change border radius for the tab , apply corners on top*/
#exTab3 .nav-pills>li>a {
	border-radius: 4px 4px 0 0;
}

#exTab3 .tab-content {
	color: white;
	background-color: #428bca;
	padding: 5px 15px;
}

.container {
	margin-top: 80px;
}

img.photo {
	width: 200px;
	height: 230px;
	border: 1px solid gray;
}

.shoptable {
	padding: 10px;
}

a:hover, a:focus {
	color: #2a6496;
	text-decoration: none;
}

.nav-tabs>li>a {
	font-size: 18px;
}

.goDetail {
	font-size: 16px;
}
</style>
</head>
<body>
	<%
	ShopDao dao = new ShopDao();
	List<ShopDto> list = dao.listShop();
	NumberFormat nf = NumberFormat.getCurrencyInstance();
	%>


	<div id="exTab2" class="container">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#1" data-toggle="tab">전체</a></li>
			<li><a href="#2" data-toggle="tab">아우터</a></li>
			<li><a href="#3" data-toggle="tab">상의</a></li>
			<li><a href="#4" data-toggle="tab">하의</a></li>
			<li><a href="#5" data-toggle="tab">세트</a></li>
			<li><a href="#6" data-toggle="tab">악세사리</a></li>
		</ul>

		<div class="tab-content ">
			<div class="tab-pane active" id="1">
				<table class="shoptable">
					<tr>
						<%
						int i = 0;
						for (ShopDto dto : list) {
							//20~50까지 난수 발생
							int sale = (int) (Math.random() * 31) + 20;
						%>
						<td><a href="javascript:;" shopnum="<%=dto.getShopnum()%>"
							style="cursor: pointer;" class="goDetail"> <img alt=""
								src="shopsave/<%=dto.getPhoto()%>" class="photo"
								style="margin-bottom: 20px;"> <br> <%=dto.getSangpum()%>
								<br> <b style="color: red; font-size: 16px;"><%=sale%>%</b>
								<span>
									<div style="color: gray; font-size: 12px;">
										<%
										int price = (int) (dto.getPrice() - (dto.getPrice() * (sale / 100.0)));
										%>
										<strike style="font-size: 14px"> <%=nf.format(dto.getPrice())%>
										</strike>
									</div>
									<div style="font-size: 14px">
										<%=nf.format(price)%>
									</div>
							</span>
						</a></td>
						<%
						if ((i + 1) % 6 == 0) {
						%>
					</tr>
					<tr>
						<%
						}
						i++;
						}
						%>
					</tr>
				</table>

			</div>
			<div class="tab-pane" id="2">
				<table class="shoptable table table-bordered" style="width: 50px;">
					<tr>
						<%
						i = 0;
						for (ShopDto dto : list) {
							if (dto.getCategory().equals("아우터")) {
								//20~50까지 난수발생
								int sale = (int) (Math.random() * 31) + 20;
						%>
						<td><a shopnum="<%=dto.getShopnum()%>"
							style="cursor: pointer;" class="goDetail"> <img alt=""
								src="shopsave/<%=dto.getPhoto()%>" class="photo"> <br>
								<%=dto.getSangpum()%><br> <b style="color: red;"><%=sale%>%</b>
								<span style="float: right;">
									<div style="color: gray; font-size: 12px;">
										<%
										int price = (int) (dto.getPrice() - (dto.getPrice() * (sale / 100.0)));
										%>
										<strike><%=nf.format(dto.getPrice())%></strike>
									</div>
									<div>
										<%=nf.format(price)%>
									</div>
							</span>
						</a></td>

						<%
						if ((i + 1) % 6 == 0) {
						%>
					</tr>
					<tr>
						<%
						}
						i++;
						}
						}
						%>
					</tr>
				</table>
			</div>
			<div class="tab-pane" id="3">
				<table class="shoptable table table-bordered" style="width: 50px;">
					<tr>
						<%
						i = 0;
						for (ShopDto dto : list) {
							if (dto.getCategory().equals("상의")) {
								//20~50까지 난수발생
								int sale = (int) (Math.random() * 31) + 20;
						%>
						<td><a shopnum="<%=dto.getShopnum()%>"
							style="cursor: pointer;" class="goDetail"> <img alt=""
								src="shopsave/<%=dto.getPhoto()%>" class="photo"> <br>
								<%=dto.getSangpum()%><br> <b style="color: red;"><%=sale%>%</b>
								<span style="float: right;">
									<div style="color: gray; font-size: 12px;">
										<%
										int price = (int) (dto.getPrice() - (dto.getPrice() * (sale / 100.0)));
										%>
										<strike><%=nf.format(dto.getPrice())%></strike>
									</div>
									<div>
										<%=nf.format(price)%>
									</div>
							</span>
						</a></td>

						<%
						if ((i + 1) % 6 == 0) {
						%>
					</tr>
					<tr>
						<%
						}
						i++;
						}
						}
						%>
					</tr>
				</table>
			</div>
			<div class="tab-pane" id="4">
				<table class="shoptable table table-bordered" style="width: 50px;">
					<tr>
						<%
						i = 0;
						for (ShopDto dto : list) {
							if (dto.getCategory().equals("하의")) {
								//20~50까지 난수발생
								int sale = (int) (Math.random() * 31) + 20;
						%>
						<td><a shopnum="<%=dto.getShopnum()%>"
							style="cursor: pointer;" class="goDetail"> <img alt=""
								src="shopsave/<%=dto.getPhoto()%>" class="photo"> <br>
								<%=dto.getSangpum()%><br> <b style="color: red;"><%=sale%>%</b>
								<span style="float: right;">
									<div style="color: gray; font-size: 12px;">
										<%
										int price = (int) (dto.getPrice() - (dto.getPrice() * (sale / 100.0)));
										%>
										<strike><%=nf.format(dto.getPrice())%></strike>
									</div>
									<div>
										<%=nf.format(price)%>
									</div>
							</span>
						</a></td>

						<%
						if ((i + 1) % 6 == 0) {
						%>
					</tr>
					<tr>
						<%
						}
						i++;
						}
						}
						%>
					</tr>
				</table>
			</div>
			<div class="tab-pane" id="5">
				<table class="shoptable table table-bordered" style="width: 50px;">
					<tr>
						<%
						i = 0;
						for (ShopDto dto : list) {
							if (dto.getCategory().equals("세트")) {
								//20~50까지 난수발생
								int sale = (int) (Math.random() * 31) + 20;
						%>
						<td><a shopnum="<%=dto.getShopnum()%>"
							style="cursor: pointer;" class="goDetail"> <img alt=""
								src="shopsave/<%=dto.getPhoto()%>" class="photo"> <br>
								<%=dto.getSangpum()%><br> <b style="color: red;"><%=sale%>%</b>
								<span style="float: right;">
									<div style="color: gray; font-size: 12px;">
										<%
										int price = (int) (dto.getPrice() - (dto.getPrice() * (sale / 100.0)));
										%>
										<strike><%=nf.format(dto.getPrice())%></strike>
									</div>
									<div>
										<%=nf.format(price)%>
									</div>
							</span>
						</a></td>

						<%
						if ((i + 1) % 6 == 0) {
						%>
					</tr>
					<tr>
						<%
						}
						i++;
						}
						}
						%>
					</tr>
				</table>
			</div>
			<div class="tab-pane" id="6">
				<table class="shoptable table table-bordered" style="width: 50px;">
					<tr>
						<%
						i = 0;
						for (ShopDto dto : list) {
							if (dto.getCategory().equals("악세사리")) {
								//20~50까지 난수발생
								int sale = (int) (Math.random() * 31) + 20;
						%>
						<td><a shopnum="<%=dto.getShopnum()%>"
							style="cursor: pointer;" class="goDetail"> <img alt=""
								src="shopsave/<%=dto.getPhoto()%>" class="photo"> <br>
								<%=dto.getSangpum()%><br> <b style="color: red;"><%=sale%>%</b>
								<span style="float: right;">
									<div style="color: gray; font-size: 12px;">
										<%
										int price = (int) (dto.getPrice() - (dto.getPrice() * (sale / 100.0)));
										%>
										<strike><%=nf.format(dto.getPrice())%></strike>
									</div>
									<div>
										<%=nf.format(price)%>
									</div>
							</span>
						</a></td>

						<%
						if ((i + 1) % 6 == 0) {
						%>
					</tr>
					<tr>
						<%
						}
						i++;
						}
						}
						%>
					</tr>
				</table>
			</div>
		</div>
	</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script>
		$("a.goDetail")
				.click(
						function() {
							var shopnum = $(this).attr("shopnum");
							//alert(shopnum);
							location.href = "index.jsp?main=shop/datailPage.jsp&shopnum="
									+ shopnum;
						});
	</script>

</body>

</html>