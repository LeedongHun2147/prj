<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="./resources/css/manage.css">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>상품 등록</title>
</head>
<body>
	<jsp:include page="mheader.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">등록</h1>
		</div>
	</div>
	<div class="container">
		<div class="col-md-7">
			<form action="./food_insert_process.jsp" name="newFood"
			method="post" enctype="multipart/form-data">
				<div class="form-group row">
					<label class="col-sm-2">음식이름</label>
					<div class="col-sm-3">
						<input type="text" id="food_name" name="food_name"
							class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">분류</label>
					<div class="col-sm-3">
						<input type="text" id="category" name="category"
							class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">가격</label>
					<div class="col-sm-3">
						<input type="text" id="price" name="price" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">재고</label>
					<div class="col-sm-3">
						<input type="text" id="stock" name="stock" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">파일</label>
					<div class="col-sm-5">
						<input type="file" name="file_name" class="form-control">
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
</body>
</html>