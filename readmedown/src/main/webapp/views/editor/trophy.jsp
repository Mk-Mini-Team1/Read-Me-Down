<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/css/editor/trophy.css" />
</head>
<body>
	<div id="trophy_modal" class="modal">
		<div class="modal_box">
			<div class="closebox">
				<img class="modal_cancelbtn" src="/images/sign/Close.svg" alt="창닫기" />
			</div>
			<span class="modal_title">Trophy</span>
			<div class="modal_inputbox">
				<div>
					<span>github ID</span>
					<input id="trophy_github_ID" autocomplete='off' placeholder="User github ID" value="${user_git_id eq null ? '' : user_git_id}"/>
				</div>
				<p id="trophy_github_ID_guide">조회할 github ID를 입력하세요.</p>
			</div>

			<span class="modal_subtitle">테마 설정</span>
			<div class="themetable" id="trophy_themetable" >
				<table>
					<thead>
						<tr><th>Name</th><th>Preview</th></tr>
					</thead>
					<tbody>
						<tr>
							<td><label><input type="radio" name="theme" value="flat" checked><span>flat<br>(default)</span></label></td>
							<td><img src="https://github-profile-trophy.vercel.app/?username=ryo-ma&theme=flat&row=1&column=4"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="onedark"><span>onedark</span></label></td>
							<td><img src="https://github-profile-trophy.vercel.app/?username=ryo-ma&theme=onedark&row=1&column=4"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="gruvbox"><span>gruvbox</span></label></td>
							<td><img src="https://github-profile-trophy.vercel.app/?username=ryo-ma&theme=gruvbox&row=1&column=4"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="dracula"><span>dracula</span></label></td>
							<td><img src="https://github-profile-trophy.vercel.app/?username=ryo-ma&theme=dracula&row=1&column=4"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="monokai"><span>monokai</span></label></td>
							<td><img src="https://github-profile-trophy.vercel.app/?username=ryo-ma&theme=monokai&row=1&column=4"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="chalk"><span>chalk</span></label></td>
							<td><img src="https://github-profile-trophy.vercel.app/?username=ryo-ma&theme=chalk&row=1&column=4"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="nord"><span>nord</span></label></td>
							<td><img src="https://github-profile-trophy.vercel.app/?username=ryo-ma&theme=nord&row=1&column=4"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="alduin"><span>alduin</span></label></td>
							<td><img src="https://github-profile-trophy.vercel.app/?username=ryo-ma&theme=alduin&row=1&column=4"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="darkhub"><span>darkhub</span></label></td>
							<td><img src="https://github-profile-trophy.vercel.app/?username=ryo-ma&theme=darkhub&row=1&column=4"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="juicyfresh"><span>juicyfresh</span></label></td>
							<td><img src="https://github-profile-trophy.vercel.app/?username=ryo-ma&theme=juicyfresh&row=1&column=4"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="buddhism"><span>buddhism</span></label></td>
							<td><img src="https://github-profile-trophy.vercel.app/?username=ryo-ma&theme=buddhism&row=1&column=4"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="oldie"><span>oldie</span></label></td>
							<td><img src="https://github-profile-trophy.vercel.app/?username=ryo-ma&theme=oldie&row=1&column=4"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="radical"><span>radical</span></label></td>
							<td><img src="https://github-profile-trophy.vercel.app/?username=ryo-ma&theme=radical&row=1&column=4"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="onestar"><span>onestar</span></label></td>
							<td><img src="https://github-profile-trophy.vercel.app/?username=ryo-ma&theme=onestar&row=1&column=4"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="discord"><span>discord</span></label></td>
							<td><img src="https://github-profile-trophy.vercel.app/?username=ryo-ma&theme=discord&row=1&column=4"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="algolia"><span>algolia</span></label></td>
							<td><img src="https://github-profile-trophy.vercel.app/?username=ryo-ma&theme=algolia&row=1&column=4"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="gitdimmed"><span>gitdimmed</span></label></td>
							<td><img src="https://github-profile-trophy.vercel.app/?username=ryo-ma&theme=gitdimmed&row=1&column=4"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="tokyonight"><span>tokyonight</span></label></td>
							<td><img src="https://github-profile-trophy.vercel.app/?username=ryo-ma&theme=tokyonight&row=1&column=4"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="matrix"><span>matrix</span></label></td>
							<td><img src="https://github-profile-trophy.vercel.app/?username=ryo-ma&theme=matrix&row=1&column=4"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="apprentice"><span>apprentice</span></label></td>
							<td><img src="https://github-profile-trophy.vercel.app/?username=ryo-ma&theme=apprentice&row=1&column=4"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="dark_dimmed"><span>dark<br>dimmed</span></label></td>
							<td><img src="https://github-profile-trophy.vercel.app/?username=ryo-ma&theme=dark_dimmed&row=1&column=4"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="theme" value="dark_lover"><span>dark<br>lover</span></label></td>
							<td><img src="https://github-profile-trophy.vercel.app/?username=ryo-ma&theme=dark_lover&row=1&column=4"/></td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<span class="modal_subtitle addoption" id="trophy_add_option_btn">▼ 추가 옵션 설정 ▼</span>
			<div class="additional_optionBoxWrap">
				<div class="add_optionbox" id="hidden_option_box">
					<div class="add_optionbox_title">출력할 트로피<br>종류 설정</div>
					<div class="add_optionbox_contents">
						<label style="width:100%"><input type="checkbox" name="title_option" value="all" checked><span>전체 선택(default)</span></label>
						<label><input type="checkbox" name="title_option" value="Stars" checked><span>Stars</span></label>
						<label><input type="checkbox" name="title_option" value="Followers" checked><span>Followers</span></label>
						<label><input type="checkbox" name="title_option" value="Repositories" checked><span>Repositories</span></label>
						<label><input type="checkbox" name="title_option" value="Reviews" checked><span>Reviews</span></label>
						<label><input type="checkbox" name="title_option" value="Commits" checked><span>Commits</span></label>
						<label><input type="checkbox" name="title_option" value="Issues" checked><span>Issues</span></label>
						<label><input type="checkbox" name="title_option" value="PullRequest" checked><span>PullRequest</span></label>
					</div>
				</div>
				<div class="add_optionbox" id="hidden_option_box">
					<div class="add_optionbox_title">출력할 랭크<br>종류 설정</div>
					<div class="add_optionbox_contents">
						<label style="width:100%"><input type="checkbox" name="rank_option" value="all" checked><span>전체 선택(default)</span></label>
						<label><input type="checkbox" name="rank_option" value="SSS" checked><span>SSS</span></label>
						<label><input type="checkbox" name="rank_option" value="SS" checked><span>SS</span></label>
						<label><input type="checkbox" name="rank_option" value="S" checked><span>S</span></label>
						<label><input type="checkbox" name="rank_option" value="AAA" checked><span>AAA</span></label>
						<label><input type="checkbox" name="rank_option" value="AA" checked><span>AA</span></label>
						<label><input type="checkbox" name="rank_option" value="A" checked><span>A</span></label>
						<label><input type="checkbox" name="rank_option" value="B" checked><span>B</span></label>
						<label><input type="checkbox" name="rank_option" value="C" checked><span>C</span></label>
						<label><input type="checkbox" name="rank_option" value="SECRET" checked><span>SECRET</span></label>
					</div>
				</div>
				<div class="add_optionbox" id="hidden_option_box">
					<div class="add_optionbox_title">트로피<br>행,열 배열 설정</div>
					<div class="add_optionbox_contents">
						<span>row :</span>
						<input type="number" style="width:150px;" id="trophy_row" placeholder="3(default)" value="3">
						<span>column :</span>
						<input type="number" style="width:150px;" id="trophy_col" placeholder="6(default)" value="6">
					</div>
				</div>
				<div class="add_optionbox" id="hidden_option_box">
					<div class="add_optionbox_title">트로피 행,열<br>여백 설정</div>
					<div class="add_optionbox_contents">
						<span>width margin:</span>
						<input type="number" style="width:100px;" id="trophy_row_margin" placeholder="0(default)" value="0">
						<span>height margin:</span>
						<input type="number" style="width:50px;" id="trophy_col_margin" placeholder="0(default)" value="0">
					</div>
				</div>
				<div class="add_optionbox" id="hidden_option_box">
					<div class="add_optionbox_title">배경 투명 설정</div>
					<div class="add_optionbox_contents">
						<label><input type="radio" name="trophy_bg_color" value="true"><span>True</span></label>
						<label><input type="radio" name="trophy_bg_color" value="false" checked><span>False(default)</span></label>
					</div>
				</div>
				<div class="add_optionbox" id="hidden_option_box">
					<div class="add_optionbox_title">테두리 투명 설정</div>
					<div class="add_optionbox_contents">
						<label><input type="radio" name="trophy_border_color" value="true"><span>True</span></label>
						<label><input type="radio" name="trophy_border_color" value="false" checked><span>False(default)</span></label>
					</div>
				</div>
			</div>
			
			<div class="modal_btns">
				<button class="modal_cancelbtn">취소</button>
				<button id="trophy_applybtn">적용하기</button>
			</div>
		</div>
	</div>
	<script src="/js/editor/trophy.js"></script>
</body>
</html>
