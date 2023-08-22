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
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/style.css" />
<script src="/js/jquery-3.6.4.min.js"></script>
<title>Read Me▼</title>
<style>
    /* 스크린 전체를 덮는 뒷 배경 */
    .signIn_modal, .signUp_modal {
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
		<a href="/">
			<div id="header_logo">
				<img id="logo" src="/images/ReadMeD_Mint.svg">
			</div>
		</a> 
		<a href="/">
			<div class="header_item" id="header_main">
				<img src="/images/header/home-icon.svg"> 
				<span>Main</span>
			</div>
		</a> 
		<a id="/boardlist" href="/boardlist">
			<div class="header_item" id="header_templates">
				<img src="/images/header/templates.svg"> 
				<span>Templates</span>
			</div>
		</a> 
		<a id="/editor" href="/editor" >
			<div class="header_item" id="header_editor">
				<img src="/images/header/edit-icon.svg"> 
				<span>Edit.md</span>
			</div>
		</a>
	</div>
	<div id="header_down">
	    <c:choose>
	        <c:when test="${user_id eq null}">
	            <button id="loginbtn">LogIn</button>
	            <button id="SignUpbtn" class="openModalButton" data-modal="signUp_modal">Sign Up</button>
	        </c:when>
	        <c:otherwise>
	        	<a href="/mypage?searchType1=${user_id}">
	            <img id="logo" src="${user_profile eq null?'/images/default_profile.svg':user_profile}">
	            </a>
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

<script>
    // 로그아웃 버튼 클릭 이벤트 처리
    $(document).ready(function() {
        $("#logoutbtn").click(function() {
            // 로그아웃 요청
            $.post("/logout", function(data) {
                // 페이지 리로드
                window.location.reload();
            });
        });
    });
</script>
<script src="/js/header.js"></script>
</body>
</html>
