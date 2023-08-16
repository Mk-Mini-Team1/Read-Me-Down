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
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/style.css" />
<script src="/js/jquery-3.6.4.min.js"></script>
<title>Read Me▼</title>
<script>
	$(document).ready(function() {
	})
</script>

<style>
    /* 스크린 전체를 덮는 뒷 배경 */
    .signIn_modal,.signUp_modal {
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
	<header id="header">
		<div id='header_up'>
			<div id="header_logo">
				<img id="logo" src="/images/ReadMeD_Mint.svg">
			</div>
			<div class="header_item">
				<img id="logo" src="/images/header/home-icon.svg">
				<span>Main</span>
			</div>
			<div class="header_item">
				<img id="logo" src="/images/header/edit-icon.svg">
				<span>Edit .md</span>
			</div>
			<c:if test="${user_id ne null}">
				<div class="header_item">
					<img id="logo" src="/images/header/profile-icon.svg">
					<span>MyPage</span>
				</div>
			</c:if>
		</div>
		
		<div id="header_down">
			<c:choose>
				<c:when test="${user_id eq null}">
					<button id="loginbtn" onclick="openSignin()">LogIn</button>
					<button id="SignUpbtn" onclick="openSignup()">Sign Up</button>
				</c:when>
				<c:otherwise>
					<img id="logo" src="/images/default_profile.svg">
					<button id="logoutbtn">LogOut</button>
				</c:otherwise>
			</c:choose>
		</div>
</header>

<div id="signIn_modal" class="signIn_modal" style="display: none;">
    <jsp:include page="sign/signIn.jsp" />
</div>

<div id="signUp_modal" class="signUp_modal" style="display: none;">
    <jsp:include page="sign/signUp.jsp" />
</div>

<script src="/js/header.js"></script>
</body>
</html>
