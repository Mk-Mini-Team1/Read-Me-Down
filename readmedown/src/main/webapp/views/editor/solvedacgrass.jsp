<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/css/editor/solvedacgrass.css" />
</head>
<body>
	<div id="solved_grass_modal" class="modal">
		<div class="modal_box">
			<div class="closebox">
				<img class="modal_cancelbtn" src="/images/sign/Close.svg" alt="창닫기" />
			</div>
			<span class="modal_title">Solved.ac Grass</span>
			<div class="modal_inputbox">
				<div>
					<span>BackJoon ID</span>
					<input type='text' id="boj_ID" autocomplete='off' placeholder="User BackJoon ID"/>
				</div>
				<p id="boj_ID_guide">조회할 BackJoon ID를 입력하세요.</p>
				<p>'solved.ac'와 연동된 ID를 입력하셔야 조회 가능합니다.</p>
			</div>
			
			<div class="madal_subtitlebox">
				<span class="modal_subtitle">테마 선택</span>
				<p id="boj_version_guide">사용할 테마를 선택하세요.</p>
			</div>
			
			<div class="tablebox" id="theme_table" >
				<table>
					<thead>
						<tr><th>Theme</th><th>Preview</th></tr>
					</thead>
					<tbody>
						<tr>
							<td><label><input type="radio" name="theme" value="warm" checked><span>Warm<br>(default)</span></label></td>
							<td><img src="http://mazandi.herokuapp.com/api?handle=djs100201&theme=warm"></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="cold"><span>Cold</span></label></td>
							<td><img src="http://mazandi.herokuapp.com/api?handle=djs100201&theme=cold"></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="dark"><span>Dark</span></label></td>
							<td><img src="http://mazandi.herokuapp.com/api?handle=djs100201&theme=dark"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal_btns">
				<button class="modal_cancelbtn">취소</button>
				<button id="applybtn">적용하기</button>
			</div>
		</div>
	</div>
</body>
</html>
