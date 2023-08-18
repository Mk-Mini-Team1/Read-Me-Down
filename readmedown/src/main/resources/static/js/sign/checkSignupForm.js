$(document).ready(function() {
    $('#emailCheckButton').on('click', function(e) {
        var email = $('#signUp_email').val();
        
        if (email) { // 이메일이 입력되었는지 확인
            $.ajax({
                url: "/checkemail", // 중복 확인을 처리하는 엔드포인트 URL
                type: "post",
                data: {
                    email: email
                },
                success: function(data) {
                    if (data == 0) {
                        alert("사용 가능한 이메일입니다.");
                        $('#emailCheckButton').val("true");
                    } else {
                        alert("이미 등록된 이메일입니다.");
                        $('#emailCheckButton').val("false");
                    }
                },
                error: function(error) {
                    console.log(error);
                }
            });
        } else {
            alert("이메일을 입력해주세요.");
        }
    });
});

function check() {
	if (signupForm.email.value.length == 0) {
		alert('이메일 필수 입력 사항입니다.');
		signupForm.email.focus();
		return false;
	}
	
	if ($("#pwRequired").text() !== "" || signupForm.password.value.length < 6) {
		alert('비밀번호 필수 입력 사항입니다.');
		signupForm.password.focus();
		return false;
	}

	if ($("#checkPwRequired").text() !== "" || signupForm.checkPassword.value.length < 6) {
		alert('비밀번호 확인 필수 입력 사항입니다.');
		signupForm.checkPassword.focus();
		return false;
	}

	if (signupForm.password.value != signupForm.checkPassword.value) {
		alert('비밀번호가 다릅니다.');
		signupForm.checkPassword.select();
		return false;
	}

	if ($("#nameRequired").text() !== "" && signupForm.name.value.length < 2) {
		alert('닉네임 필수 입력 사항입니다.');
		signupForm.name.focus();
		return false;
	}	

	alert("회원가입이 완료되었습니다.")
}
