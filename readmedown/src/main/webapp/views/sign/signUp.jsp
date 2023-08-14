<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" href="/images/logo-pencil.png" />
<link rel="apple-touch-icon" href="/images/logo-pencil.png" />
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/sign/signUp.css" />
<script src="/js/jquery-3.6.4.min.js"></script>
<title>Read Me▼</title>
</head>
<body>
	<main class="container">
		<div class="close">
		<a><img src="images/sign/Close.svg" alt="창닫기" /></a>
		</div>
		<a href="/"> <img src="images/ReadMeD_M.svg" alt="로고아이콘" />
		</a>
		<p>ReadMe▼에 오신것을 환영합니다!</p>
		<form method="post" action="signup" class="signupForm"
			name="signupForm">
			<div class="email">
				<p>E-mail</p>
				<div class="checkEmail">
					<input type="email" id="email" name="email" oninput="regEmail()"
						placeholder="이메일 입력" />
					<button>중복확인</button>
				</div>				
				<span id="emailRequired"></span>
			</div>
			<div class="password">
				<p>Password</p>
				<input type="password" id="password" name="password" maxlength="20"
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
			<button class="submit">Sign-up</button>
		</form>
	</main>
	
	<script src="/js/sign/signInputCheck.js"></script>
</body>
</html>
