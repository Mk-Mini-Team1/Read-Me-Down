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
<link rel="stylesheet" href="/css/mypage/myPage.css" />
<link rel="stylesheet" href="/css/mypage/followingList.css" />
<script src="/js/jquery-3.6.4.min.js"></script>
<title>Read Me▼</title>
</head>
<body>
<jsp:include page="../header.jsp" />

<div id="main_box">
    <div id="main_contents">
        <div class="container">
            <div class="contentWrap">
                <div class="userInfo">
                    <div class="user">
                        <div class="profile-image">
                        </div>
                        <p>리드미개발자<span>님</span></p>
                       <button onclick="redirectToEditProfile()">Edit Profile</button>
                    </div>
                </div>
            </div>
				<div class="categoryWrap">
					<div class="category">
						<a onclick="showContent('myTemplate')" class="category-link"
							id="myTemplateLink"> <img
							src="/images/mypage/my_template.svg">내 템플릿
						</a>
					</div>
					<div class="category">
						<a onclick="showContent('bookmarks')" class="category-link"
							id="bookmarksLink"> <img src="/images/mypage/bookmarks.svg">북마크
						</a>
					</div>
					<div class="category">
						<a onclick="showContent('following')" class="category-link"
							id="followingLink"> <img src="/images/mypage/following.svg">팔로잉
						</a>
					</div>
				</div>
				<div class="infoWrap" id="infoWrap">
					<div class="myTemplate_list" style="display: block;">
						<div class="myTemplates">							
							<div class="grid">
								<div class="grid-sizer"></div>
								<c:forEach begin="1" end="12" varStatus="vs">
									<div class="grid-item">
										<img src='/images/main/img_ex${vs.count}.jpg' alt="template">
										<div class="darkness"></div>
										<div class="btn-plus">
											<input type=button class="main_bookmark_btn" value="북마크">
										</div>
									</div>
								</c:forEach>	
							</div>
						</div>
					</div>
					<div class="bookmarks_list" style="display: none;">
						<div class="bookmarks">
							<p>북마크한 목록을 표시합니다.</p>
						</div>
					</div>
					<div class="following_list" style="display: none;">
						<div class="following_user">
							<div class="user_image">								
							</div>
							<div class="user_name">
								<p>@템플릿기부천사</p>
							</div>
							<div class="follow_button">
								<button onmouseover="showUnfollowText(this)"
									onmouseout="showFollowingText(this)">Following</button>
							</div>
						</div>
						<div class="following_user">
							<div class="user_image">						
							</div>
							<div class="user_name">
								<p>@리드미참쉽죠</p>
							</div>
							<div class="follow_button">
								<button onmouseover="showUnfollowText(this)"
									onmouseout="showFollowingText(this)">Following</button>
							</div>
						</div>
					</div>
				</div>
			</div>
    </div>
</div>
	<script>
		//팔로잉버튼 언팔로우 호버
		function showUnfollowText(button) {
			if (button) {
				button.textContent = "Unfollow";
			}
		}

		function showFollowingText(button) {
			if (button) {
				button.textContent = "Following";
			}
		}

		//프로필수정 이동
		function redirectToEditProfile() {
		    window.location.href = "/mypage/edit"; // 지정된 페이지로 이동
		}
		
		
		//카테고리 적용
		function showContent(contentType) {
			var contentDivs = document.getElementsByClassName("infoWrap")[0].children;
			for (var i = 0; i < contentDivs.length; i++) {
				if (contentDivs[i].classList.contains(contentType + "_list")) {
					contentDivs[i].style.display = "block";
				} else {
					contentDivs[i].style.display = "none";
				}
			}

			// 카테고리 링크에 선택된 스타일 적용
			var categoryLinks = document
					.getElementsByClassName("category-link");
			for (var i = 0; i < categoryLinks.length; i++) {
				if (categoryLinks[i].id === contentType + "Link") {
					categoryLinks[i].classList.add("category-selected");
				} else {
					categoryLinks[i].classList.remove("category-selected");
				}
			}

			// 내 템플릿 카테고리에 선택된 스타일 적용 (기본 선택)
			var myTemplateLink = document.getElementById("myTemplateLink");
			if (contentType === "myTemplate") {
				myTemplateLink.classList.add("category-selected");
			} else {
				myTemplateLink.classList.remove("category-selected");
			}
		}

		// 페이지 로딩 시 기본 카테고리 설정
		window.onload = function() {
			showContent('myTemplate');
		};

		$(document).ready(function() {
			var msnry = new Masonry('.grid', {
				itemSelector : '.grid-item',
				columnWidth : '.grid-sizer',
				percentPosition : true,
				gutter : 20,
			});
			imagesLoaded('.grid').on('progress', function() {
				msnry.layout();
			});

		}); //ready
	</script>

</body>
</html>

