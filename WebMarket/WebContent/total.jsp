<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp종합예제</title>
</head>
<body>
<h2>종합예제</h2>
<hr>
<%!
String[] members = {"김길동", "홍길동","김사랑", "박사랑"};
int num1= 10;
int calc(int num2){
	return num1 + num2;
}
%>
<h3>
1. jsp주석
</h3>
<h3>
2. calc(10) 매서드 실행 결과:
<%=calc(10)%>
</h3>
</hr>
</body>
</html>