//함수 정의
function openSignin() {
    $("#signIn_modal").show();
}

$(document).ready(function() {
    $("#loginbtn").click(function() {
        openSignin(); 
    });
    
    // 모달 내부에서 모달 닫기 버튼 클릭 시 모달 닫기
    $("#modal_cancelbtn").click(function() {
        $("#signIn_modal").hide();
    });
});

 
// 함수 정의
function openSignup() {
    $("#signUp_modal").show();
}

$(document).ready(function() {
    $("#SignUpbtn").click(function() {
        openSignup();
    });    
});

$(document).ready(function() {
    // 모달 내부에서 모달 닫기 버튼 클릭 시 모달 닫기
    $("#signUpmodal_cancelbtn").click(function() {
        $("#signUp_modal").hide();
    });
});


// 모달 바깥 영역 클릭 시 모달 닫기
    $(window).click(function(event) {
        if (event.target.id === "signIn_modal") {
            $("#signIn_modal").hide();
        }
        if (event.target.id === "signUp_modal" || event.target.id === "signUpmodal_cancelbtn") {
            $("#signUp_modal").hide();
        }
    });

    
// ESC 키 누를 시 모달 닫기
$(document).keydown(function(event) {
    if (event.keyCode === 27) { // 27은 ESC 키의 keyCode
        $("#signIn_modal").hide();
        $("#signUp_modal").hide();
    }
});