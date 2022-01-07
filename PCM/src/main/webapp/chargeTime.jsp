<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간충전</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
</head>

<script type="text/javascript">
var setTime = 0;
function addTime(hour) {
	if (confirm(hour + "시간 충전하시겠습니까?")) {
		location.href = "chargeTime_process.jsp?hour=" + hour;
	} else {		
		return
	}
}
</script>

<body>
	<jsp:include page="header.jsp" />
	<div class="h-100" align="center">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-header" style="padding: 30px">
					<h1>시간충전</h1>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg">
				<div class="card border-primary mb-3" style="max-width: 20rem;">
					<div class="card-body">
						<h4 class="card-title">1시간</h4>
						<p class="card-text">1000원</p>
					</div>
					<button type="button" class="btn btn-primary" onclick="addTime(1)">충전하기</button>
				</div>
			</div>
			<div class="col-lg">
				<div class="card border-primary mb-3" style="max-width: 20rem;">
					<div class="card-body">
						<h4 class="card-title">2시간</h4>
						<p class="card-text">1500원</p>
					</div>
					<button type="button" class="btn btn-primary" onclick="addTime(2)">충전하기</button>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg">
				<div class="card border-primary mb-3" style="max-width: 20rem;">
					<div class="card-body">
						<h4 class="card-title">3시간</h4>
						<p class="card-text">2000원</p>
					</div>
					<button type="button" class="btn btn-primary" onclick="addTime(3)">충전하기</button>
				</div>
			</div>
			<div class="col-lg">
				<div class="card border-primary mb-3" style="max-width: 20rem;">
					<div class="card-body">
						<h4 class="card-title">5시간</h4>
						<p class="card-text">3000원</p>
					</div>
					<button type="button" class="btn btn-primary" onclick="addTime(5)">충전하기</button>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg">
				<div class="card border-primary mb-3" style="max-width: 20rem;">
					<div class="card-body">
						<h4 class="card-title">10시간</h4>
						<p class="card-text">5000원</p>
					</div>
					<button type="button" class="btn btn-primary" onclick="addTime(10)">충전하기</button>
				</div>
			</div>
			<div class="col-lg">
				<div class="card border-primary mb-3" style="max-width: 20rem;">
					<div class="card-body">
						<h4 class="card-title">12시간</h4>
						<p class="card-text">6000원</p>
					</div>
					<button type="button" class="btn btn-primary" onclick="addTime(12)">충전하기</button>
				</div>
			</div>
		</div>
		<div class="container text-center">
			<a href="main.jsp" class="btn btn-lg btn-warning">취소</a>
		</div>
	</div>
	<%@ include file="./mfooter.jsp"%>
</body>
</html>