<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="dto.Food" %>
<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("food_list.jsp");
		return;
	}
	
	ArrayList<Food> list = (ArrayList<Food>) session.getAttribute("cartlist");
	Food goodsQnt = new Food();
	for (int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		if(goodsQnt.getFood_name().equals(id)){
			list.remove(goodsQnt);
		}
	}
	
	response.sendRedirect("food_list.jsp");
%>