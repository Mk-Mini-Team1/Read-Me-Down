<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/css/editor/badges.css" />
</head>
<body>
	<div id="badge_modal" class="modal">
		<div class="modal_box">
			<div class="closebox">
				<img class="modal_cancelbtn" src="/images/sign/Close.svg" alt="창닫기" />
			</div>
			<span class="modal_title">Badges</span>
			<!-- <div class="modal_tab">
				<button class="tabbtn active">검색</button>
				<button class="tabbtn">생성</button>
			</div> -->
			<div class="modal_searchbox">
				<p>프레임워크, 언어 등 공식 이름으로 검색</p>
				<div>
					<img alt="" src="/images/editor/search.svg">
					<input id="badge_keyword" autocomplete='off' placeholder="검색어를 입력하세요"/>
				</div>
			</div>
			<div class="modal_result" id="modal_result" ></div>
			<div class="modal_result_badges">
				<p>선택 뱃지</p>
				<p>더블클릭으로 삭제할 수 있습니다.</p>
				<div id="choosed_badges">
				</div>
			</div>
			<div class="modal_btns">
				<button class="modal_cancelbtn">취소</button>
				<button id="applybtn">적용하기</button>
			</div>
		</div>
	</div>
	
	<script src="/js/editor/badges.js"></script>
</body>
</html>
