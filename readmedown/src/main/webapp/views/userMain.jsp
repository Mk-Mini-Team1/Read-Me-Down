<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
<script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
<link rel="icon" href="/images/logo-pencil.png" />
<link rel="apple-touch-icon" href="/images/logo-pencil.png" />
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/userMain.css" />
<script src="/js/jquery-3.6.4.min.js"></script>
<title>Read Me▼</title>
</head>
<body>
<jsp:include page="header.jsp" />

	<div id="main_box">
		<div id="main_contents">
			<div class="container">
				<div class="contentWrap">
					<div class="userInfo">
						<div class="user">
							<div class="profile-image"></div>
							<div class="nick-name">
								<p>
									템플릿기부천사<span>님</span>
								</p>
							</div>
							<div class="follow-num">
								<p>팔로워 23명</p>
							</div>
							<div class="follow_button">
								<button onmouseover="showUnfollowText(this)"
									onclick="removeFollowingUser(this)">팔로잉</button>
							</div>

						</div>
					</div>
				</div>
				<div class="categoryWrap">
					<div class="category">
						<p>
							<img src="/images/mypage/my_template.svg">유저 템플릿
						</p>
					</div>
				</div>
				<div class="infoWrap" id="infoWrap">					
							<div id="main_gallery">
								<div class="grid">
									<div class="grid-sizer"></div>
									<c:forEach begin="1" end="19" varStatus="vs">
										<div class="grid-item">
											<img src='/images/main/readme_ex${vs.count}.png'
												alt="template">
											<div class="darkness"></div>
											<div class="btn-plus">
												<div class="main_bookmark_box">
													<img class="main_bookmark_btn"
														src='/images/main/bookmark_before.svg'>
												</div>
											</div>
											<div class="bookmarked-plus">
												<div class="main_bookmarked_box">
													<img class="main_bookmarked_btn"
														src='/images/main/bookmark_after.svg'>
												</div>
											</div>
										</div>
									</c:forEach>									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>		
	<script>
	// 함수 정의: 팔로우 버튼에 마우스를 가져다 대면 언팔로우로 변경
	function showUnfollowText(button) {
	    $(button).text("언팔로우");
	}

	$(document).ready(function() {
	    // 팔로우 버튼에 마우스를 가져다 대면 언팔로우로 변경
	    $(".follow_button button").hover(
	        function() {
	            showUnfollowText(this);
	        },
	        function() {
	            // 마우스를 떼었을 때 버튼 텍스트를 팔로잉 또는 언팔로우로 변경
	            var buttonText = $(this).hasClass("following") ? "언팔로우" : "팔로잉";
	            $(this).text(buttonText);
	        }
	    );

	    // 팔로우 버튼 클릭 시 클래스 토글 및 동작 실행
	    $(".follow_button button").on('click', function() {
	        var isFollowing = $(this).hasClass("following");      
	        // 팔로우 버튼 클래스 토글
	        $(this).toggleClass("following");
	    });
	});
	
	
</script>
</body>
</html>

