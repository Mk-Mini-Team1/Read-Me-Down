function checkSignin() {
    if (signinform.email.value === "") {
        alert('로그인 이메일을 입력해주세요.');
        signinform.email.focus();
        return false;
    }

    if (signinform.password.value === "") {
        alert('비밀번호를 입력해주세요.');
        signinform.password.focus();
        return false;
    }

    // 유효성 검사가 통과한 경우 폼을 제출
    return true;
}
