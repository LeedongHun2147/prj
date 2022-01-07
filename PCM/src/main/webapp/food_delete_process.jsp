<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%
	
//	PreparedStatement pstmt = null;
//	ResultSet rs = null;
	
	String food_name = request.getParameter("food_name");


	String sql = "select * from food";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	if (rs.next()) {
		sql = "delete from food where food_name = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, food_name);
		pstmt.executeUpdate();
	} else
		out.println("일치하는 상품이 없습니다.");
	
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("foodMgt.jsp");

%>