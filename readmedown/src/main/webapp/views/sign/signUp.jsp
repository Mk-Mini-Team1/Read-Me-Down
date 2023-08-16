<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/sign/signUp.css" />
    <script src="/js/jquery-3.6.4.min.js"></script>
    <title>Read Me▼</title>
</head>
<body>
<div id="signUp_modal" class="signUp_modal">
    <main class="signUpmodal_container">
        <div class="close">
            <a id="signUpmodal_cancelbtn"><img src="/images/sign/Close.svg" alt="창닫기" /></a>
			</div>
		<a href="/"> <img src="/images/ReadMeD_Mint.svg" alt="로고아이콘" />
		</a>
		<p>ReadMe▼에 오신것을 환영합니다!</p>
		<form method="post" action="signup" class="signupForm"
			name="signupForm">
			<div class="email">
				<p>E-mail</p>
				<div class="checkEmail">
					<input type="email" id="signUp_email" name="signUp_email" oninput="regEmail()"
						placeholder="이메일 입력" />
					<button>중복확인</button>
				</div>				
				<span id="emailRequired"></span>
			</div>
			<div class="password">
				<p>Password</p>
				<input type="password" id="signUp_password" name="signUp_password" maxlength="20"
					oninput="regPw()" placeholder="비밀번호 입력" />			
				<span id="pwRequired"></span>
				<p>Password Check</p>
				<input type="password" id="checkPassword" maxlength="20"
					oninput="checkPw()" placeholder="비밀번호 확인" /> 
					<span id="checkPwRequired"></span>
			</div>
			<div class="nameWrapper">
				<p>Name</p>
				<input type="text" placeholder="닉네임 입력" id="name" name="name"
					oninput="regName()" /> 
					<span id="nameRequired"></span>
			</div>			
			<div class="gitWrapper">
				<p>Github ID<span>(선택)</span></p>
				<input type="text" placeholder="깃아이디" id="gitId" name="gitId"/> 					
			</div>
			<button class="signUp_submit">가입하기</button>
		</form>
	</main>
</div>
	
	<script src="/js/sign/signInputCheck.js"></script>
</body>
</html>
