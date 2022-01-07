<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
//PreparedStatement pstmt = null;
//ResultSet //rs = null;

request.setCharacterEncoding("UTF-8");

String projectPath = application.getContextPath();
System.out.println("projectPath====>" + projectPath);

String dirPath = application.getRealPath("./resources/img/");
System.out.println("dirPath====>" + dirPath);

String filename = "";
String realFolder = dirPath; //웹 어플리케이션상의 절대경로
//	String realFolder = "C:\\upload";
String encType = "utf-8"; //인코딩 타입
int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기 5mb

MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

String id = multi.getParameter("id");
String pw = multi.getParameter("password");
String user_name = multi.getParameter("name");
String email = multi.getParameter("email");
String address = multi.getParameter("address");

//Enumeration files = multi.getFileNames();
//String fname = (String) files.nextElement();
//String fileName = multi.getFilesystemName(fname);

//	PreparedStatement pstmt = null;

String sql = "insert into member (id, pw, user_name, email, address) values(?,?,?,?,?)";

pstmt = conn.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, pw);
pstmt.setString(3, user_name);
pstmt.setString(4, email);
pstmt.setString(5, address);

pstmt.execute();

if (pstmt != null)
	pstmt.close();
if (conn != null)
	conn.close();
if (rs != null)
	rs.close();

response.sendRedirect("login.jsp");
%>
