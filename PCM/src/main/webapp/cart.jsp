<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Food" %>
<%-- 
<%@ page import="dao.ProductRepository" %> --%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="utf-8">
<% String cartId = session.getId(); %>
<title>장바구니</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="./deleteCart.jsp?cartId=<%= cartId %>" class="btn btn-danger">삭제하기</a></td>
					<td align="right"><a href="./shippingInfo.jsp?cartId=<%= cartId %>" class="btn btn-success">주문하기</a></td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				<%@ include file="dbconn.jsp" %>
				<%
					int sum = 0;
				ArrayList<Food> cartList = (ArrayList<Food>) session.getAttribute("cartlist");
				if(cartList == null){
					cartList = new ArrayList<Food>();
				}
				for(int i = 0; i < cartList.size(); i++) {
					Food food_item = cartList.get(i);
					int total = food_item.getPrice() * food_item.getQuantity();
					sum = sum + total;
				%>
				<tr>
					<th><%= food_item.getFood_name() %></th>
					<th><%= food_item.getPrice() %></th>
					<th><%= food_item.getQuantity() %></th>
					<th><%= total %></th>
					<th><a href="./removeCart.jsp?id=<%= food_item.getFood_name() %>" class="badge badge-danger">삭제</a></th>
				</tr>
				<%
					}
				%>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%= sum %></th>
					<th></th>
				</tr>
			</table>
			<a href="./products.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
		</div>
		<hr>
	</div>
</body>
</html>