$(document).ready(function() {
    // 모달 열기 함수 정의
    function openSignin() {
        closeAllModals(); // 모든 모달 닫기
        $("#signIn_modal").show();
    }

    function openSignup() {
        closeAllModals(); // 모든 모달 닫기
        $("#signUp_modal").show();
    }

    // 로그인 버튼 클릭 시 로그인 모달 열기
    $("#loginbtn").click(function() {
        openSignin(); 
    });
    
    // 회원가입 버튼 클릭 시 회원가입 모달 열기
    $("#SignUpbtn").click(function() {
        openSignup();
    });

    // 모든 모달을 닫는 함수
    function closeAllModals() {
        $("#signIn_modal").hide();
        $("#signUp_modal").hide();
        // 다른 모달도 추가로 닫을 수 있음
    }

    // 모달 내부에서 모달 닫기 버튼 클릭 시 모달 닫기
    $(".modal_cancelbtn, .closeButton").click(function() {
        closeAllModals();
    });

    // 모달 바깥 영역 클릭 시 모달 닫기
    $(window).click(function(event) {
        if ($(event.target).hasClass("signIn_modal")) {
            closeAllModals();
        }
        if ($(event.target).hasClass("signUp_modal") || event.target.id === "signUpmodal_cancelbtn") {
            closeAllModals();
        }
    });

    // ESC 키 누를 시 모달 닫기
    $(document).keydown(function(event) {
        if (event.keyCode === 27) { // 27은 ESC 키의 keyCode
            closeAllModals();
        }
    });

    // 회원가입 모달 내부에서 모달 닫기 버튼 클릭 시 모달 닫기
    $("#signUpmodal_cancelbtn").click(function() {
        $("#signUp_modal").hide();
    });
});
