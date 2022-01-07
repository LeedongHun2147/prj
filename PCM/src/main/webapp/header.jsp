<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">
var setTime = 0;
var timer = null;

function Countdown() {
	var min = Math.floor(setTime / 60);
	var sec = setTime % 60;
	var time = min + ":" + sec;
	
	document.getElementById("counter").innerHTML = time;
	setTime--;

	if (setTime == 4) {
		alert("5초 남았습니다.");
	} else if (setTime < 0) {
		location.replace("logout.jsp");
	}
}

function start() {
	Countdown();
	timer = setTimeout(start, 1000);
}

function stop() {
    if(timerId != null) {
        clearTimeout(timerId);
    }
}

function addTime1() {
	if (confirm("1시간 충전하시겠습니까?")) {
		if(timer != null) {
			clearTimeout(timer);
	    }
		setTime = setTime + 10;
		start();

	} else {		
		
	}
}
</script>

<body>
<%
String user_name = (String) session.getAttribute("sessionName");
String user_id = (String) session.getAttribute("sessionId");
int lefttime = 0;
if(session.getAttribute("sessionLefttime") != null) {
	lefttime = (Integer) session.getAttribute("sessionLefttime");
}
%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light"
		style="padding-right: 20px; padding-left: 20px">
		<div class="container-fluid">
			<a class="navbar-brand" href="main.jsp">Home</a>

			<div class="collapse navbar-collapse" id="navbarColor03">
				<% if(user_name != null) { %>
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><span class="nav-link"><%=user_name%> 님</span>
					<li class="nav-item"><span class="nav-link">남은 시간: <%=lefttime%></span></li>
					<li class="nav-item"><span class="nav-link">잔액:</span></li>
				</ul>
				<a href="./logout.jsp" class="btn btn-success my-2 my-sm-0">로그아웃</a>
				<% } else { %>
				<a href="./login.jsp" class="btn btn-success my-2 my-sm-0">로그인</a>
				<% } %>
			</div>
		</div>
	</nav>
</body>
</html>