<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-fluid" style="padding-right: 20px; padding-left: 20px">
			<a class="navbar-brand" href="management.jsp">관리자페이지</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarColor01"
				aria-controls="navbarColor01" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link"
						href="./memberMgt.jsp">회원관리</a></li>
					<li class="nav-item"><a class="nav-link" href="./foodMgt.jsp">식품관리</a></li>
					<li class="nav-item"><a class="nav-link"   href="./order_list.jsp">주문목록</a><li>
				</ul>
			</div>
		</div>
		</div>
	</nav>
</body>
</html>