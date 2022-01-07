<%@page import="java.io.PrintWriter"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
request.setCharacterEncoding("UTF-8");



String id = request.getParameter("id");
String pw = request.getParameter("password");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String birth = request.getParameter("birth");
String mail = request.getParameter("mail");
String phone = request.getParameter("phone");
String address = request.getParameter("address");	
		

String sql = "insert into member (id, password, name, gender, birth, mail, phone, address, regist_day) values(?,?,?,?,?,?,?,?,sysdate)";

pstmt = conn.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, pw);
pstmt.setString(3, name);
pstmt.setString(4, gender);
pstmt.setString(5, birth);
pstmt.setString(6, mail);
pstmt.setString(7, phone);
pstmt.setString(8, address);

pstmt.execute();


if (pstmt != null)
	pstmt.close();
if (conn != null)
	conn.close();
if (rs != null)
	rs.close();

response.sendRedirect("loginMember.jsp");
%>
