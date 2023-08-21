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
            showModal('새 닉네임이<br>닉네임 규칙에 적합하지 않습니다.');
            return false;
        }

        if (editPassword.length !== 0) {
            // 비밀번호가 입력되었을 때 비밀번호 규칙 검사
            if (!isPasswordValid(editPassword)) {
                showModal('새 비밀번호가 비밀번호 규칙에<br>적합하지 않습니다.');
                return false;
            }

            if (editPassword !== checkEditPassword) {
                showModal('새 비밀번호 확인이 일치하지 않습니다.');
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
                if (data.response === "현재 비밀번호를 입력해주세요.") {
                    showModal(data.response);
                } else if (data.response === "수정이 완료되었습니다.") {
                    showModal(data.response, function () {
                        window.location.href = '/mypage'; // /mypage 페이지로 이동
                    });
                }
            },
            error: function (error) {
                console.log(error); // 에러 메시지를 콘솔에 출력                
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

function showModal(message, callback) {
    $('#modal_alert_text').html(message);
    $('#alert_modal').css('display', 'block');
    
    // 확인 버튼 클릭 시 콜백 함수 실행
    $(document).on('click', '.modal_cancelbtn', function () {
        $('#alert_modal').css('display', 'none');
        if (typeof callback === 'function') {
            callback();
        }
    });
}

$(document).on('click', '.modal_cancelbtn', function () {
    $('#alert_modal').css('display', 'none');
});
