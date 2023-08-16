<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head></head>
<body>
	<div id="board_menubar">
		<div id="menubar_list">
			<div id="menubar_homebtn" class="menubtn"> 
				<img alt="" src="/images/editor/menu.svg">
			</div>
			<div class="menubar_list"> 
				<button class="list_dropbtn">
					<img alt="" src="/images/editor/design.svg">
					<span>Design</span>
				</button>
				<div class="dropdown-content">
					<button onclick="openbadges()">Badges</button>
					<button>Capsule Render</button>
					<button>Typing Svg</button>
				</div>
			</div>
			<div class="menubar_list"> 
				<button class="list_dropbtn">
					<img alt="" src="/images/editor/profile.svg">
					<span>Profile</span>
				</button>
				<div class="dropdown-content">
					<button>Boj profile</button>
					<button>CodeForces</button>
				</div>
			</div>
			<div class="menubar_list"> 
				<button class="list_dropbtn">
					<img alt="" src="/images/editor/stats.svg">
					<span>Stats</span>
				</button>
				<div class="dropdown-content">
					<button>Activity Graph</button>
					<button>Hits</button>
					<button>Readme Stats</button>
					<button>Streak Stats</button>
					<button>Summary Card</button>
					<button>Top Langs</button>
					<button>Trophy</button>
				</div>
			</div>
		</div>
		<div id="menubar_btns">
			<button id="themebtn"></button>
			<button id="copybtn">Copy Code</button>
			<button id="savebtn">Save</button>
		</div>
	</div>
</body>
</html>
