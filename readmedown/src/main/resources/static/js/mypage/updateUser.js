$(document).ready(function () {
    $('.editButton').on('click', function () {
        let nowPassword = $('#now_password').val();
        let editPassword = $('#edit_password').val();
        let checkEditPassword = $('#check_edit_Password').val();
        let name = $('#edit_name').val();
        let imageValue = $('#profile_img').val();
        let editGitId = $('#edit_gitId').val();

        // 닉네임 규칙 검사
        if (!isNicknameValid(name)) {
            alert('닉네임은 2~10글자 이내의 한글, 알파벳, 숫자를 사용할 수 있습니다.');
            return false;
        }

        if (editPassword.length !== 0) {
            // 비밀번호가 입력되었을 때 비밀번호 규칙 검사
            if (!isPasswordValid(editPassword)) {
                alert('새 비밀번호가 비밀번호 규칙에 적합하지 않습니다.');
                return false;
            }

            if (editPassword !== checkEditPassword) {
                alert('새 비밀번호 확인이 일치하지 않습니다.');
                return false;
            }
        }

        $.ajax({
            url: '/updateuser',
            type: 'post',
            dataType: 'json',
            data: {
                name: name,
                password: nowPassword,
                edit_password: editPassword,
                profile_image: imageValue,  // 이미지 데이터가 있는 경우에만 포함
                git_id: editGitId,
            },
            success: function (data) {
                alert(data.response);
                location.reload();
            },
            error: function (error) {
                console.log(error); // 에러 메시지를 콘솔에 출력
                alert("서버에서 오류가 발생했습니다. 자세한 내용은 콘솔을 확인해주세요.");
            }
        });
    });
});

// 비밀번호 규칙 검사 함수
function isPasswordValid(password) {
    // 영문, 숫자, 특수문자를 포함한 8~20자리 규칙
    const passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,20}$/;
    return passwordRegex.test(password);
}

// 닉네임 규칙 검사 함수
function isNicknameValid(nickname) {
    // 2~10글자 이내의 한글, 알파벳, 숫자 규칙
    const nicknameRegex = /^[a-zA-Z0-9가-힣]{2,10}$/;
    return nicknameRegex.test(nickname);
}
