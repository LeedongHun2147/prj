<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>메인메뉴</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
</head>
<body>
	<%@ include file="header.jsp"%>
	<%!String management = "SPRING PC방에 오신걸 환영합니다";%>
	
	<div class="container text-center">
		<h1 class="display-3" style="padding: 30px">
			<%=management%>
		</h1>
	</div>
	<main role="main">
		<div class="container">
			<div class="text-center">
				<div class="row">
					<div class="col lg">
						<a href="./chargeTime.jsp"> <img alt="시간충전"
							src="./resources/img/chargebtn.png" width="300" height="400">
						</a>
					</div>
					<div class="col lg">
						<a href="food_list.jsp"> <img alt="음식주문"
							src="./resources/img/orderfd.png" width="300" height="400">
						</a>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="./mfooter.jsp"%>
</body>
</html>