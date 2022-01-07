<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%
String order_id = (String) request.getParameter("orderid");
String food_name = (String) request.getParameter("fn");
String amount = (String) request.getParameter("amt");

String sql = "update order_foods set amount = ? WHERE order_id = ? and food_name = ?";
pstmt = conn.prepareStatement(sql);
pstmt.setInt(1, Integer.parseInt(amount));
pstmt.setInt(2, Integer.parseInt(order_id));
pstmt.setString(3, food_name);
pstmt.execute();


if(conn != null) conn.close();
if(pstmt != null) pstmt.close();
response.sendRedirect("order_edit.jsp?orderid=" + order_id);
%>