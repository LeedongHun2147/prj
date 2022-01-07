<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>상품 편집</title>
</head>
<script type="text/javascript">
	function deleteConfirm(food_name) {
		if (confirm("해당 상품을 삭제합니다!") == true)
			location.href = "./food_delete_process.jsp?food_name=" + food_name;
		else
			return;
	}
</script>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 편집</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp"%>
			<%
			//	PreparedStatement pstmt = null;
			//	ResultSet rs = null;
				
				String sql = "select * from food";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			<div class="col-md-4">
				<img src="./resources/images/<%=rs.getString("file_Name")%>" style="width: 100%">
				<h3><%=rs.getString("food_name")%></h3>
				<p><%=rs.getString("category")%>
				<p><%=rs.getString("price") %>원
				<p><%
					
						%>
					<a href="./food_update.jsp?food_name=<%=rs.getString("food_name") %>"
				class = "btn btn-success" role="button">수정 &raquo;></a>
				<% 
					
				%>
				<a href="#" onclick="deleteConfirm('<%=rs.getString("food_name")%>')" 
				class="btn btn-danger" role="button">삭제 &raquo;></a>
				<%
					}
				%>
			</div>	
			<%
					
				
			
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

</body>
</html>