<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>

<%
	String order_id = (String) request.getParameter("orderid");
	String sql = "UPDATE order1 SET served = 'Y' WHERE order_id = " + order_id;
	pstmt = conn.prepareStatement(sql);
	pstmt.execute();


	if(conn != null) conn.close();
	if(pstmt != null) pstmt.close();
	
	System.out.println("orderPurchase sendRedirect");
	response.sendRedirect("order_list.jsp");
%>