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
<link rel="stylesheet" href="css/pagination_shop.css" />
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
						<a href="/mypage?searchType1=${user_id}" class="category-link" id="myTemplateLink"
							style="border-bottom: 7px solid var(--neon3);"> <img
							src="/images/mypage/my_template.svg">내 템플릿
						</a>
					</div>
					<div class="category">
						<a href="/bookmarks" class="category-link"
							id="bookmarksLink"> <img src="/images/mypage/bookmarks.svg">북마크
						</a>
					</div>
					<div class="category">
						<a href="/following" class="category-link"
							id="followingLink"> <img src="/images/mypage/following.svg">팔로잉
						</a>
					</div>
				</div>
				<div class="infoWrap" id="infoWrap">
					<div class="myTemplate_list">
						<div class="myTemplates">
							<c:forEach items="${response.list}" var="template">
								<div class="grid-item" id="${template.board_id}">
									<img src='${template.board_img}'
										onerror="this.src='/images/main/no_img.svg'" alt="template">
									<div class="dark-overlay">
										<c:choose>
											<c:when test="${template.secret eq 'yes'}">
												<div class="btn-plus">
													<div class="mypage_unlock_box">
														<img class="mypage_unlock_btn"
															src='/images/mypage/unlock.svg'>
													</div>
												</div>
											</c:when>
											<c:otherwise>
												<div class="lock-plus">
													<div class="mypage_lock_box">
														<img class="mypage_lock_btn" src='/images/mypage/lock.svg'>
													</div>
												</div>
											</c:otherwise>
										</c:choose>
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
//사진 누르면 디테일 페이지로 이동
$(".myTemplates").on('click', ".grid-item" ,function(){
	let bi = $(this).attr("id");
	//alert(bi);
	location.href = "/detail?bi="+bi;
});


//템플릿 비공개
$(".mypage_lock_btn").on('click', function(e){
	e.stopPropagation();//클릭 이벤트 버블링 막기
	const boardId = $(this).parents().parents(".grid-item").attr('id');
	const lockCss = $(this).parents().siblings(".lock-plus");
	//alert(boardId);
	if("${user_id}" == "" || "${user_id}" == null){
		//alert("로그인이 필요합니다.");
		openAlertModal("로그인이 필요합니다.");
	}
	else {
		$.ajax({
            url: 'templateLock',
            type: 'post',
            data: { 'board_id': boardId },
            success: function (response) {
                if (response != -1) {
                    lockCss.show();
                    // 템플릿의 secret 상태를 "yes"로 업데이트
                    $("#" + boardId).find(".secret").text("yes");
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
	} 
});
//템플릿 공개
$(".mypage_unlock_btn").on('click', function(e){
	e.stopPropagation();//클릭 이벤트 버블링 막기
	const boardId2 = $(this).parents().parents(".grid-item").attr('id');
	const UnlockCss = $(this).parents(".btn-plus");
	//alert(boardId2);
	if("${user_id}" == "" || "${user_id}" == null){
		//alert("로그인이 필요합니다.");
		openAlertModal("로그인이 필요합니다.");
	}
	else {
		$.ajax({
            url: 'templateUnlock',
            type: 'post',
            data: { 'board_id': boardId2 },
            success: function (response) {
                if (response != -1) {
                    UnlockCss.hide();
                    // 템플릿의 secret 상태를 "no"로 업데이트
                    $("#" + boardId2).find(".secret").text("no");
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
	}
});



</script>
<script src="/js/mypage/myPage.js"></script>
</body>
</html>

