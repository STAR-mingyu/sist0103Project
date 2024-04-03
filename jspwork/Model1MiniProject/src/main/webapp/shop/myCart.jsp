<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.CartDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShopDao"%>
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
.photo {
	width: 60px;
	height: 60px;
}

td {
	vertical-align: middle;
	cursor: pointer;
}

table tr th, td:first-child {
	text-align: center;
}

.sangpum {
	display: flex;
	font-size: 14px;
}

.sangpum .text {
	margin-left: 20px;
	font-size: 16px;
}

.price {
	text-align: center;
	font-size: 14px;
}
</style>
</head>
<body>
	<%
	String id = (String) session.getAttribute("myid");
	CartDao dao = new CartDao();
	List<HashMap<String, String>> list = dao.cartList(id);
	NumberFormat nf = NumberFormat.getNumberInstance();
	%>
</body>

<h4 class="alert alert-info" style="width: 1000px"><%=id%>님의 장바구니
</h4>


<table class="table table-striped" style="width: 1000px">
	<tr>
		<th style="width: 30px"><input type="checkbox" id="allcheck"
			name="check"></th>
		<th style="width: 200px">상품정보</th>
		<th style="width: 200px">상품금액</th>
	</tr>
	<%
	for (int i = 0; i < list.size(); i++) {
		HashMap<String, String> map = list.get(i);
		//사진 얻기
		String photo = map.get("photo");
	%>
	<tr>
		<td><input type="checkbox" name="idx" idx="<%=map.get("idx")%>"
			class="idx"></td>
		<td>
			<div class="sangpum" shopnum="<%=map.get("shopnum")%>">
				<img alt="" src="shopsave/<%=photo%>" class="photo">
				<div class="text">
					<div>
						상품명 : <span><%=map.get("sangpum")%></span>
					</div>
					<div>
						갯수 : <span><%=map.get("cnt")%></span>
					</div>
					<div>
						주문일 : <span><%=map.get("cartday")%></span>
					</div>

				</div>

			</div>
		</td>
		<%
		int price = Integer.parseInt(map.get("price"));
		int cnt = Integer.parseInt(map.get("cnt"));
		price *= cnt;
		%>
		<td class="price"><%=map.get("price")%>원
			<h6><%=nf.format(price)%>원
			</h6>
			<h6>
				<svg xmlns="http://www.w3.org/2000/svg" idx=<%=map.get("idx")%>
					width="16" height="16" fill="currentColor"
					class="bi bi-trash3-fill del" viewBox="0 0 16 16" class="del">
  <path
						d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5" />
</svg>
			</h6></td>

	</tr>
	<%
	}
	%>>
</table>
<button class="btn btn-warning delete_btn" type="button">선택삭제</button>
<div class="total">
	<%
	int total_price = 0; // 총 주문 금액을 저장할 변수
	for (int i = 0; i < list.size(); i++) {
		HashMap<String, String> map = list.get(i);
		// 각 상품의 가격을 정수형으로 변환하여 총 주문 금액에 더함
		total_price += Integer.parseInt(map.get("price"));
	}
	%>
	<span>총 주문금액 <%=total_price%>원
	</span>
</div>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script type="text/javascript">
	$("#allcheck").on("click", function() {
		var checked = $(this).is(":checked");

		if (checked) {
			$(this).parents("body").find('input').prop("checked", true);
		} else {
			$(this).parents("body").find('input').prop("checked", false);
		}
	});

	$(".sangpum").click(
			function() {
				var shopnum = $(this).attr("shopnum");
				//alert(shopnum);
				location.href = "index.jsp?main=shop/datailPage.jsp&shopnum="
						+ shopnum;

			});

	$(".delete_btn").click(function() {

		var check = $('input[name="idx"]:checked').length;
		//alert(check);
		if (check == 0) {
			alert("선택해주세요");
			return false;
		}

		$("input.idx:checked").each(function(i, elt) {
			var idx = $(this).attr("idx");
			//alert(idx);
			del(idx);
			location.reload();
		});

	});

	$(".del").click(function() {
		var idx = $(this).attr("idx");
		var a = confirm("삭제하려면 [확인]을 눌러주세요");
		if (a) {
			del(idx);
			location.reload();
		}

	});

	function del(idx) {
		$.ajax({
			data : "get",
			dataType : "html",
			url : "shop/artdelete.jsp",
			data : {
				"idx" : idx
			},
			success : function() {
				alert("성공!!!");

			}
		});
	}
</script>
</html>