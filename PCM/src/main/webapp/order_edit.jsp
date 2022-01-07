<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Order1" %>
<%@ page import="dto.Order_foods" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="utf-8">
<title>주문수정</title>
</head>
<body>
<% String order_id = (String) request.getParameter("orderid"); %>
	<jsp:include page="mheader.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문수정</h1>
		</div>
	</div>
	<div class="container">
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<%@ include file="dbconn.jsp" %>
				<tr>
					<th>주문번호</th>
					<th>주문자 ID</th>
					<th>주문시간</th>
					<th>주문 처리</th>
					<th></th>
				</tr>
				<%
				String sql = "select * from order1 where order_id = " + order_id;
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Order1 order1 = new Order1();
					order1.setOrder_id(rs.getInt("order_id"));
					order1.setId(rs.getString("id"));
					order1.setOrder_time(rs.getString("order_time"));
					order1.setServed(rs.getString("served"));
				}
				%>
				<tr>
					<th></th>
					<th>상품명</th>
					<th>수량</th>
					<th>가격</th>
					<th></th>
				</tr>
				<%
				int sum = 0;
				ArrayList<Order_foods> order_foods_list = new ArrayList<Order_foods>();
				sql = "select order_foods.*, food.price*order_foods.amount amtPrice from order_foods, food"
						 + " where order_foods.food_name = food.food_name and"
						 + " order_foods.order_id = " + order_id;
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Order_foods order_foods = new Order_foods();
					order_foods.setOrder_id(rs.getInt("order_id"));
					order_foods.setFood_name(rs.getString("food_name"));
					order_foods.setAmount(rs.getInt("amount"));
					order_foods.setAmtPrice(rs.getInt("amtPrice"));
					order_foods_list.add(order_foods);
					sum += order_foods.getAmtPrice();
				}
				for(int j = 0; j < order_foods_list.size(); j++) {
				%><%-- 
				<form name="<%= order_foods_list.get(j).getFood_name() %>_form" method="get" action="./order_edit_process.jsp?orderid=<%= order_id %>&fn=<%= order_foods_list.get(j).getFood_name() %>">
				<tr>
					<th></th>
					<th><%= order_foods_list.get(j).getFood_name() %></th>
					<th><input type="text" name="<%= order_foods_list.get(j).getFood_name() %>_amt" value="<%= order_foods_list.get(j).getAmount() %>"></th>
					<th><%= order_foods_list.get(j).getAmtPrice() %></th>
					<th><input type="submit" value="수량결정"></th>
				</tr>
				</form> --%>
				<form name="<%= order_foods_list.get(j).getFood_name() %>_form" method="get" action="./order_edit_process.jsp?">
				<tr>
					<th><input type="text" hidden="true" name="orderid" value="<%= order_id %>"></th>
					<th><%= order_foods_list.get(j).getFood_name() %>
						<input type="text" hidden="true" name="fn" value="<%= order_foods_list.get(j).getFood_name() %>">
						</th>
					<th><input type="text" name="amt" value="<%= order_foods_list.get(j).getAmount() %>"></th>
					<th><%= order_foods_list.get(j).getAmtPrice() %>
						</th>
					<th><input type="submit" value="수량결정"></th>
				</tr>
				</form>
				<% } %>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%= sum %></th>
					<th></th>
				</tr>
				<%
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
				%>
			</table><!-- 
			<a href="./products.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a> -->
		</div>
		<hr>
	</div>
</body>
</html>