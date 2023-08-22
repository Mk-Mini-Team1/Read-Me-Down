<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
			<div class="mypage_container">
				<div class="contentWrap">
					<div class="userInfo">
						<div class="user">
							<div class="mypage-profile-image"><img src="${info.profile_image}"></div>
							<span id="name">${info.name}</span>
							<span id="git"><img src="/images/mypage/git.svg">${info.git_id}</span>
							<button onclick="redirectToEditProfile()">Edit Profile</button>
						</div>
					</div>
				</div>
				<div class="categoryWrap">
					<div class="category">
						<a href="/mypage?searchType1=${user_id}" class="category-link"
							id="myTemplateLink"> <img
							src="/images/mypage/my_template.svg">내 템플릿
						</a>
					</div>
					<div class="category">
						<a href="/bookmarks" class="category-link" id="bookmarksLink"
							style="border-bottom: 7px solid var(--neon3);"> <img
							src="/images/mypage/bookmarks.svg">북마크
						</a>
					</div>
					<div class="category">
						<a href="/following" class="category-link"
							id="followingLink"> <img src="/images/mypage/following.svg">팔로잉
						</a>
					</div>
				</div>
				<div class="infoWrap" id="infoWrap">
					<div class="bookmarks_list">
						<div class="bookmarks">
						<c:forEach items="${response.list}" var="bookmark">
							<div class="grid-item" id="${bookmark.board_id}">
								<img src='${bookmark.board_img}'
									onerror="this.src='/images/main/no_img.svg'" alt="template">
								<div class="darkness"></div>
								<div class="btn-plus">
									<div class="mypage_bookmark_box">
										<img class="mypage_bookmark_btn"
											src='/images/main/bookmark_before.svg'>
									</div>
								</div>
								<div class="bookmarked-plus">
									<div class="mypage_bookmarked_box">
										<img class="mypage_bookmarked_btn"
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
<script src="/js/mypage/myPage.js"></script>
</body>
</html>

