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
<link rel="stylesheet" href="/css/mypage/editProfile.css" />
<script src="/js/jquery-3.6.4.min.js"></script>
<title>Read Me▼</title>
</head>
<body>
	<jsp:include page="../header.jsp" />

	<div id="main_box">
		<div id="main_contents">
			<main class="container">
				<div class="close">
					<a id="closeModalButton"><img src="/images/sign/Close.svg"
						alt="창닫기" /></a>
				</div>
				<a href="/"> <img src="/images/ReadMeD_Mint.svg" alt="로고아이콘" />
				</a>
				<p>내 정보 수정</p>
				<form method="post" action="signup" class="signupForm"
					name="signupForm">

					<div class="userWrapper">
						<div class="userId">
							<p>readme@readme.com</p>
						</div>
						<div class="profile-image">
							<div class="editButton">
								<button>Image Upload</button>
							</div>
						</div>
					</div>
					<div class="nameWrapper">
						<p>닉네임</p>
						<input type="text" placeholder="닉네임 입력" id="name" name="name"
							oninput="regName()" /> <span id="nameRequired"></span>
					</div>
					<div class="password">
						<p>현재 비밀번호</p>
						<input type="password" id="password" placeholder="현재 비밀번호 입력"/>						
						<p>새 비밀번호</p>
						<input type="password" id="newPassword" name="password"
							maxlength="20" oninput="regPw()" placeholder="비밀번호 입력" /> <span
							id="pwRequired"></span>
						<p>비밀번호 확인</p>
						<input type="password" id="checkNewPassword" maxlength="20"
							oninput="checkPw()" placeholder="비밀번호 확인" /> <span
							id="checkPwRequired"></span>
					</div>
					<button class="submit">Sign-up</button>
				</form>
			</main>
		</div>
	</div>

	<script src="/js/mypage/editInputCheck.js"></script>
</body>
</html>
