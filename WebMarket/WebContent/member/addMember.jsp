<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet"
	href ="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script type="text/javascript" src="./resources/js/validation1.js"></script>
<title>회원가입</title>
</head>
<script type="text/javascript">
function checkForm() {
	var id = document.newMember.id.value;
	var password = document.newMember.password.value;
	var checkpassword = document.newMember.checkpassword.value;
	if (!id) {
		alert("아이디를 입력하세요.");
		return false;
	}
	
	if((id <"0"|| id > "9")&&(id < "A"|| id> "Z")&&(id < "a"|| id> "z")){
		alert("한글 및 특수문자는 아이디로 사용할수 없습니다.")
		return false;
	}
	if(document.newMember.idccc.value != "idCheck"){
        alert("아이디 중복체크를 해주세요.");
        return false;
    }

	if (!password) {
		alert("비밀번호를 입력하세요.");
		return false;
	}
	if (password != checkpassword) {
		alert("비밀번호를 동일하게 입력하세요.");
		return false;
	}
	

	if (!document.newMember.name.value) {
		alert("이름을 입력하세요.");
		return false;
	}
}
</script>
<script type="text/javascript">
function idCheck(id){
	if(id == ""){
		alert("아이디를 입력하세요");
		document.regForm.id.focus();
	}else{
		
		url="idCheck.jsp?id=" + id;
		window.open(url,"post","width=500,height=300");
		
	}
}

// 아이디 입력창에 값 입력시 hidden에 iduncheck를 세팅한다.
// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
// 다시 중복체크를 하도록 하기 위함
function inputIdChk(){
    document.newMember.idccc.value ="iduncheck";
}
</script>
<body>
<fmt:setLocale value='<%= request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message" >
	<jsp:include page="/menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><fmt:message key ="newMember"/></h1>
		</div>
	</div>
	<div class="container">
		<div class="text-right">
			<a href="?language=ko">Korean</a> : <a href="?language=en">English</a>
			
		</div>
		<form action="processAddMember.jsp" name="newMember" onsubmit="return checkForm()"
		method="post" >
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key ="id"/></label>
				<div class="col-sm-3">
					<input type="text" id="id" name="id" class="form-control" onkeydown="inputIdChk()">
					<input type="hidden" name="idccc" value="iduncheck">
					<button type="button" value="ID중복확인" class="btn btn-lg btn-primary"
								onClick="idCheck(this.form.id.value)">아이디 중복체크</button>
				</div>				
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key ="password"/></label>
				<div class="col-sm-3">
					<input type="text" id="password" name="password" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key ="name"></fmt:message></label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key ="gender"></fmt:message></label>
				<div class="col-sm-5">
					<input type="radio" name="gender" value="male">
					<fmt:message key ="gender_male"></fmt:message>
					<input type="radio" name="condition" value="female ">
					<fmt:message key ="gender_female"></fmt:message>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key ="birth"></fmt:message></label>
				<div class="col-sm-3">
					<input type="text" name="birth" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key ="mail"></fmt:message></label>
				<div class="col-sm-3">
					<input type="text" name="mail" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key ="phone"></fmt:message></label>
				<div class="col-sm-3">
					<input type="text" id="phone" name="phone" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key ="address"></fmt:message></label>
				<div class="col-sm-3">
					<input type="text" id="address" name="address" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="<fmt:message key ='button'></fmt:message>" >
				</div>
			</div>
		</form>
	</div>
	</fmt:bundle>

</body>
</html>