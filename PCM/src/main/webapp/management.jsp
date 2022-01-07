<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>관리자페이지</title>
<link rel="stylesheet" href="./resources/css/manage.css" />
</head>
<body>
	<%@ include file="./mheader.jsp"%>
	<%!String management = "SG PC 관리자";%>
	<div align="center">
		<img alt="logo" src="./resources/img/logo.PNG">
	</div>
	<div class="text-center">
		<div class="container">
			<h1 class="display-3" style="padding: 30px; font-weight: bold;">
				<%=management%>
			</h1>
		</div>
	</div>
	<%-- 
	<%@ include file="inc_footer.jsp" %> --%>
	<%@ include file="./mfooter.jsp"%>
</body>

</html>