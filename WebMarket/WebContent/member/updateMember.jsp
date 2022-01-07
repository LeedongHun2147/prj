<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet"
	href ="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>회원 수정</title>
</head>
<body>
	<jsp:include page="../menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 수정</h1>
		</div>
	</div>
	<%@ include file="./dbconn.jsp"%>
	<%
		String id = request.getParameter("id");
		session.setAttribute("sessionId", id);
	
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
				
		String sql = "select * from member where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>
	<div class="container">
		<div class="text-right">
			<a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
		</div>
		<div class="row">
			
			<div class="col-md-7">
				<form action="./member_update_process.jsp" name="newProduct" class="form-horizontal"
				method="post" enctype="multipart/form-data">
					<div class="form-group row" >
						<label class="col-sm-2">아이디</label>
						<div class="col-sm-3">
							<input type="text" id="id" name="id" class="form-control" value='<%=rs.getString("id")%>'readonly >
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">비밀번호</label>
						<div class="col-sm-3">
							<input type="text" id="pw" name="pw" class="form-control" value='<%=rs.getString("password")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">회원이름</label>
						<div class="col-sm-3">
							<input type="text" id="user_name" name="user_name" class="form-control" value='<%=rs.getString("name")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">메일</label>
						<div class="col-sm-3">
							<input type="text" id="email" name="email" class="form-control" value='<%=rs.getString("mail")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">주소</label>
						<div class="col-sm-3">
							<input type="text" id="address" name="address" class="form-control" value='<%=rs.getString("address")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">남은시간</label>
						<div class="col-sm-3">
							<input type="text" id="lefttime" name="LEFTTIME" class="form-control" value='<%=rs.getString("lefttime")%>'readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">메모</label>
						<div class="col-sm-5">
							<textarea rows="2" cols="50" name="memo" class="form-control"><%=rs.getString("memo")%></textarea>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-primary" value="수정">
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