<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="dto.Food" %>
<%@ include file="dbconn.jsp" %>

<%
	/* 
	String cartId = request.getParameter("cartId");
	if (cartId == null || cartId.trim().equals("")) {
		response.sendRedirect("food_list.jsp");
		return;
	} */
	//
	String user_id = (String) session.getAttribute("sessionId");
	//String user_id = "orderTestNow";
	if (user_id == null || user_id.trim().equals("")) {
		System.out.println("user_id is null");
		response.sendRedirect("food_list.jsp");
		return;
	}
	ArrayList<Food> list = (ArrayList<Food>) session.getAttribute("cartlist");
	if(list == null) {
		System.out.println("list is null");
		response.sendRedirect("food_list.jsp");
		return;
	}
	//시퀀스로부터 새 ORDER_ID 받아오기 
	String sql = "select ORDER_FOOD_SEQUENCE.nextval as nv from dual";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	int orderId = -1;
	if(rs.next()) {
		orderId = rs.getInt("nv");
	} else {
		System.out.println("ORDER_FOOD_SEQUENCE overflow");
	}
	System.out.println("orderId : " + orderId);
	pstmt = null;
	rs = null;
	
	sql = "insert into ORDER1 VALUES (?, ?, SYSDATE, 'N')";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, orderId);
	pstmt.setString(2, user_id);
	pstmt.execute();
	pstmt = null;
	
	for(int i = 0; i < list.size(); i++) {
		sql = "insert into ORDER_FOODS VALUES (?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, orderId);
		pstmt.setString(2, list.get(i).getFood_name());
		pstmt.setInt(3, list.get(i).getQuantity());

		pstmt.execute();
		pstmt = null;
	}

	if(conn != null) conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
	
	//session.removeAttribute("cartlist");
	System.out.println("orderProcess sendRedirect");
	response.sendRedirect("deleteCart.jsp");
	
%>