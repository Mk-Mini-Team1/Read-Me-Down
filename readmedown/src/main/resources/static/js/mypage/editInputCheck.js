const pwReg = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,20}$/;
const nameReg = /^[가-힣a-zA-Z0-9]{2,10}$/;

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