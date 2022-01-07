<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>

<%
	String order_id = (String) request.getParameter("orderid");
	
	String sql = "delete order_foods WHERE order_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(order_id));
	pstmt.execute();
	sql = "delete order1 WHERE order_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(order_id));
	pstmt.execute();

	if(conn != null) conn.close();
	if(pstmt != null) pstmt.close();
	
	System.out.println("orderPurchase sendRedirect");
	response.sendRedirect("order_list.jsp");
%>