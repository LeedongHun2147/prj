<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>SG PC 푸드 </title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<!-- 
<script type="text/javascript">
	function addToCart() {
		if(confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.formname.submit();
			/* location.reload(); */
		} else {
			document.formname.reset();
		}
	}
</script> -->
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container text-center" style="padding: 30px">
		<h1 class="display-3">SG PC 푸드팩토리</h1>
	</div>
	<div class="container">
		<table class="table table-hover">
			<tr class="table-dark text-center" style="font-weight: bold;">
				<td><a href="./food_list.jsp?ct_num=1">과자</a></td>
				<td><a href="./food_list.jsp?ct_num=2">요리</a></td>
	            <td><a href="./food_list.jsp?ct_num=3">라면</a></td>
	            <td><a href="./food_list.jsp?ct_num=4">음료</a></td>
			</tr>
		</table>
	</div>
	<div class="container" style="width: 75%;">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp"%>
			<%
			String category = "";
			String ct_num = request.getParameter("ct_num");
		
			if (ct_num == null) {
				ct_num = "0";
			}
			
			if (ct_num.toString().equals("1")) {
	            category = "과자류";
	         } else if (ct_num.toString().equals("2")) {
	            category = "요리";
	         } else if (ct_num.toString().equals("3")) {
	            category = "라면";
	         } else if (ct_num.toString().equals("4")) {
	            category = "음료";
	         } 
			//String category = request.getParameter("category");
			//PreparedStatement pstmt = null;
			//ResultSet rs = null;
			String sql = "select * from food where category = ?";
			//String sql = "select * from food where category = '" + category + "'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			while (rs.next()) {
			%>
			<div class="col-md-4">
				<div class="card mb-3">
					<h3 class="card-header"><%=rs.getString("food_name")%></h3>
					<img src="./resources/img/<%=rs.getString("file_name")%>"
						style="width: 100%; height: 400px">
					<div class="card-body">
						<p><%=rs.getString("price")%>원
						</p>
					</div>
					<a href="./addCart.jsp?food=<%=rs.getString("food_name")%>"
						class="btn btn-primary" onclick="addToCart()" role="button">담기
						&raquo;</a>
				</div>
			</div>
			<%
			}
			if (pstmt != null)
			pstmt.close();
			if (conn != null)
			conn.close();
			if (rs != null)
			rs.close();
			%>
		</div>
		<hr>
	</div>
	<div style="position: fixed; right: 0px; bottom: 0px; width: 25%; padding: 5px;">
		<!-- 미완 : 우측 고정 사이드바로 만들기 -->
		<%@ include file="food_list_cart.jsp"%>
	</div>
	<%@ include file="./mfooter.jsp"%>
</body>
</html>