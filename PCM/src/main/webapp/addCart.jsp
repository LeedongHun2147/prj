<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="dto.Food"%>
<%@ include file="dbconn.jsp"%><%-- 
<%@ page import="dao.ProductRepository" %> --%>

<%
String food_name = request.getParameter("food");
//
System.out.println(food_name);
//
if (food_name == null || food_name.trim().equals("")) {
	//response.sendRedirect("food_list.jsp");
	System.out.println("food_name not found");
	return;
}

Food food = null;
/* 
PreparedStatement pstmt = null;
ResultSet rs = null; */
String sql = "select * from food where food_name = ?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, food_name);
rs = pstmt.executeQuery();
if (rs.next()) {
	food = new Food(rs.getString("food_name"), rs.getString("category"), rs.getInt("price"));
	food.setStock(rs.getInt("stock"));
	food.setFile_name(rs.getString("file_name"));
} else {
	//response.sendRedirect("exceptionNoFood.jsp");
}

ArrayList<Food> list = (ArrayList<Food>) session.getAttribute("cartlist");
if (list == null) {
	list = new ArrayList<Food>();
	session.setAttribute("cartlist", list);
}

int cnt = 0;
Food goodsQnt = new Food();

for (int i = 0; i < list.size(); i++) {
	goodsQnt = list.get(i);
	if (goodsQnt.getFood_name().equals(food_name)) {
		cnt++;
		int orderQuantity = goodsQnt.getQuantity() + 1;
		goodsQnt.setQuantity(orderQuantity);
	}
}

if (cnt == 0) {
	food.setQuantity(1);
	list.add(food);
}

System.out.println("sendRedirect");

if (rs.getString("category").equals("과자류")) {
	response.sendRedirect("food_list.jsp?ct_num=1");
}else if (rs.getString("category").equals("요리")) {
		response.sendRedirect("food_list.jsp?ct_num=2");
} else if (rs.getString("category").equals("라면")) {
	response.sendRedirect("food_list.jsp?ct_num=3");
} else if (rs.getString("category").equals("음료")) {
	response.sendRedirect("food_list.jsp?ct_num=4");
}
%>