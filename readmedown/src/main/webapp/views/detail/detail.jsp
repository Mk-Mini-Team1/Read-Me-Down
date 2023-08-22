
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
<!-- 버튼 세션 처리 -->
<script>
$(document).ready(function() {
	 var user_id = '<%=session.getAttribute("user_id")%>';

    if (user_id === '${dto.user_id}') {
        $(".templateUse").hide();
        $(".templateShare").hide();
        $(".updateBtn").show();
        $(".deleteBtn").show();
    } else {
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
						 <div  class="templateUse" onclick="window.location.href='/editor?bi=${dto.board_id}'">
							<span  style="cursor: pointer;" class="material-symbols-outlined"> edit_square </span> <a
								style="position: relative; top: -5px;" href="#">템플릿사용하기</a>
						</div>
						<!-- HTML 코드 -->
<div id="shareLink"  style="cursor: pointer;" class="templateShare">
    <img class="shareImg" src="/images/detail/Mask_group.svg">
    <a id="shareLink" style="position: relative; top: -5px;" >공유하기</a>
</div>

				<div class="updateBtn">
    <img class="updateImg" style="cursor: pointer;" src="/images/detail/t.svg" onclick="window.location.href='/editor?bi=${dto.board_id}'">
    <a class="updateA" style="position: relative; top: -5px;" href="/editor?bi=${dto.board_id}">
        수정
    </a>
</div>

						<div style="cursor: pointer;"  onclick="clickModal(event)" class="deleteBtn">
							<img class="deleteImg" src="/images/detail/x.svg">
							<a class="deleteA"  onclick="clickModal(event)" data-placeid="${dto.board_id}" style="position: relative; top: -5px;" >
							삭제</a>

						</div>

					</div>
					
				
		
<c:choose>
<c:when test="${dto.bookmarked}">
 <div class="bookmarked-plus" style="display : block;">
              <div class="bookmark-icon"><button onclick="toggleBookmark(event)"><img class="bookmarkImg" src='/images/main/bookmark_after.svg'>
               </button></div>
         </div>
	        </c:when>
						<c:otherwise>
	      <div class="bookmarked-plus">
               <div class="bookmark-icon"><button onclick="toggleBookmark(event)"><img class="bookmarkImg" src='/images/main/bookmark_before.svg'></button></div>
               </div>
				        </c:otherwise>
			</c:choose>

				<div class="detail_title">${dto.title}</div>
<div id="modal" ></div>
					<div class="user_nickline">
						<img class="profileimg" src="${boardUser.profile_image}" alt="Profile Image" onerror="this.src='/images/default_profile.svg'">
						
						<div class="user_nickname">${boardUser.name}</div>
						<button onclick="clickfollow(event)" class="follow">팔로우</button>
					</div>
					
							

<div class="detailLink" id="linkSection">
    <img class="linkImg" src="/images/detail/image 147.png">
    <a href="${dto.board_link}">${dto.board_link}</a>
</div>


					
					
					<div class="detail_contents">${dto.contents}</div> 
				
				
				
				
				<p class="detailcommentstart">댓글</p>
				<div class="comment">
				<c:if test="${empty commentdto}">
			
						<div style="color:var(--gray3); margin-left: 24px; margin-top: 20px;">아직 댓글이 없습니다. </div>
				
			   </c:if>
				
				
				
			<c:forEach var="comment" items="${commentdto}">
    <div ${comment.parent_id > 0 ? 'style="margin-left: 60px; width: 473px;"' : ''} class="detailCommentLine">
        <div class="pncline">
            <img style="margin-top: 8px;" class="commentProfileImg" src="${comment.user.profile_image}">
            
            <div style="margin-top: 8px;" class="commentUser_nickname">${comment.user.name}</div>
            <div class="commentCreatedat"><fmt:formatDate value="${comment.comment_write_date}" pattern="yyyy-MM-dd H:mm" /></div>
        <c:choose>
            <c:when test="${comment.comment_writer != userdto.user_id}">
                <button style="display: none;" data-placeid="${comment.comment_id}" onclick="clickCommentModal(event)" class="CommentD">삭제</button>
            </c:when>
            <c:otherwise>
                <button data-placeid="${comment.comment_id}" onclick="clickCommentModal(event)" class="CommentD">삭제</button>
            </c:otherwise>
        </c:choose>
        </div>
        <button ${comment.parent_id > 0 ? 'style="display:none;"' : ''} data-replybtn="replyLine${comment.comment_id}" onclick="toggleReply(event)" class="replyB">답글</button>
       
    </div>
    <div ${comment.parent_id > 0 ? 'style="margin-left: 123px;"' : ''} class="detailComment">${comment.comment_contents}</div>
    <div style="display: none;" id="commentid">${comment.comment_id}</div>
    <div id="replyLine${comment.comment_id}" style="display: none;" class="replyLine">
        <textarea class="reply_textarea" id="reply-input${comment.comment_id}" name='reply_contents' placeholder="답글을 입력해주세요."></textarea>
        <div class="replyCW">
            <button class="replyCButton" data-replybtn="replyLine${comment.comment_id}" onclick="toggleReply(event)" style="border: 2px solid var(--light-stroke);">취소</button>
            <button class="replyWButton" data-replybtn="replyLine${comment.comment_id}" style="border: 2px solid var(--light-stroke);" onclick="writeReply('${comment.comment_id}')">작성</button>
        </div>
    </div>
</c:forEach>

				
				</div>
			
				<div class="hr"></div>
				<div>
				<div class="commentWrite">
    <img class="commentWProfileImg" src="${userdto.profile_image}" onerror="this.src='/images/default_profile.svg'">
    <input type="text" class="comment_textarea" id="comment-input" name='comment_contents' placeholder="댓글을 입력해주세요.">
    <button onclick="edit()" class="commentWButton">작성</button>
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
          
            button.textContent = "팔로우";
            button.classList.remove("following");
            button.classList.remove("hovered");
        } else {
         
            button.classList.add("following");
            button.classList.add("hovered");
            button.textContent = "∨팔로잉";
        }
    }
</script>
 <script>
 function toggleReply(event) {
	    if ("${user_id}" === "" || "${user_id}" === null) {
	        alert("로그인이 필요합니다.");
	        return;
	    }

	    const button = event.currentTarget;
	    const targetReplyId = button.getAttribute("data-replybtn");
	    const replyLine = document.getElementById(targetReplyId);

	    if (replyLine) {
	        replyLine.style.display = replyLine.style.display === "none" ? "block" : "none";
	    }
	}
 function writeReply(parentCommentId) {
	    // 필요한 데이터를 변수에 저장
	    let comment_contents = document.getElementById('reply-input' + parentCommentId).value;
	    let board_id = "${dto.board_id}";
	    let user_id = "${userdto.user_id}";
	    
	    // FormData 객체를 생성하여 데이터 추가
	    let formData = new FormData();
	    formData.append("comment_contents", comment_contents);
	    formData.append("user_id", user_id);
	    formData.append("board_id", board_id);
	    formData.append("parent_id", parentCommentId); // 대댓글의 부모 댓글 ID

	    // AJAX를 통해 답글 작성 처리
	    $.ajax({
	        url: "addComment",
	        type: "post",
	        data: formData,
	        contentType: false,
	        processData: false,
	        success: function (data) {
	            if (user_id == 'null') {
	                alert('로그인이 필요합니다.');
	            } else {
	                alert('답글 등록이 완료되었습니다.');
	                // 페이지 새로고침
	                location.reload();
	            }
	        },
	        error: function (xhr, status, error) {
	            alert('답글 등록이 실패했습니다.');
	        }
	    });
	}

</script>


<script>
function toggleBookmark(event) {
    const bookmarkImage = event.currentTarget.querySelector(".bookmarkImg");
    const boardId = "${dto.board_id}";
	
    if ("${user_id}" === "" || "${user_id}" === null) {
        alert("로그인이 필요합니다.");
        
        return; // 로그인이 필요한 경우 함수 종료
    }

    if (bookmarkImage.src.includes("bookmark_before.svg")) {
        addDBookmark(boardId);
        bookmarkImage.src = "/images/main/bookmark_after.svg";
    } else {
        deleteDBookmark(boardId);
        bookmarkImage.src = "/images/main/bookmark_before.svg";
    }
}

function addDBookmark(boardId) {
    $.ajax({
        url: 'addDBookmark',
        type: 'post',
        data: { 'board_id': boardId },
        success: function (response) {
            if (response !== -1) {
            	 alert("북마크가 추가되었습니다.");
            } else {
                alert("문제가 발생했습니다.");
            }
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}

function deleteDBookmark(boardId) {
    $.ajax({
        url: 'deleteDBookmark',
        type: 'post',
        data: { 'board_id': boardId },
        success: function (response) {
            if (response !== -1) {
            	 alert("북마크가 삭제되었습니다.");
            } else {
                alert("문제가 발생했습니다.");
            }
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}
</script>
<script>

 document.getElementById("shareLink").addEventListener("click", function(event) {
     event.preventDefault(); // 기본 링크 동작 방지

     const currentURL = window.location.href; // 현재 페이지의 URL 가져오기

     // 가상의 textarea 엘리먼트를 생성하여 클립보드에 복사
     const textarea = document.createElement("textarea");
     textarea.value = currentURL;
     document.body.appendChild(textarea);
     textarea.select();
     document.execCommand("copy");
     document.body.removeChild(textarea);

     alert("URL이 복사되었습니다 " );
 });

 
 </script>
 <script>

 document.addEventListener("DOMContentLoaded", function() {
     const linkSection = document.getElementById("linkSection");
     const linkImg = linkSection.querySelector(".linkImg");
     const linkAnchor = linkSection.querySelector("a");
     
     // href 속성이 없을 경우 이미지 영역을 숨김
     if (!linkAnchor.getAttribute("href")) {
         linkImg.style.display = "none";
     }
 });

</script>
<script>
function edit() {
    // 댓글 내용을 가져옴
    let comment_contents = document.getElementsByName('comment_contents')[0].value;
    
    // 필요한 데이터를 변수에 저장
    let board_id = "${dto.board_id}";
    let user_id = "${userdto.user_id}";
    
    // 댓글 내용이 비어있는 경우 알림을 띄움
    if (comment_contents === '') {
        alert('댓글을 입력해주세요.');
        return false;
    }

    // FormData 객체를 생성하여 데이터 추가
    let formData = new FormData();
    formData.append("comment_contents", comment_contents);
    formData.append("user_id", user_id);
    formData.append("board_id", board_id);

    // AJAX를 통해 댓글 작성 처리
    $.ajax({
        url: "addComment",
        type: "post",
        data: formData,
        contentType: false,
        processData: false,
        success: function (data) {
            if (user_id == 'null') {
                alert('로그인이 필요합니다.');
            
            } else {
                alert('댓글 등록이 완료되었습니다.');
                // 페이지 새로고침
                location.reload();
            }
        },
        error: function (xhr, status, error) {
            alert('댓글 등록이 실패했습니다.');
        }
    });
}
</script>

</body>
</html>
