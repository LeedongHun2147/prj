<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
</head>
<body>
<script>
function sendCheckValue(){
    // 중복체크 결과인 idCheck 값을 전달한다.
    opener.document.newMember.idccc.value ="idCheck";
    
    
    if (opener != null) {
        opener.chkForm = null;
        self.close();
    }    
}
</script>
<%
int result = -1;
String id = request.getParameter("id");


String sql = "select id from Member where id=?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, id);

rs = pstmt.executeQuery();

if (rs.next()) {
	result = 0;
} else
	result = 1;
%><div align="center">
<b><label for="id" class="form-label mt-4" >아이디 중복체크</label></b>
</div>
<hr size="1">
<div align="center">

<% 
	if (result == 1){ %>
		<label for="id" class="form-label mt-4" ><%= id %> 는 사용가능한 아이디입니다</label>
</div>
<hr size="1">
<div align="center">
<input  id="useBtn" type="button" value="사용하기" class="btn btn-primary" onclick="sendCheckValue()">
</div>

<%	
}else if(result == 0){
	out.println(id + " 는 중복된 아이디입니다");
%>
<hr size="1">
<input id="cancelBtn" type="button" value="취소"  class="btn btn-danger" onclick="window.close()"><br>
	
<%
}else{
	out.print("에러 발생!!!(-1)"); 
}
%>
<br>

<%
if (rs != null)
	rs.close();
if (pstmt != null)
	pstmt.close();
if (conn != null)
	conn.close();


%>
</body>
</html>