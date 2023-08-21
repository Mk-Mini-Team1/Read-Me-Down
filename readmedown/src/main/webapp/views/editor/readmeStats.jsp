<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/css/editor/readmeStats.css" />
</head>
<body>
	<div id="readme_stats_modal" class="modal">
		<div class="modal_box">
			<div class="closebox">
				<img class="modal_cancelbtn" src="/images/sign/Close.svg" alt="창닫기" />
			</div>
			<span class="modal_title">Read Me Stats</span>
			<div class="modal_inputbox">
				<div>
					<span>github ID</span>
					<input id="github_ID" autocomplete='off' placeholder="User github ID" value="${user_git_id eq null ? '' : user_git_id}"/>
				</div>
				<p id="github_ID_guide">조회할 github ID를 입력하세요.</p>
			</div>
			<span class="modal_subtitle">테마 선택</span>
			<div class="modal_searchbox">
				<p>테마 이름 검색</p>
				<div>
					<img alt="" src="/images/editor/search.svg">
					<input id="stats_theme_keyword" autocomplete='off' placeholder="검색어를 입력하세요"/>
				</div>
			</div>
			<div class="themetable" id="themetable" >
				<table>
					<thead>
						<tr><th>Name</th><th>Preview</th></tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			
			<span class="modal_subtitle" id="additional_option_btn">▼추가 옵션 설정</span>
			<div id="optionBoxWrap">
				<div class="optionbox" id="hidden_option_box">
					<div class="optionbox_title">출력할<br>옵션 선택</div>
					<div class="optionbox_contents">
						<label style="width:100%"><input type="checkbox" name="hidden_option" value="all" checked><span>전체 선택(default)</span></label>
						<label><input type="checkbox" name="hidden_option" value="stars" checked><span>stars</span></label>
						<label><input type="checkbox" name="hidden_option" value="commits" checked><span>commits</span></label>
						<label><input type="checkbox" name="hidden_option" value="prs" checked><span>prs</span></label>
						<label><input type="checkbox" name="hidden_option" value="issues" checked><span>issues</span></label>
						<label><input type="checkbox" name="hidden_option" value="contribs" checked><span>contribs</span></label>
					</div>
				</div>
				<div class="optionbox" id="add_option_box">
					<div class="optionbox_title">추가할<br>옵션 선택<br></div>
					<div class="optionbox_contents">
						<label style="width:100%"><input type="checkbox" name="add_option" value="all"><span>전체 선택</span></label>
						<label><input type="checkbox" name="add_option" value="reviews"><span>reviews</span></label>
						<label><input type="checkbox" name="add_option" value="discussions_started"><span>discussions_started</span></label>
						<label><input type="checkbox" name="add_option" value="discussions_answered"><span>discussions_answered</span></label>
						<label><input type="checkbox" name="add_option" value="prs_merged"><span>prs_merged</span></label>
						<label><input type="checkbox" name="add_option" value="prs_merged_percentage"><span>prs_merged_percentage</span></label>
					</div>
				</div>
				<div class="optionbox" id="icon_option_box">
					<div class="optionbox_title">아이콘<br>출력 여부</div>
					<div class="optionbox_contents">
						<label><input type="radio" name="icon_option" value="true" checked><span>True</span></label>
						<label><input type="radio" name="icon_option" value="false"><span>False</span></label>
					</div>
				</div>
			</div>
			
			<div class="modal_btns">
				<button class="modal_cancelbtn">취소</button>
				<button id="applybtn">적용하기</button>
			</div>
		</div>
	</div>
	
	<script src="/js/editor/readmeStats.js"></script>
</body>
</html>
