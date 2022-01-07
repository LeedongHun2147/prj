function CheckFood() {

	var food_name = document.getElementById("food_name");
	var category = document.getElementById("category");
	var price = document.getElementById("price");
	var stock = document.getElementById("stock");


	//상품명 체크
	if (food_name.value.length < 2 || food_name.value.length > 20) {
		alert("[상품명]\n 최소 2자에서 최대 20자까지 입력하세요");
		food_name.select();
		food_name.focus();
		return false;
	}

	//분류명 체크
	if (category.value.length < 2 || category.value.length > 20) {
		alert("[분류명]\n 최소 2자에서 최대 20자까지 입력하세요");
		category.select();
		category.focus();
		return false;
	}

	//가격
	if (price.value < 0) {
		alert("[가격]\n 음수는 입력할 수 없습니다");
		price.select();
		price.focus();
		return false;
	} else if (!check(/^\d+(?:[.]?[\d])?$/, price, "[가격]\n 소수점 둘째 자리까지만 입력하세요"))
		return false;

	//재고수 체크
	if (isNaN(stock.value)) {
		alert("[재고 수]\n 숫자만 입력하세요");
		stock.select();
		stock.focus();
		return false;
	}

	function check(regExp, e, msg) {

		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}

	document.newFood.submit();
}

function checkForm() {
	var id = document.newMember.id.value;
	var password = document.newMember.password.value;
	var checkpassword = document.newMember.checkpassword.value;
	if (!id) {
		alert("아이디를 입력하세요.");
		return false;
	}

	if ((id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")) {
		alert("한글 및 특수문자는 아이디로 사용할수 없습니다.")
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