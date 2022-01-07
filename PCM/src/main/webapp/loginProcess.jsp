<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ include file="dbconn.jsp"%>
<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String password = request.getParameter("password");

String sql = "select * from member where id = ?";

pstmt = conn.prepareStatement(sql);
pstmt.setString(1, id);

rs = pstmt.executeQuery();
if (rs.next()) {
	String pw = rs.getString("PW");
	String name = rs.getString("USER_NAME");
	int lefttime = rs.getInt("LEFTTIME");

	if (password.equals(pw)) {
		session.setAttribute("sessionName", name);
		session.setAttribute("sessionId", id);
		session.setAttribute("sessionLefttime", lefttime);
		out.println("alert('로그인 성공')");
		response.sendRedirect("main.jsp");
	} else {
		response.sendRedirect("login.jsp?error=1");
	}
} else {
	response.sendRedirect("login.jsp?error=1");
}
%>