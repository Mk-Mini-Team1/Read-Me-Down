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
					<button onclick="openBadges()">Badges</button>
					<button onclick="">Capsule Render</button>
					<button onclick="">Typing Svg</button>
				</div>
			</div>
			<div class="menubar_list"> 
				<button class="list_dropbtn">
					<img alt="" src="/images/editor/profile.svg">
					<span>Profile</span>
				</button>
				<div class="dropdown-content">
					<button onclick="openBoj_h()">Boj Profile (hyperflow)</button>
					<button onclick="openBoj_m()">Boj Profile (mazacofo)</button>
					<button onclick="openCodeForce()">CodeForces</button>
					<button onclick="openGrass()">Solved.ac Grass</button>
				</div>
			</div>
			<div class="menubar_list"> 
				<button class="list_dropbtn">
					<img alt="" src="/images/editor/stats.svg">
					<span>Stats</span>
				</button>
				<div class="dropdown-content">
					<button onclick="openActivityGraph()">Activity Graph</button>
					<button onclick="openHits()">Hits</button>
					<button onclick="openReadmeStats()">Readme Stats</button>
					<button onclick="">Streak Stats</button>
					<button onclick="">Summary Card</button>
					<button onclick="openTopLangs()">Top Langs</button>
					<button onclick="">Trophy</button>
				</div>
			</div>
		</div>
		<div id="menubar_btns">
			<button id="themebtn"></button>
			<button id="copybtn">Copy Code</button>
			<button id="savecodebtn">Save</button>
		</div>
	</div>
	<script>
	</script>
</body>
</html>
