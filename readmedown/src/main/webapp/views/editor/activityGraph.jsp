<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/css/editor/activityGraph.css" />
</head>
<body>
	<div id="activity_graph_modal" class="modal">
		<div class="modal_box">
			<div class="closebox">
				<img class="modal_cancelbtn" src="/images/sign/Close.svg" alt="창닫기" />
			</div>
			<span class="modal_title">Activity Graph</span>
			<!-- 
			<div class="modal_tab">
				<button class="tabbtn active">기본형</button>
				<button class="tabbtn">선택형</button>
			</div>
			 -->
			<div class="modal_inputbox">
				<div>
					<span>github ID</span>
					<input id="github_ID" autocomplete='off' placeholder="User github ID" value="${user_git_id eq null ? '' : user_git_id}"/>
				</div>
				<p id="github_ID_guide">조회할 github ID를 입력하세요.</p>
			</div>
			<span class="modal_subtitle">테마 선택</span>
			<div class="themetable" id="themetable" >
				<table>
					<thead>
						<tr><th>Name</th><th>Preview</th></tr>
					</thead>
					<tbody>
						<tr>
							<td><label><input type="radio" name="theme" value="default" checked><span>cotton<br>candy<br>(default)</span></label></td>
							<td><img src="https://github.com/Ashutosh00710/github-readme-activity-graph/raw/main/asset/default.svg"></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="react"><span>react</span></label></td>
							<td><img src="https://github.com/Ashutosh00710/github-readme-activity-graph/raw/main/asset/react.png"></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="react-dark"><span>react<br>dark</span></label></td>
							<td><img src="https://github.com/Ashutosh00710/github-readme-activity-graph/raw/main/asset/react-dark.svg"></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="github"><span>github</span></label></td>
							<td><img src="https://github.com/Ashutosh00710/github-readme-activity-graph/raw/main/asset/github.svg"></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="github-compact"><span>github<br>compact</span></label></td>
							<td><img src="https://github.com/Ashutosh00710/github-readme-activity-graph/raw/main/asset/github-compact.svg"></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="xcode"><span>xcode</span></label></td>
							<td><img src="https://github.com/Ashutosh00710/github-readme-activity-graph/raw/main/asset/xcode.svg"></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="rogue"><span>rogue</span></label></td>
							<td><img src="https://github.com/Ashutosh00710/github-readme-activity-graph/raw/main/asset/rogue.svg"></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="merko"><span>merko</span></label></td>
							<td><img src="https://github.com/Ashutosh00710/github-readme-activity-graph/raw/main/asset/merko.png"></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="vue"><span>vue</span></label></td>
							<td><img src="https://github.com/Ashutosh00710/github-readme-activity-graph/raw/main/asset/vue.png"></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="tokyo-night"><span>tokyo<br>night</span></label></td>
							<td><img src="https://github.com/Ashutosh00710/github-readme-activity-graph/raw/main/asset/tokyo-night.png"></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="high-contrast"><span>high<br>contrast</span></label></td>
							<td><img src="https://github.com/Ashutosh00710/github-readme-activity-graph/raw/main/asset/high-contrast.png"></td>
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
	
	<script src="/js/editor/activityGraph.js"></script>
</body>
</html>
