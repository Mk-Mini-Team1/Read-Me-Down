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
							<div class="profile-image"></div>
							<p>
								리드미개발자<span>님</span>
							</p>
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
					<div class="bookmarks_list" style="display: none;">
						<div class="bookmarks">
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
					<div class="following_list" style="display: none;">
						<div class="following_user">
							<div class="user_image"></div>
							<div class="user_name">
								<p>@템플릿기부천사</p>
							</div>
							<div class="follow_button">
								<button onmouseover="showUnfollowText(this)"
									onclick="removeFollowingUser(this)">팔로잉</button>
							</div>
						</div>
						<div class="following_user">
							<div class="user_image"></div>
							<div class="user_name">
								<p>@리드미참쉽죠</p>
							</div>
							<div class="follow_button">
								<button onmouseover="showUnfollowText(this)"
									onclick="removeFollowingUser(this)">팔로잉</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="/js/mypage/mypage.js"></script>
</body>
</html>

