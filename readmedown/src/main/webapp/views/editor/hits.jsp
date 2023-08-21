<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/css/editor/hits.css" />
</head>
<body>
	<div id="hits_modal" class="modal">
		<div class="modal_box">
			<div class="closebox">
				<img class="modal_cancelbtn" src="/images/sign/Close.svg" alt="창닫기" />
			</div>
			<span class="modal_title">Hits</span>
			<div class="modal_inputbox">
				<div>
					<span>Target Url</span>
					<input type='text' id="target_url" autocomplete='off' placeholder="Url"/>
				</div>
				<p id="target_url_guide">조회할 Url을 입력하세요.</p>
			</div>
			<div class="modal_inputbox">
				<div>
					<span>Title</span>
					<input type='text' id="target_title" autocomplete='off' placeholder="title"/>
				</div>
				<p id="target_title_guide">뱃지 제목을 입력하세요.<br>입력하지 않는 경우 'hits'가 입력됩니다.</p>
			</div>
			
			<div id ="optionBoxWrap">
				<div class="optionbox" id="icon_option_box">
					<div class="optionbox_title">Border</div>
					<div class="optionbox_contents">
						<label><input type="radio" name="border_option" value="false" checked><span>Round</span></label>
						<label><input type="radio" name="border_option" value="true"><span>Flat</span></label>
					</div>
				</div>
				<p id="target_title_guide">테두리 둥글기를 설정해 주세요. 기본값은 'Round'입니다.</p>
			</div>
			
			<span class="modal_subtitle">Badge Color</span>
			<div id ="optionBoxWrap">
				<p id="target_title_guide">영역별 색상을 선택해주세요.</p>
				<div class="optionbox" id="icon_option_box">
					<div class="optionbox_title">Title Color</div>
					<div class="optionbox_contents">
						<input type="color" class="colorpicker" id="title_color" value="#555555"><span>#555555</span>
					</div>
				</div>
				<div class="optionbox" id="icon_option_box">
					<div class="optionbox_title">Count Color</div>
					<div class="optionbox_contents">
						<input type="color" class="colorpicker" id="count_color" value="#79C83D"><span>#79C83D</span>
					</div>
				</div>
			</div>

			<span class="modal_subtitle">Icon</span>
			<div id ="optionBoxWrap">
				<p id="target_title_guide">추가할 아이콘의 이미지와 색상을 선택해 주세요.(선택)</p>
				<div class="dropboxWrap">
					<input type="hidden" id="hit_icon_title" value="">
					<div class="dropbox_title" id="hit_icon_title_div">아이콘 이미지 선택</div>
					<div class="dropbox_contents">
						<div class="modal_searchbox" id="hit_modal_searchbox">
							<img id="search_icon" src="/images/editor/search.svg">
							<input id="hit_icon_keyword" autocomplete='off' placeholder="아이콘 검색어 입력"/>
						</div>
						<div id="hit_resultbox">
						</div>
					</div>
				</div>
				<div class="optionbox" id="icon_option_box">
					<div class="optionbox_title">Icon Color</div>
					<div class="optionbox_contents">
						<input type="color" class="colorpicker" id="icon_color" value="#ffffff"><span>#FFFFFF</span>
					</div>
				</div>
			</div>
			
			<div class="modal_btns">
				<button class="modal_cancelbtn">취소</button>
				<button id="hit_applybtn">적용하기</button>
			</div>
		</div>
	</div>
	
	<script src="/js/editor/hits.js"></script>
</body>
</html>
