<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<link rel="stylesheet" href="./resources/css/manage.css" />
</head>

<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("삭제하시겠습니까?") == true) {
			location.href = "./member_delete_process.jsp?id=" + id;
		} else {
			return;
		}
	}
</script>

<body>
	<%@ include file="./mheader.jsp"%>
	<!-- <div style="height: 97px"></div> -->
	<div class="container">
		<div class="page-header" id="banner">
			<h1 class="display-3" style="padding: 30px; font-weight: bold;">회원관리</h1>
		</div>
	</div>

	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">이름</th>
					<th scope="col">이메일</th>
					<th scope="col">주소</th>
					<th scope="col">남은 시간</th>
					<th scope="col">메모</th>
					<th scope="col">edit</th>
				</tr>
			</thead>
			<tbody>
				<%
				String sql = "select * from member";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					String id = rs.getString("ID");
				%>
				<tr>
					<th scope="row"><%=id %></th>
					<td><%=rs.getString("USER_NAME") %></td>
					<td><%=rs.getString("EMAIL") %></td>
					<td><%=rs.getString("ADDRESS") %></td>
					<td><%=rs.getString("LEFTTIME") %></td>
					<td><%=rs.getString("MEMO") %></td>
					<td>
						<a href="./member_update.jsp?id=<%=id %>" role="button"
						class="btn btn-info">수정</a>
						<a href="#" role="button" onclick="deleteConfirm('<%=id%>')"
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