<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/css/editor/codeforces.css" />
</head>
<body>
	<div id="codeforces_modal" class="modal">
		<div class="modal_box">
			<div class="closebox">
				<img class="modal_cancelbtn" src="/images/sign/Close.svg" alt="창닫기" />
			</div>
			<span class="modal_title">CodeForces Profile</span>
			<div class="modal_inputbox">
				<div>
					<span>CodeForces ID</span>
					<input type='text' id="codeforces_ID" autocomplete='off' placeholder="User CodeForces ID"/>
				</div>
				<p id="codeforces_ID_guide">조회할 CodeForces ID를 입력하세요.</p>
			</div>
			<div class="modal_btns">
				<button class="modal_cancelbtn">취소</button>
				<button id="applybtn">적용하기</button>
			</div>
		</div>
	</div>
</body>
</html>
