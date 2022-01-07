<%@page import="java.util.Collections"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Order1" %>
<%@ page import="dto.Order_foods" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/manage.css" />
<meta charset="utf-8">
<% 
	response.setIntHeader("Refresh", 5);
	int topOrder = -1;
%>
<title>주문목록</title>
<script language="javascript" for="dummy" event="onload">
//plan6이라는 frame이 onload될때 스크립트를 실행.
 var strCook = document.cookie;//저장된 쿠키 값을 받아온다.
 if(strCook.indexOf("!~")!=0) {
  var intS = strCook.indexOf("!~");
  var intE = strCook.indexOf("~!");
  var strPos = strCook.substring(intS+2, intE);//스크롤 위치를 구한다.
  document.body.scrollTop = strPos;//스크롤 위치를 적용시킨다.
  }
 document.dummy.resizeFrame(this);
</script>
<script type = "text/javascript">
	function SetDivPosition()
	{
		var intY = document.body.scrollTop;
		document.cookie = "yPos=!~"+intY+"~!";
	}	
 </script>
</head>
<body onscroll="SetDivPosition()">
	<jsp:include page="mheader.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3" style="padding: 30px; font-weight: bold;">주문목록</h1>
		</div>
	</div>
	<div class="container" name="">
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>주문번호</th>
					<th>주문자 ID</th>
					<th>주문시간</th>
					<th>주문 처리</th>
				</tr>
				<%@ include file="dbconn.jsp" %>
				<%
				ArrayList<Order1> order1list = new ArrayList<Order1>();
				String sql = "select * from order1 where served = 'N'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Order1 order1 = new Order1();
					order1.setOrder_id(rs.getInt("order_id"));
					order1.setId(rs.getString("id"));
					order1.setOrder_time(rs.getString("order_time"));
					order1.setServed("N");
					order1list.add(order1);
					if(rs.getInt("order_id") > topOrder) {
						topOrder = rs.getInt("order_id");
					}
				}
				Collections.sort(order1list);
				for(int i = 0; i < order1list.size(); i++) {
				%>
				<tr>
					<th><%= order1list.get(i).getOrder_id() %></th>
					<th><%= order1list.get(i).getId() %></th>
					<th><%= order1list.get(i).getOrder_time() %></th>
					<th><a href="./orderPurchase.jsp?orderid=<%= order1list.get(i).getOrder_id() %>" class="btn btn-danger">계산</a> 
					    <a href="./orderCancle.jsp?orderid=<%= order1list.get(i).getOrder_id() %>" class="btn btn-danger">취소</a></th>
				</tr>
				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th><a href="./order_edit.jsp?orderid=<%= order1list.get(i).getOrder_id() %>" class="btn btn-danger">주문 수정</a></th>
				</tr>
				<tr>
					<th></th>
					<th>상품명</th>
					<th>수량</th>
					<th>가격</th>
				</tr>
				<%
				rs = null;
				int sum = 0;
				ArrayList<Order_foods> order_foods_list = new ArrayList<Order_foods>();
				sql = "select order_foods.*, food.price*order_foods.amount amtPrice from order_foods, food"
						 + " where order_foods.food_name = food.food_name and"
						 + " order_foods.order_id = " + order1list.get(i).getOrder_id();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs != null) {
					//alert 띄우기
				}
				while(rs.next()) {
					Order_foods order_foods = new Order_foods();
					order_foods.setOrder_id(rs.getInt("order_id"));
					order_foods.setFood_name(rs.getString("food_name"));
					order_foods.setAmount(rs.getInt("amount"));
					order_foods.setAmtPrice(rs.getInt("amtPrice"));
					order_foods_list.add(order_foods);
				}
				for(int j = 0; j < order_foods_list.size(); j++) {
				%>
				<tr>
					<th></th>
					<th><%= order_foods_list.get(j).getFood_name() %></th>
					<th><%= order_foods_list.get(j).getAmount() %></th>
					<th><%= order_foods_list.get(j).getAmtPrice() %></th>
				</tr>
				<%
					sum += order_foods_list.get(j).getAmtPrice();
					}
				%>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%= sum %></th>
					<th></th>
				</tr>
				<%
					sum = 0;
					}
				
				if(session.getAttribute("lastTopOrder") == null) {
					%>
					<script> alert("새 주문이 들어왔습니다."); </script>
					<%
					session.setAttribute("lastTopOrder", topOrder);
				} else if((int)session.getAttribute("lastTopOrder") < topOrder) {
					%>
					<script> alert("새 주문이 들어왔습니다."); </script>
					<%
					session.setAttribute("lastTopOrder", topOrder);
				}
				
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
				%>
			</table><!-- 
			<a href="./products.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a> -->
		</div>
		<hr>
	</div>
	<form action="" name="dummy"></form>
</body>
</html>