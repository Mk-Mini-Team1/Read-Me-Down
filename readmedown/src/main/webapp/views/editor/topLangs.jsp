<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/css/editor/topLangs.css" />
</head>
<body>
	<div id="top_langs_modal" class="modal">
		<div class="modal_box">
			<div class="closebox">
				<img class="modal_cancelbtn" src="/images/sign/Close.svg" alt="창닫기" />
			</div>
			<span class="modal_title">Top Langs</span>
			<div class="modal_inputbox">
				<div>
					<span>github ID</span>
					<input type='text' id="github_ID" autocomplete='off' placeholder="User github ID" value="${user_git_id eq null ? '' : user_git_id}"/>
				</div>
				<p id="github_ID_guide">조회할 github ID를 입력하세요.</p>
			</div>
			<span class="modal_subtitle">레이아웃 선택</span>
			<div class="tablebox" id="layouttable" >
				<table>
					<thead>
						<tr><th>Name</th><th>Preview</th></tr>
					</thead>
					<tbody>
						<tr>
							<td><label><input type="radio" name="layout" value=""><span>Demo<br>(default)</span></label></td>
							<td><img src="https://camo.githubusercontent.com/fbf4f4aadb79493225ed43d6daca84015eafa94d496ef07bbf723200e12f923c/68747470733a2f2f6769746875622d726561646d652d73746174732e76657263656c2e6170702f6170692f746f702d6c616e67732f3f757365726e616d653d616e7572616768617a7261"></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="layout" value="compact"><span>Compact</span></label></td>
							<td><img src="https://camo.githubusercontent.com/d7490794a2d042e6eb6a434616022fe17f075368c31740e69bf1b3cb0acb273f/68747470733a2f2f6769746875622d726561646d652d73746174732e76657263656c2e6170702f6170692f746f702d6c616e67732f3f757365726e616d653d616e7572616768617a7261266c61796f75743d636f6d70616374"></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="layout" value="donut"><span>Donut</span></label></td>
							<td><img src="https://camo.githubusercontent.com/05f69986e2e64a5e901f37ec8ccddef9e2fa7a681b13add97923bbc6cf5b2bcf/68747470733a2f2f6769746875622d726561646d652d73746174732e76657263656c2e6170702f6170692f746f702d6c616e67732f3f757365726e616d653d616e7572616768617a7261266c61796f75743d646f6e7574"></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="layout" value="donut-vertical"><span>Donut<br>Vertical</span></label></td>
							<td><img src="https://camo.githubusercontent.com/53a5207f70fd2bd1a9d19765d06a9006150746d6c618c6c487d4244b358a03ab/68747470733a2f2f6769746875622d726561646d652d73746174732e76657263656c2e6170702f6170692f746f702d6c616e67732f3f757365726e616d653d616e7572616768617a7261266c61796f75743d646f6e75742d766572746963616c"></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="layout" value="pie"><span>Pie</span></label></td>
							<td><img src="https://camo.githubusercontent.com/1ebd9eda8a150ec30d39bb2d3ea1eef62003a66aab6ed620216999e43976acaf/68747470733a2f2f6769746875622d726561646d652d73746174732e76657263656c2e6170702f6170692f746f702d6c616e67732f3f757365726e616d653d616e7572616768617a7261266c61796f75743d706965"></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="layout" value="hidebar"><span>Hide<br>Progress Bars</span></label></td>
							<td><img src="https://camo.githubusercontent.com/8f607030550405a5613601e70497c49d1eeba1b495962eb5289de3ce39922f4d/68747470733a2f2f6769746875622d726561646d652d73746174732e76657263656c2e6170702f6170692f746f702d6c616e67732f3f757365726e616d653d616e7572616768617a726126686964655f70726f67726573733d74727565"></td>
						</tr>
					</tbody>
				</table>
			</div>
		
			<span class="modal_subtitle">테마 선택</span>
			<div class="modal_searchbox">
				<p>테마 이름 검색 (Readme Stats 테마 동일)</p>
				<div>
					<img alt="" src="/images/editor/search.svg">
					<input type='text' id="stats_theme_keyword" autocomplete='off' placeholder="검색어를 입력하세요"/>
				</div>
			</div>
			<div class="tablebox" id="themetable" >
				<table>
					<thead>
						<tr><th>Name</th><th>Preview</th></tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			
			<span class="modal_subtitle" id="additional_option_btn">▼추가 옵션 설정</span>
			<div id="additional_option_box">
				<div class="modal_inputbox_option">
					<p>Exclude Individual Repositories</p>
					<input type='text' id="excludeRepo" autocomplete='off' placeholder="repo1,repo2"/>
					<p>추가하고 싶은 개인 저장소를 ‘ , ’ 구분자를 이용하여 적어주세요.<br>
						단, 비공개(private), 단체(team, organizations) 저장소는 적용되지 않습니다.<br>
						추가할 저장소가 없는 경우 빈칸으로 두세요.<br>
						ex) github-readme-stats,anuraghazra.github.io</p>
				</div>
	
				<div class="modal_inputbox_option">
					<p>Hide Individual Languages</p>
					<input type='text' id="hideLang" autocomplete='off' placeholder="language1,language2"/>
					<p>공개하고 싶지 않은 언어의 이름을 ‘ , ’ 구분자를 이용하여 적어주세요.<br>ex) Java, Javascript</p>
				</div>
	
				<div class="modal_inputbox_option">
					<p>Show More Languages</p>
					<input type='text' id="showLangCnt" autocomplete='off' placeholder="5"/>
					<p>표시하고 싶은 언어 종류의 개수를 적어주세요.<br>기본값은 5개이며 최소 1개 ~ 최대 10개의 언어를 표시할 수 있습니다.</p>
				</div>
			</div>
			
			<div class="modal_btns">
				<button class="modal_cancelbtn">취소</button>
				<button id="applybtn">적용하기</button>
			</div>
		</div>
	</div>
	
	<script src="/js/editor/topLangs.js"></script>
</body>
</html>
