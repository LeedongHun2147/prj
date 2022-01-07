<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Food" %>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />

<% String cartId = session.getId(); %>

		<div class="row">
			
		</div>
		<div class="container" style="padding-bottom: 50px">
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
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
			<a href="./deleteCart.jsp?cartId=<%= cartId %>" class="badge badge-danger">삭제하기</a>
			<a href="./orderProcess.jsp" class="badge badge-success">주문하기</a>
			<%-- <table  class="table table-hover">
				<tr>
					<td><a href="./deleteCart.jsp?cartId=<%= cartId %>" class="btn btn-danger">삭제하기</a></td>
					<td><a href="./shippingInfo.jsp?cartId=<%= cartId %>" class="btn btn-success">주문하기</a></td>
				</tr>
			</table> --%>
		</div>