<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	String projectPath = application.getContextPath();
	System.out.println("projectPath====>" + projectPath);

	String dirPath = application.getRealPath("./resources/images/");
	System.out.println("dirPath====>" + dirPath);
	
	
	String filename = "";
	String realFolder = dirPath; //웹 어플리케이션상의 절대경로
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기 5mb

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	String food_name = multi.getParameter("food_name");
	String category = multi.getParameter("category");
	String Price = multi.getParameter("price");
	String Stock = multi.getParameter("stock");
	String n_food_name = multi.getParameter("n_food_name");
	
	
	Integer price;
	
	if (Price.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(Price);
	
	long stock;
	
	if (Stock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(Stock);
	
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
//	PreparedStatement pstmt = null;
//	ResultSet rs = null;
	
	String sql = "select * from food where food_name = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, n_food_name);
	rs = pstmt.executeQuery();
	
	if (rs.next()) {
		if (fileName != null) {
			sql = "UPDATE food SET food_name=?, category=?, price=?, stock=?, file_Name=? WHERE food_name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, food_name);
			pstmt.setString(2, category);
			pstmt.setInt(3, price);
			pstmt.setLong(4, stock);
			pstmt.setString(5, fileName);
			pstmt.setString(6, n_food_name);
			pstmt.executeUpdate();
		}else {
			sql = "UPDATE food SET food_name=?, category=?, price=?, stock=? WHERE food_name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, food_name);
			pstmt.setString(2, category);
			pstmt.setInt(3, price);
			pstmt.setLong(4, stock);
			pstmt.setString(5, n_food_name);
			pstmt.executeUpdate();
		}
	}
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("foodMgt.jsp");

%>