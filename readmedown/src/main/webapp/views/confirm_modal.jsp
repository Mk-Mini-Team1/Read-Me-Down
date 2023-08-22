<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/css/confirm_modal.css" />
</head>
<body>
	<div id="confirm_modal" class="modal">
		<div class="modal_box">
			<div class="closebox">
				<img class="modal_cancelbtn" src="/images/sign/Close.svg" alt="창닫기" />
			</div>
			<div class="logobox">
				<img src="/images/ReadMeD_Mint.svg" alt="logo" />
			</div>
			<div class="modal_alert_text" id="modal_alert_text"></div>
			<div class="modal_btns">
				<button class="modal_cancelbtn">취소</button>
				<button id="confirm_modal_ok_btn">확인</button>
			</div>
		</div>
	</div>
</body>
</html>
