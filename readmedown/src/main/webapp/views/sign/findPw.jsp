<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/sign/findPw.css" />
<script src="/js/jquery-3.6.4.min.js"></script>
</head>
<body>

	<div id="findPw_modal" class="findPw_modal">
		<main class="modal_container">
			<div class="close">
				<a id="closeFindPwButton"><img src="/images/sign/Close.svg"
					alt="창닫기" /></a>
			</div>
			<a href="/"> <img src="/images/ReadMeD_Mint.svg" alt="로고아이콘" />
			</a>
			<p>비밀번호 찾기</p>
			<form method="post" action="" class="signinForm" name="signinForm">
				<div class="email">
					<p>E-mail</p>
					<div class="checkEmail">
						<input type="email" id="findPw_email" name="findPw_email"
							oninput="regEmail()" placeholder="이메일 입력" />
					</div>
				</div>
				<button class="submit" id="checkEmail">임시비밀번호받기</button>
			</form>
		</main>
	</div>
	<!-- <div id="alert_modal" class="modal">
		<div class="modal_box">
			<div class="closebox">
				<img class="modal_cancelbtn" src="/images/sign/Close.svg" alt="창닫기" />
			</div>
			<div class="logobox">
				<img src="/images/ReadMeD_Mint.svg" alt="logo" />
			</div>
			<div class="modal_alert_text" id="modal_alert_text"></div>
			<div class="modal_btns">
				<button class="modal_cancelbtn">확인</button>
			</div>
		</div>
	</div> -->
	<script>
$(document).ready(function() {
	$("#checkEmail").click(function(e) { //버튼 눌렀을때 이메일 존재여부 검사
		e.preventDefault();		
		let email = $("#findPw_email").val();
		
		$.ajax({
			url: "/findpwemail",
			type: "post",
			dataType: "json",
			data: { 'email': email },
			success: function(data) {
				//findpwemail함수의 return값이 count니까 여기로 넘어오는 data값이 count
				if(data > 0) { //count가 0 이상이면 = 회원이 존재하면
			 		$.ajax({
						url: "/sendemail",
						type: "post",
						dataType: "json",
						data: { 'email': email },
						success: function(data) {
							//그럼 아까 위에서 한거랑 똑같아여 여기도 data 값이 방금 지정한 return
							if(data > 0) {
								alert("임시비밀번호가 해당 메일로 전송되었습니다.");							
							}
							else { //업데이트에 문제가있다면
								alert("문제발생.관리자에게 문의하세요.");
							}
						},
						error: function(){}
					});
				}
				else { //회원이 존재하지 않으면
					alert("존재하지 않는 이메일입니다.");
				}
				
			},
			error: function(){}
		});//ajax
	});//btn click
});//ready


//모달관련 함수
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

</script>
</body>
</html>
