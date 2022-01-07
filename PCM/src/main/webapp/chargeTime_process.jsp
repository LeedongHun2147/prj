<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
	
<%
int hour = Integer.parseInt((String) request.getParameter("hour"));
int newTime = 0;
String user_id = (String) session.getAttribute("sessionId");

if(user_id == null || user_id.trim().equals("")) {
	response.sendRedirect("login.jsp");
	return;
}

String sql = "select lefttime from member where id = ?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, user_id);
rs = pstmt.executeQuery();

session.setAttribute("sessionLefttime", newTime);

if(rs.next()) {
	newTime = rs.getInt("lefttime") + hour;
} else {
	newTime = hour;
}

sql = "update member set lefttime = ? where id = ?";
pstmt = conn.prepareStatement(sql);
pstmt.setInt(1, newTime);
pstmt.setString(2, user_id);
pstmt.execute();

if(conn != null) conn.close();
if(pstmt != null) pstmt.close();
if(rs != null) rs.close();

response.sendRedirect("chargeTime.jsp");
%>