<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/css/sign/signIn.css" />
<link rel="stylesheet" href="/css/style.css" />
<script src="/js/jquery-3.6.4.min.js"></script>
<style>
    /* 스크린 전체를 덮는 뒷 배경 */
    .findPw_modal {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        display: flex;
        justify-content: center;
        align-items: center;
        z-index: 9999;
    }

</style>
</head>
<body>
	<div id="signIn_modal" class="signin_modal">
		<div class="signInmodal_container">
			<div class="close">
    <a class="modal_cancelbtn closeButton"><img src="/images/sign/Close.svg" alt="창닫기" /></a>
</div>
			<a href="/"> <img src="/images/ReadMeD_Mint.svg" alt="로고아이콘" />
			</a>
			<p>Login</p>
			<form action="/signin" method="post" class="signinform" name="signinform" id="form">
				<div class="email">
					<p>E-mail</p>
					<div class="checkEmail">
						<input type="email" id="email" name="email" placeholder="이메일 입력" />
					</div>
				</div>
				<div class="password">
					<p>Password</p>
					<input type="password" id="password" name="password" maxlength="20"
						placeholder="비밀번호 입력" />
				</div>
				<div class="errorMessage">${errorMessage}</div>
				<button class="signIn_submit" onclick="return checkSignin()">로그인하기</button>
				<div class="findPassword">
  					  <a href="#" id="findPwbtn">비밀번호 찾기</a>
				</div>
				<div class="signIn">
					Read Me▼ 회원이 아니신가요?
					<button id="SignUpbtn" class="openModalButton"
						data-modal="signUp_modal">회원가입</button>
				</div>

			</form>
		</div>
	</div>
	<div id="findPw_modal" class="findPw_modal" style="display: none;">
		<jsp:include page="findPw.jsp" />
	</div>
	
	
<script src="/js/sign/signInModals.js"></script>
<script src="/js/sign/checkSigninForm.js"></script>
<script>
    $(document).ready(function() {
        $(".signIn_submit").click(function(event) {
            event.preventDefault(); // 폼 제출 방지

            var email = $("#email").val();
            var password = $("#password").val();

            $.ajax({
                type: "POST",
                url: "/signin",
                data: {
                    email: email,
                    password: password
                },
                success: function(response) {
                    if (response.success) {
                        // 로그인 성공 시 처리
                    	$("#signIn_modal").css("display","none");
                    	$("#header_down").load(window.location.href + " #header_down");
                    } else {
                        $(".errorMessage").text(response.errorMessage);
                    }
                }
            });
        });
    });
</script>
	
</body>
</html>
