$(document).ready(function() {
    // 비밀번호 찾기 버튼 클릭 시 비밀번호 찾기 모달 열기
    $("#findPwbtn").click(function(event) {
        event.preventDefault();
        $("#findPw_modal").show(); // 비밀번호 찾기 모달 열기
    });

    // 비밀번호 찾기 모달 내부에서 모달 닫기 버튼 클릭 시 모달 닫기
    $("#findPw_modal #closeFindPwButton").click(function() {
        $("#findPw_modal").hide(); // 비밀번호 찾기 모달 닫기
    });

    // 모달 밖을 클릭 시 모달 닫기
    $(document).on("click", function(event) {
        if ($(event.target).hasClass("findPw_modal")) {
            $("#findPw_modal").hide();
        }
    });

    // 공통으로 사용할 모달 열기 함수
    function openModal(modalId) {
        $("#" + modalId).show();
    }

    // 모든 버튼에 대해 같은 함수 연결
    $(".openModalButton").click(function(event) {
        event.preventDefault(); // 이 부분 추가
        var modalId = $(this).data("modal");
        openModal(modalId);
    });

    // 모든 모달을 닫는 함수
    function closeAllModals() {
        $(".modal").hide();
    }

    // 창 닫기 버튼에 대한 함수
    $(".closeButton").click(function() {
        closeAllModals();
    });
});

