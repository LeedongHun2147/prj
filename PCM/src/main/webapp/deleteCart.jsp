<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="dto.Food" %>
<%
	/* 
	String id = request.getParameter("cartId");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("food_list.jsp");
		return;
	} */
	if (session.getAttribute("cartlist") != null) {
		session.removeAttribute("cartlist");
	}
	response.sendRedirect("food_list.jsp");
%>