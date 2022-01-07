<%@page import="oracle.net.aso.p"%>
<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@ include file="dbconn.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionNoProductId.jsp" %>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet"
	href ="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<!--  link rel="stylesheet" href="./resources/css/bootstrap.min.css"-->
<title>상품 상세 정보</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%--
		String id = request.getParameter("id");
		ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductByid(id);
	--%>
	<%
	//	PreparedStatement pstmt = null;
	//	ResultSet rs = null;
		
		String productId = request.getParameter("id");
	
		String sql = "select * from product where p_id =?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
		/* 	
			String p_id = rs.grtString("p_id");
			String p_name = rs.getString("p_name");
			String p_unitPrice = rs.getInt("p_unitPrice");
			String p_description = rs.getString("p_description");
			String p_category = rs.getString("p_category");
			String p_manufacturer = rs.getString("p_manufacturer");
			String p_unitsInStock = rs.getInt("p_unitsInStock");
			String p_condition = rs.getString("p_condition");
			String p_fileName = rs.getString("p_fileName");
		 */
			
			Product p1 = new Product();
			p1.setProductId(rs.getString("p_id"));
			p1.setPname(rs.getString("p_name"));
			p1.setUnitPrice(rs.getInt("p_unitPrice"));
			p1.setDescription(rs.getString("p_description"));
			p1.setCategory(rs.getString("p_category"));
			p1.setManufacturer(rs.getString("p_manufacturer"));
			p1.setUnitsInStock(rs.getInt("p_unitsInStock"));
			p1.setCondition(rs.getString("p_condition"));
			p1.setFilename(rs.getString("p_fileName"));
			
		
		
		
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<!-- img src="C:/upload/<%=p1.getFilename()%>" style="width: 100%"-->
				<img src="./resources/images/<%=p1.getFilename()%>" style= "width: 100%">
			</div>
			<div class="col-md-6">
				<h3><%=p1.getPname()%></h3>
				<p><%=p1.getDescription() %>
				<p> <b>상품 코드 : </b><span class="badge badge-danger">
					<%=p1.getProductId()%></span>
				<p> <b>제조사</b> :<%=p1.getManufacturer() %>
				<p> <b>분류</b> :<%=p1.getCategory() %>
				<p> <b>재고 수</b> :<%=p1.getUnitsInStock() %>
				<h4><%=p1.getUnitPrice() %>원</h4>
				<p> <form name="addForm" action="./addCart.jsp?id=<%=p1.getProductId()%>" method="post">
				<p> <a href="#" class="btn btn-info" onclick="addToCart()"> 상품 주문 &raquo;</a>
					<a href="./cart.jsp" class="btn btn-warning"> 장바구니 &raquo; </a>
					<a href="./products.jsp" class="btn btn-secondary"> 상품목록 &raquo;</a>
					</form>
			</div>
			<%
		}
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>