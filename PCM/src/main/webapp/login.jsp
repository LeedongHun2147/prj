<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="./resources/css/Minty.css" />
</head>
<body>
	<div align="center">
		<img alt="logo" src="./resources/img/logo.PNG">
	</div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
			<%
			String error = request.getParameter("error");
			if (error != null) {
				out.println("<div class='alert alert-danger'>");
				out.println("아이디와 비밀번호를 확인해주세요");
				out.println("</div>");
			}
			%>
			<form class="form-signin" action="./loginProcess.jsp" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" class="form-control" placeholder="ID" name="id" required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="Password" name="password" required>
				</div>
				<button class="btn btn-lg btn-success" type="submit">로그인</button><br>
				<a href="joinMember.jsp" role="button">회원가입</a>
			</form>
		</div>
	</div>
</body>
</html>