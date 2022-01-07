<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/manage.css" />
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>식품 수정</title>
</head>
<body>
	<jsp:include page="mheader.jsp"></jsp:include>
	<div class="container">
		<div class="col-lg-8">
				<div class="page-header">
					<h1 class="display-3" style="padding: 30px; font-weight: bold;">식품수정</h1>
				</div>
			</div>
	</div>
	<%@ include file="dbconn.jsp"%>
	<%
		String food_name = request.getParameter("food_name");
	
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
				
		String sql = "select * from food where food_name = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, food_name);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="./resources/img/<%=rs.getString("file_Name")%>" alt="image" style="width: 100%">
			</div>
			<div class="col-md-7">
				<form action="./food_update_process.jsp" name="newFood" class="form-horizontal"
				method="post" enctype="multipart/form-data">
					<div class="form-group row" style="display: none">
						<label class="col-sm-2">상품이름</label>
						<div class="col-sm-3">
							<input type="text" id="n_food_name" name="n_food_name" class="form-control" value='<%=rs.getString("food_name")%>'readonly >
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상품이름</label>
						<div class="col-sm-3">
							<input type="text" id="food_name" name="food_name" class="form-control" value='<%=rs.getString("food_name")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상품 분류</label>
						<div class="col-sm-3">
							<input type="text" id="category" name="category" class="form-control" value='<%=rs.getString("category")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">가격</label>
						<div class="col-sm-3">
							<input type="text" id="price" name="price" class="form-control" value='<%=rs.getString("price")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">재고 수</label>
						<div class="col-sm-3">
							<input type="text" id="stock" name="stock" class="form-control" value='<%=rs.getString("stock")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">이미지</label>
						<div class="col-sm-5">
							<input type="file" name="file_Name" class="form-control">
						</div>
					</div>
					<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10 ">
						<input type="button" class="btn btn-primary" value="등록"
							onclick="CheckFood()">
					</div>
				</div>
				</form>
			</div>
		</div>
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

</body>
</html>