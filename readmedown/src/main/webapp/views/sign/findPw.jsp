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
<link rel="stylesheet" href="/css/sign/findPw.css" />
<script src="/js/jquery-3.6.4.min.js"></script>
<title>Read Me▼</title>
</head>
<body>
	<main class="container">
		<div class="close">
			<a id="closeModalButton"><img src="images/sign/Close.svg"
				alt="창닫기" /></a>
		</div>
		<a href="/"> <img src="images/ReadMeD_Mint.svg" alt="로고아이콘" />
		</a>
		<p>비밀번호 찾기</p>
		<form method="post" action="signup" class="signinForm"
			name="signinForm">
			<div class="email">
				<p>E-mail</p>
				<div class="checkEmail">
					<input type="email" id="email" name="email" oninput="regEmail()"
						placeholder="이메일 입력" />
				</div>
			</div>
			<button class="submit">비밀번호 재설정</button>
		</form>
	</main>
</body>
</html>
