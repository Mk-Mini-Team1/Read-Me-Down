const emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
const pwReg = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,20}$/;
const nameReg = /^[가-힣a-zA-Z0-9]{2,10}$/;


function regEmail() {
	let email = $('#email').val();

	if (!emailReg.test(email)) {
		$("#emailRequired").text("'@'를 포함한 이메일 주소를 적어주세요.");
		$("#emailRequired").addClass("required");
	}
	else {
		$('#emailRequired').text('');
		$("#emailRequired").removeClass("required");
	}
};

function regPw() {
	let pw = $('#password').val();

	if (!pwReg.test(pw)) {
		$("#pwRequired").text("비밀번호는 영문과 숫자를 포함한 6~20자리 입니다.");
		$("#pwRequired").addClass("required");
	}
	else {
		$('#pwRequired').text('');
		$("#pwRequired").removeClass("required");
	}
};


function checkPw() {
	let pw = $('#password').val();
	let checkpw = $('#checkPassword').val()

	if (pw !== checkpw) {
		$("#checkPwRequired").text("비밀번호가 일치하지 않습니다.");
		$("#checkPwRequired").addClass("required");
	}
	else {
		$('#checkPwRequired').text('');
		$("#checkPwRequired").removeClass("required");
	}
};


function regName() {
	let name = $('#name').val();

	if (!nameReg.test(name)) {
		$("#nameRequired").text("닉네임은 2~10글자 이내로 한글, 영어, 숫자를 포함 할 수 있습니다.");
		$("#nameRequired").addClass("required");
	}
	else {
		$('#nameRequired').text('');
		$("#nameRequired").removeClass("required");
	}
};