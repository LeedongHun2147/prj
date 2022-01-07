<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<% 	
	request.setCharacterEncoding("UTF-8");

	String projectPath = application.getContextPath();
	System.out.println("projectPath====>" + projectPath);

	String dirPath = application.getRealPath("./resources/img/");
	System.out.println("dirPath====>" + dirPath);
	
	String filename = "";
	String realFolder = dirPath; //웹 어플리케이션상의 절대경로
//	String realFolder = "C:\\upload";
	String encType = "UTF-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기 5mb
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	
	String food_name = multi.getParameter("food_name");
	String category = multi.getParameter("category");
	String Price = multi.getParameter("price");
	String Stock = multi.getParameter("stock");
	
	
	
	
	
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
	
	String sql = "insert into food values(?,?,?,?,?)";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, food_name);
	pstmt.setString(2, category);
	pstmt.setInt(3, price);
	pstmt.setLong(4, stock);
	pstmt.setString(5, fileName);
	
	
	pstmt.execute();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("foodMgt.jsp");
%>
