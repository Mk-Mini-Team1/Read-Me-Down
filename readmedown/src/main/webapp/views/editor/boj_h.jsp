<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>
	<div id="boj_h_modal" class="modal">
		<div class="modal_box">
			<div class="closebox">
				<img class="modal_cancelbtn" src="/images/sign/Close.svg" alt="창닫기" />
			</div>
			<span class="modal_title">Boj Profile<br>(hyperflow.ver)</span>
			<div class="modal_inputbox">
				<div>
					<span>BackJoon ID</span>
					<input type='text' id="boj_ID" autocomplete='off' placeholder="User BackJoon ID"/>
				</div>
				<p id="boj_ID_guide">조회할 BackJoon ID를 입력하세요.</p>
				<p>'solved.ac'와 연동된 ID를 입력하셔야 조회 가능합니다.</p>
			</div>
			<div class="modal_btns">
				<button class="modal_cancelbtn">취소</button>
				<button id="applybtn">적용하기</button>
			</div>
		</div>
	</div>
</body>
</html>
