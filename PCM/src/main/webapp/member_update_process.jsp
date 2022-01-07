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

	String id = multi.getParameter("id");
	String pw = multi.getParameter("pw");
	String user_name = multi.getParameter("user_name");
	String email = multi.getParameter("email");
	String address = multi.getParameter("address");
	String lefttime = multi.getParameter("lefttime");
	String memo = multi.getParameter("memo");
	
	
	
	
//	PreparedStatement pstmt = null;
//	ResultSet rs = null;
	
	String sql = "select * from member where id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	
	if (rs.next()) {
			sql = "UPDATE member SET pw=?, user_name=?, email=?, address=?, memo=? WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, user_name);
			pstmt.setString(3, email);
			pstmt.setString(4, address);
			pstmt.setString(5, memo);
			pstmt.setString(6, id);
			pstmt.executeUpdate();
		
	}
	
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("memberMgt.jsp");

%>