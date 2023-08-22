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
					<div class="mypage_list" id="mypage_list">
						<div class="mypage">
							<c:forEach items="${response.list}" var="bookmark"
								varStatus="status">
								<div class="grid-item" id="${bookmark.board_id}">
									<img src='${bookmark.board_img}'
										onerror="this.src='/images/main/no_img.svg'" alt="template">
									<div class="darkness"></div>
									<div class="bookmarked-plus" style="display: block;">
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
//북마크 해제
$("#mypage_list").on('click','.main_bookmarked_btn', function(e){
	e.stopPropagation();//클릭 이벤트 버블링 막기
	const boardId2 = $(this).parents().parents(".grid-item").attr('id');
	const bookmarkCss2 = $(this).parents(".bookmarked-plus");	
	
  		$.ajax({
			url : 'deleteBookmark',
			type : 'post',
			data : {'board_id' : boardId2},
			success : function(response){
				if(response != -1) {
					bookmarkCss2.hide();//북마크제거 css효과		
					$("#mypage_list").load(window.location.href + " #mypage_list");
				}
				else {
					//alert("문제가 발생했습니다.");
					openAlertModal("문제가 발생했습니다.");
				}
			},
            error: function(request,status,error) {
	      		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	      		console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	      	}
		});//ajax	
});

//상세페이지이동
$(".mypage").on('click', ".grid-item" ,function(){
	let bi = $(this).attr("id");
	//alert(bi);
	location.href = "/detail?bi="+bi;
});
</script>
<script src="/js/mypage/myPage.js"></script>
</body>
</html>

