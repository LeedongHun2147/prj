<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ include file="dbconn.jsp" %>
<%-- <%@ page import="dao.ProductRepository"%> --%>

<%
	
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("products.jsp");
		return;
	}
	
// 	ProductRepository dao = ProductRepository.getInstance();
//	Product product = dao.getProductByid(id);
	
//	String productId = request.getParameter("id");

	
	String sql = "select * from product where p_id =?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	
	Product p1 = new Product();
	if (rs.next()) {
		p1.setProductId(rs.getString("p_id"));
		p1.setPname(rs.getString("p_name"));
		p1.setUnitPrice(rs.getInt("p_unitPrice"));
		p1.setDescription(rs.getString("p_description"));
		p1.setCategory(rs.getString("p_category"));
		p1.setManufacturer(rs.getString("p_manufacturer"));
		p1.setUnitsInStock(rs.getInt("p_unitsInStock"));
		p1.setCondition(rs.getString("p_condition"));
		p1.setFilename(rs.getString("p_fileName"));
		
	}
	
	if (p1 == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	
	/* ArrayList<Product> goodsList = dao.getAllProducts();
	Product goods = new Product();
	for (int i = 0; i < goodsList.size(); i++) {
		goods = goodsList.get(i);
		if (goods.getProductId().equals(id)) {
			break;
		}
	} */
	
	// 세션처리
	ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
	if (list == null) {
		list = new ArrayList<Product>();
		session.setAttribute("cartlist", list);
	}
	
	
	int cnt = 0;
	Product goodsQnt = new Product();
	
	for(int i = 0 ; i < list.size(); i++) {
		goodsQnt = list.get(i);
		if (goodsQnt.getProductId().equals(id)){
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}
	
	if (cnt == 0) {
		p1.setQuantity(1);
		list.add(p1);
	}
	
	response.sendRedirect("product.jsp?id=" + id);
%>