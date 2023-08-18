$(document).ready(function() {
    $(".submit").click(function(event) {
        event.preventDefault(); // 기본 동작을 막음 (폼 제출 방지)
        
        var editName = $("#edit_name").val();
        var newPassword = $("#newPassword").val();
        var currentPassword = $("#N_password").val(); // 현재 비밀번호 입력 필드 id

        // 수정사항이 없으면 알림창을 띄우고 함수 종료
        if (!editName && !newPassword) {
            alert("수정사항이 존재하지 않습니다.");
            return;
        }
        
        // 닉네임 유효성 검사
        if (editName) {
            var namePattern = /^[가-힣a-zA-Z0-9]{2,10}$/;
            if (!namePattern.test(editName)) {
                alert("닉네임 규정에 맞게 입력해주세요.");
                return;
            }
        }
        
        // 새 비밀번호가 입력된 경우에만 유효성 검사 수행
        if (newPassword) {
            // 현재 비밀번호가 입력되었는지 확인
            if (!currentPassword) {
                alert("현재 비밀번호를 입력해주세요.");
                return;
            }
            
            // 현재 비밀번호와 DB 저장 비밀번호 일치 여부 확인
            // DB에서 비밀번호 가져오는 코드 필요 (currentPassword와 비교)
            var dbPassword = ""; // DB 비밀번호 저장 변수
            if (currentPassword !== dbPassword) {
                alert("현재 비밀번호가 일치하지 않습니다.");
                return;
            }
            
            // 새 비밀번호 유효성 검사
            var passwordPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[a-zA-Z\d@$!%*?&]{10,25}$/;
            if (!passwordPattern.test(newPassword)) {
                alert("비밀번호 규정에 맞게 입력해주세요.");
                return;
            }
            
            // 새 비밀번호와 비밀번호 확인 일치 여부 확인
            var checkNewPassword = $("#checkNewPassword").val();
            if (newPassword !== checkNewPassword) {
                alert("새 비밀번호가 서로 일치하지 않습니다.");
                return;
            }
        }
        
        // 모든 조건을 만족한 경우 폼 제출
        $(".editinfoForm").submit();
    });
});

