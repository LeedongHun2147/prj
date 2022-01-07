<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
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
	<%-- <jsp:include page="header.jsp" /> --%>
	<div class="h-100" align="center">
		<div class="col-lg-6" style="padding: 30px">
			<form name="newMember" method="post"
				action="member_insert_process.jsp" onsubmit="return checkForm()" enctype="multipart/form-data">
				<fieldset>
					<legend style="color: white;">회원가입</legend>
					<div class="d-grid gap-1">
						<label for="id" class="form-label mt-4">ID</label> <input
							type="text" class="form-control" name="id" placeholder="ID" onkeydown="inputIdChk()">
							<input type="hidden" name="idccc" value="iduncheck">
							<button
								type="button" value="ID중복확인" class="btn btn-lg btn-primary"
								onClick="idCheck(this.form.id.value)">아이디 중복체크</button>
							
					</div>

					<div class="form-group">
						<label for="password" class="form-label mt-4">Password</label> <input
							type="password" class="form-control" name="password"
							placeholder="Password">
					</div>
					<div class="form-group">
						<label for="password" class="form-label mt-4">Password 확인</label> <input
							type="password" class="form-control" name="checkpassword"
							placeholder="Password">
					</div>

					<div class="form-group">
						<label for="name" class="form-label mt-4">이름</label> <input
							type="text" class="form-control" name="name" placeholder="이름">
					</div>

					<div class="form-group">
						<label for="email" class="form-label mt-4">Email address</label> <input
							type="email" class="form-control" name="email"
							aria-describedby="emailHelp" placeholder="Enter email">
					</div>

					<div class="form-group">
						<label for="address" class="form-label mt-4">Address</label> <input
							type="text" class="form-control" name="address" placeholder="주소">
					</div>
					<br>
					<div class="d-grid gap-1">
						<button type="submit" class="btn btn-lg btn-primary">가입하기</button>
						<a href="login.jsp" role="button" class="btn btn-lg btn-warning">취소하기</a>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</body>
</html>