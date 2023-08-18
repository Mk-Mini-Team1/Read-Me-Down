<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<main class="edit_container">
				<a href="/"> <img src="/images/ReadMeD_Mint.svg" alt="로고아이콘" />
				</a>
				<p>내 정보 수정</p>
				<form method="post" action="editinfo" class="editinfoForm"
					name="editinfoForm">

					<div class="edit_userWrapper">
						<div class="userId">
							<p>readme@readme.com</p>
						</div>
						<div class="edit_profile_image">
							<div class="editButton">
								<button>Image Upload</button>
							</div>
						</div>
					</div>
					<div class="edit_nameWrapper">
						<p>닉네임</p>
						<input type="text" placeholder="닉네임 입력" id="edit_name"
							name="edit_name" /> 
							<span id="Rule">닉네임은  2~10글자 이내로 한글, 영어, 숫자를 포함 할 수 있습니다.</span>
					</div>
					<div class="edit_passwordWrapper">
						<p>현재 비밀번호</p>
						<input type="password" id="N_password" placeholder="현재 비밀번호 입력" />
						<p>새 비밀번호</p>
						<input type="password" id="newPassword" name="password"
							maxlength="25" placeholder="비밀번호 입력" /> <span
							id="Rule">영문과 숫자, 특수문자를 포함한 10~25자리의 규칙을 지켜주세요.</span>
						<p>비밀번호 확인</p>
						<input type="password" id="checkNewPassword" maxlength="25"
							placeholder="비밀번호 확인" /> 
					</div>
					<div class="edit_gitWrapper">
						<p>
							Github ID
						</p>
						<input type="text" placeholder="깃아이디" id="edit_gitId"
							name="edit_gitId" />
					</div>
					<button class="submit">수정하기</button>
				</form>
			</main>
		</div>
	</div>
<script src="/js/mypage/editInputCheck.js"></script>
</body>
</html>

