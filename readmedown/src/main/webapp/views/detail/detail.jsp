
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
<link rel="stylesheet" href="/css/detail.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<script src="/js/jquery-3.6.4.min.js"></script>
<title>Read Me▼</title>
<script>
	$(document).ready(function() {
	}); //ready
	</script>

</head>
<jsp:include page="../header.jsp" />
<body>

	<div id="main_box">
		<div id="main_contents">

			<div class="split-container">
				<div class="box left-box">
<img class="leftImg" src="/images/main/img_ex2.jpg">
							

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

					</div>
					<div class="bookmark-icon">
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="69"
							viewBox="0 0 40 59" fill="none">
    <path d="M0 0.999999C0 0.447714 0.447715 0 1 0H39C39.5523 0 40 0.447715 40 1V57.5666C40 58.4602 38.9173 58.9051 38.289 58.2697L20.711 40.4943C20.3196 40.0985 19.6804 40.0985 19.289 40.4943L1.71105 58.2697C1.08272 58.9051 0 58.4602 0 57.5666V0.999999Z"
	fill="#00FEA3" />
  </svg>
					</div>


					<div class="detail_title">Title</div>

					<div class="user_nickline">
						<img class="profileimg" src="/images/default_profile.svg">
						<div class="user_nickname">user_nickname</div>
						<button class="follow">팔로우</button>
					</div>
					
					<img class="linkImg" src="/images/detail/image 147.png">
							
					<div class="detailLink"><a href="#"> http://github/adfdfadfadf</a></div>
					<div class="detail_contents">내용이들어갑니다</div> 
				
				
				
				
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


</body>
</html>
