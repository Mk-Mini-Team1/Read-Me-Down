
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="/css/detail/detail.css" />
<link rel="stylesheet" href="/css/detail/modal.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<script src="/js/jquery-3.6.4.min.js"></script>
<title>Read Me▼</title>
<script>
$(document).ready(function() {
    var user_id = "${dto.user_id}";

    if (user_id === 'user123') {
        console.log('Showing #replyButton');
        $(".templateUse").hide();
        $(".templateShare").hide();
        $(".updateBtn").show();
        $(".deleteBtn").show();
    } else {
        console.log('Hiding #replyButton');
        $(".templateUse").show();
        $(".templateShare").show();
        $(".updateBtn").hide();
        $(".deleteBtn").hide();
    }
});
</script>


</head>
<jsp:include page="../header.jsp" />
<body>

	<div id="main_box">
		<div id="main_contents">
<div class="all_container">
			<div class="split-container">
				<div class="box left-box">
<img class="leftImg" src="${dto.board_img }">
							

					<!-- 왼쪽 박스 내용 -->
				</div>
				
				<div class="box right-box">
					<div class="detail_button">
						 <div class="templateUse">
							<span class="material-symbols-outlined"> edit_square </span> <a
								style="position: relative; top: -5px;" href="#">템플릿사용하기</a>
						</div>
						<div class="templateShare">
							<img class="shareImg" src="/images/detail/Mask_group.svg">
							<a style="position: relative; top: -5px;" href="#">공유하기</a>

						</div> 
					<div class="updateBtn">
							<img class="updateImg"  src="/images/detail/t.svg">
							<a class="updateA" style="position: relative; top: -5px;" href="#">
							수정</a>
						</div>
						<div class="deleteBtn">
							<img class="deleteImg" src="/images/detail/x.svg">
							<a class="deleteA"  onclick="clickModal(event)" style="position: relative; top: -5px;" href="#">
							삭제</a>

						</div>

					</div>
					<div class="bookmark-icon">
						<button onclick="toggleBookmark(event)"><img class="bookmarkImg" src="/images/main/bookmark_before.svg">
							</button>
					</div>


					<div class="detail_title">${dto.title}</div>
<div id="modal" ></div>
					<div class="user_nickline">
						<img class="profileimg" src="/images/default_profile.svg">
						<div class="user_nickname">user_nickname</div>
						<button onclick="clickfollow(event)" class="follow">팔로우</button>
					</div>
					
							
					<div class="detailLink">
					<img class="linkImg" src="/images/detail/image 147.png">
					<a href="#"> ${dto.board_link}</a>
					</div>
					<div class="detail_contents">${dto.contents}</div> 
				
				
				
				
				<p class="detailcommentstart">댓글</p>
				<div class="comment">
				<div class="detailCommentLine">
				<div class="pncline">
						<img class="commentProfileImg" src="/images/default_profile.svg">
						<div class="commentUser_nickname">user_nickname</div>
						<div class="commentCreatedat">2023.08.12</div>
						</div>
						<button class="replyB">답글</button>
				
				</div>
						<div class="detailComment">댓글댓글댓글댓글댓글</div>
			
				<div class="replyLine">
				<textarea class="reply_textarea" id="reply-input"
				name='reply_contents' placeholder="답글을 입력해주세요."></textarea>
			
				
				<div class="replyCW">
<button class="replyCButton" style=" border: 2px solid var(--light-stroke);">취소</button>
<button class="replyWButton" style=" border: 2px solid var(--light-stroke);">작성</button>
				</div>
				</div>
				<div class="detailCommentLine">
				<div class="pncline">
						<img class="commentProfileImg" src="/images/default_profile.svg">
						<div class="commentUser_nickname">user_nickname</div>
						<div class="commentCreatedat">2023.08.12</div>
						</div>
						<button class="replyB">답글</button>
				
				</div>
						<div class="detailComment">댓글댓글댓글댓글댓글</div>
			
				<div class="replyLine">
				<textarea class="reply_textarea" id="reply-input"
				name='reply_contents' placeholder="답글을 입력해주세요."></textarea>
			
				
				<div class="replyCW">
				

<button class="replyCButton" style=" border: 2px solid var(--light-stroke);" >취소</button>
<button class="replyWButton" style=" border: 2px solid var(--light-stroke);">작성</button>
				</div>
				</div>
				<div class="detailCommentLine">
				<div class="pncline">
						<img class="commentProfileImg" src="/images/default_profile.svg">
						<div class="commentUser_nickname">user_nickname</div>
						<div class="commentCreatedat">2023.08.12</div>
						</div>
						<button class="replyB">답글</button>
				
				</div>
						<div class="detailComment">댓글댓글댓글댓글댓글</div>
			
				<div class="replyLine">
				<textarea class="reply_textarea" id="reply-input"
				name='reply_contents' placeholder="답글을 입력해주세요."></textarea>
			
				
				<div class="replyCW">
<button class="replyCButton" style=" border: 2px solid var(--light-stroke);">취소</button>
<button class="replyWButton" style=" border: 2px solid var(--light-stroke);">작성</button>
				</div>
				</div>
				</div>
			
				<div class="hr"></div>
				<div>
				<div class="commentWrite">
				<img class="commentWProfileImg" src="/images/default_profile.svg">
				<input type="text" class="comment_textarea" id="comment-input"
				name='comment_contents' placeholder="댓글을 입력해주세요.">
			<button class="commentWButton">작성</button>
			</div>
				
				</div>
					<!-- 오른쪽 박스 내용 -->
				</div>


</div>

			</div>
		</div>
	</div>

 <script src="/js/detail/modal.js"></script>
	<script>
    function clickfollow(event) {
        const button = event.currentTarget;

        if (button.classList.contains("following")) {
            // 이미 팔로우 중인 상태인 경우, 원래 상태로 복원
            button.textContent = "팔로우";
            button.classList.remove("following");
            button.classList.remove("hovered");
        } else {
            // 팔로우하지 않은 상태인 경우, 팔로잉 상태로 변경
            button.classList.add("following");
            button.classList.add("hovered");
            button.textContent = "∨팔로잉";
        }
    }
</script>

 <script>
 function toggleBookmark(event) {
     const bookmarkImage = event.currentTarget.querySelector(".bookmarkImg");
     if (bookmarkImage.src.includes("bookmark_before.svg")) {
         addBookmark();
     } else {
         deleteBookmark();
     }
 }

	function addBookmark() {
	  // 북마크 추가 동작 수행
	  // ...

	  // 이미지 변경
	  const bookmarkImage = document.querySelector(".bookmarkImg");
	  bookmarkImage.src = "/images/main/bookmark_after.svg";
	}

	function deleteBookmark() {
	  // 북마크 추가 동작 수행
	  // ...

	  // 이미지 변경
	  const bookmarkImage = document.querySelector(".bookmarkImg");
	  bookmarkImage.src = "/images/main/bookmark_before.svg";
	}

 
 
 </script>
</body>
</html>
