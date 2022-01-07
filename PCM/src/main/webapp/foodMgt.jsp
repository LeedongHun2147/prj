<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식품관리</title>
<link rel="stylesheet" href="./resources/css/manage.css" />
</head>

<script type="text/javascript">
	function deleteConfirm(food_name) {
		if (confirm("삭제하시겠습니까?") == true) {
			location.href = "./food_delete_process.jsp?food_name=" + food_name;
		} else {
			return;
		}
	}
</script>

<body>
	<%@ include file="./mheader.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="page-header">
					<h1 class="display-3" style="padding: 30px; font-weight: bold;">식품관리</h1>
				</div>
			</div>
			<div class="col-lg-4" style="padding: 30px;">
				<a href="./food_insert.jsp" role="button"
					class="btn btn-lg btn-primary">추가하기</a>
			</div>
		</div>
	</div>
	
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">품명</th>
					<th scope="col">종류</th>
					<th scope="col">가격</th>
					<th scope="col">수량</th>
					<th scope="col">edit</th>
				</tr>
			</thead>
			<tbody>
				<%
				String sql = "select * from food";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					String food_name = rs.getString("FOOD_NAME");
				%>
				<tr>
					<th scope="row"><%=food_name %></th>
					<td><%=rs.getString("CATEGORY") %></td>
					<td><%=rs.getString("PRICE") %></td>
					<td><%=rs.getString("STOCK") %></td>
					<td>
						<a href="./food_update.jsp?food_name=<%=food_name %>" role="button"
						class="btn btn-info">수정</a>
						<a href="#" role="button" onclick="deleteConfirm('<%=food_name%>')"
							class="btn btn-danger">삭제</a>
					</td>
				</tr>
				<%
				}

				if (pstmt != null) {
				pstmt.close();
				}
				if (conn != null) {
				conn.close();
				}
				if (rs != null) {
				rs.close();
				}
				%>
			</tbody>
		</table>

	</div>

</body>
</html>