
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
					<div  class="user_nickline">
					
					<img style="cursor: pointer;" title="클릭하면 해당 유저의 템플릿을 볼 수 있습니다." class="profileimg" onclick="window.location.href='/usermain?ui=${boardUser.user_id}'" src="${boardUser.profile_image}" alt="Profile Image" onerror="this.src='/images/default_profile.svg'">
	
						<div style="cursor: pointer;" title="클릭하면 해당 유저의 템플릿을 볼 수 있습니다." onclick="window.location.href='/usermain?ui=${boardUser.user_id}'" class="user_nickname">${boardUser.name}</div>
						
						
	<c:choose>
    <c:when test="${dto.following }">
        <c:if test="${dto.user_id ne userdto.user_id}">
            <button onclick="toggleFollow(event)" class="following"><img style="padding-top:3px; width: 12px; height: 12px;" src="/images/mypage/check.svg">팔로잉</button>
        </c:if>
    </c:when>
    <c:otherwise>
        <c:if test="${dto.user_id ne userdto.user_id}">
            <button onclick="toggleFollow(event)" class="follow">팔로우</button>
        </c:if>
    </c:otherwise>
</c:choose>


					</div>
					
							

<div class="detailLink" title="해당 링크로 이동합니다." id="linkSection">
    <img class="linkImg" src="/images/detail/image 147.png">
    <a href="${dto.board_link}">${dto.board_link}</a>
</div>


					
					
					<div class="detail_contents"><div style="width: 507px;">${dto.contents}
					</div>
					<br>
					</div> 
					

<c:set var="tags" value="${dto.board_tag}" /> <!-- 받은 태그들 -->
<c:choose>
    <c:when test="${not empty tags}">
        <div style="cursor: pointer;" class="tag">
            <c:forEach items="${fn:split(tags, '#')}" var="tag">
                <a href="/boardlist?keyword=${tag}">#${tag}</a>
            </c:forEach>
        </div>
    </c:when>
    <c:otherwise>
        <!-- 태그 값이 없을 때 아무 내용도 표시하지 않음 -->
    </c:otherwise>
</c:choose>



				
				
				
				<p class="detailcommentstart">댓글</p>
				<div class="comment">
				<c:if test="${empty commentdto}">
			
						<div style="color:var(--gray3); margin-left: 24px; margin-top: 20px;">아직 댓글이 없습니다. </div>
				
			   </c:if>
				
				
				
			<c:forEach var="comment" items="${commentdto}">
    <div ${comment.parent_id > 0 ? 'style="margin-left: 60px; width: 473px;"' : ''} class="detailCommentLine">
        <div class="pncline">
            <img style="margin-top: 10.5px; cursor: pointer;" title="클릭하면 해당 유저의 템플릿을 볼 수 있습니다." class="commentProfileImg" 
             onclick="window.location.href='/usermain?ui=${comment.user.user_id}'"
           
            src="${comment.user.profile_image}">
            
            <div style="cursor: pointer; margin-top: 10px;"title="클릭하면 해당 유저의 템플릿을 볼 수 있습니다." onclick="window.location.href='/usermain?ui=${comment.user.user_id}'" class="commentUser_nickname">${comment.user.name}</div>
            
            
            <div class="commentCreatedat">
              <jsp:useBean id="now" class="java.util.Date" />
                <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />
                <c:choose>
                     <c:when test="${comment.comment_update_date != null}">
                       
                        <fmt:parseDate value="${comment.comment_update_date}" pattern="yyyy-MM-dd HH:mm:ss" var="reg" />
                     </c:when>
                     <c:otherwise>
                       
            <fmt:parseDate  value="${comment.comment_write_date}" pattern="yyyy-MM-dd HH:mm:ss" var="reg" />
            
            
                     </c:otherwise>
                </c:choose> 
                <fmt:formatDate value="${reg}" pattern="yyyy-MM-dd" var="regDate" />
                <fmt:formatDate value="${reg}" pattern="HH:mm" var="regTime" />
                <c:choose>
                     <c:when test="${nowDate == regDate}">
                        ${regTime}
                     </c:when>
                     <c:otherwise>
                        ${regDate}
                     </c:otherwise>
                </c:choose></div>
            
            
          
            
            
            
        <c:choose>
            <c:when test="${comment.comment_writer != userdto.user_id}">
				 <button style="display: none;" data-editbtn="editLine${comment.comment_id}" class="CommentE" onclick="toggleEditcomment(event)">수정</button>            
                <button style="display: none;" data-placeid="${comment.comment_id}" onclick="clickCommentModal(event)" class="CommentD">삭제</button>
            </c:when>
            <c:otherwise>
             <button data-editbtn="editLine${comment.comment_id}"  class="CommentE" onclick="toggleEditcomment(event)">수정</button>
                <button data-placeid="${comment.comment_id}" onclick="clickCommentModal(event)" style="margin-left: -0.5px; " class="CommentD">삭제</button>
            </c:otherwise>
        </c:choose>
        
        
        
        
        
        
        
        
        
        </div>
        <button ${comment.parent_id > 0 ? 'style="display:none;"' : ''} data-replybtn="replyLine${comment.comment_id}" onclick="toggleReply(event)" class="replyB">답글</button>
       
    </div>
    <div ${comment.parent_id > 0 ? 'style="margin-left: 130px;"' : ''} class="detailComment">${comment.comment_contents}</div>
    <input type="hidden" id="commentid" value="${comment.comment_id}">
    <input type="hidden"  id="parentid"  value="${comment.parent_id}">
    <div id="replyLine${comment.comment_id}" style="display: none;" class="replyLine">
    
        <textarea class="reply_textarea" id="reply-input${comment.comment_id}" onkeydown="handleReplyKeyDown(event, '${comment.comment_id}')" name='reply_contents' placeholder="답글을 입력해주세요."></textarea>
        <div class="replyCW">
            <button class="replyCButton" data-replybtn="replyLine${comment.comment_id}" onclick="toggleReply(event)" style="border: 2px solid var(--light-stroke);">취소</button>
            <button class="replyWButton" data-replybtn="replyLine${comment.comment_id}" style="border: 2px solid var(--light-stroke);" onclick="writeReply('${comment.comment_id}')">작성</button>
        </div>
    </div>
    <div id="editLine${comment.comment_id}" style="display: none;" class="replyLine">
        <textarea class="reply_textarea" id="edit-input${comment.comment_id}" onkeydown="handleEditKeyDown(event,'${comment.comment_id}')" name='reply_contents' >${comment.comment_contents}</textarea>
        <div class="replyCW">
            <button class="replyCButton" data-replybtn="replyLine${comment.comment_id}" onclick="toggleEditcomment(event)" style="border: 2px solid var(--light-stroke);">취소</button>
            <button class="replyWButton" data-replybtn="replyLine${comment.comment_id}" style="border: 2px solid var(--light-stroke);" onclick="editComment('${comment.comment_id}')">수정</button>
        </div>
    </div>
    
</c:forEach>

				
				</div>
			
				<div class="hr"></div>
				<div>
				<div class="commentWrite">
    <img class="commentWProfileImg" title="이미지를 클릭하면 해당 유저의 템플릿을 볼 수 있습니다."  style="cursor: pointer;" onclick="window.location.href='/usermain?ui=${userdto.user_id}'" src="${userdto.profile_image}" onerror="this.src='/images/default_profile.svg'">
    <input type="text" onkeydown="handleCommentKeyDown(event)" class="comment_textarea" id="comment-input" name='comment_contents' placeholder="댓글을 입력해주세요.">
    <button onclick="edit()" class="commentWButton">작성</button>
</div>

				
				</div>
					<!-- 오른쪽 박스 내용 -->
				</div>


</div>

			</div>
		</div>
	</div>

<!-- 댓글 수정/삭제를 위한 스크립트 -->
<script>
 function toggleEditcomment(event) {
	    if ("${user_id}" === "" || "${user_id}" === null) {
	    	 alert("로그인이 필요합니다.");
	     	$("#signIn_modal").show();
	        return;
	    }

	    const button = event.currentTarget;
	    const targetReplyId = button.getAttribute("data-editbtn");
	    const replyLine = document.getElementById(targetReplyId);

	    if (replyLine) {
	        replyLine.style.display = replyLine.style.display === "none" ? "block" : "none";
	    }
	}
 function editComment(CommentId) {
	    // 필요한 데이터를 변수에 저장
	    let comment_contents = document.getElementById('edit-input' + CommentId).value;
	  	let comment_id = CommentId;
	    let board_id = "${dto.board_id}";
	    let user_id = "${userdto.user_id}";
	    
	    // FormData 객체를 생성하여 데이터 추가
	    let formData = new FormData();
	    formData.append("comment_contents", comment_contents);
	    formData.append("user_id", user_id);
	    formData.append("board_id", board_id);
	    formData.append("comment_id", comment_id);
	    // AJAX를 통해 답글 작성 처리
	    $.ajax({
	        url: "updateComment",
	        type: "post",
	        data: formData,
	        contentType: false,
	        processData: false,
	        success: function (data) {
	            if (user_id == 'null') {
	            	 alert("로그인이 필요합니다.");
	             	$("#signIn_modal").show();
	            } else {
	           
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
 function toggleReply(event) {
	    if ("${user_id}" === "" || "${user_id}" === null) {
	    	 alert("로그인이 필요합니다.");
	     	$("#signIn_modal").show();
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
	            	 alert("로그인이 필요합니다.");
	             	$("#signIn_modal").show();
	            } else {
	           
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
function handleReplyKeyDown(event, commentId) {
    if (event.key === "Enter" && !event.shiftKey) {
        event.preventDefault(); // 엔터 키의 기본 동작인 줄바꿈을 막음
        writeReply(commentId); // 여기에 작성 함수 호출 등의 동작을 추가
    }
}
function handleEditKeyDown(event, CommentId) {
    if (event.key === "Enter" && !event.shiftKey) {
        event.preventDefault(); // 엔터 키의 기본 동작인 줄바꿈을 막음
        editComment(CommentId); // 여기에 작성 함수 호출 등의 동작을 추가
    }
}

function handleCommentKeyDown(event) {
    if (event.key === "Enter" && !event.shiftKey) {
        event.preventDefault();
        edit(); // 여기에 댓글 작성 함수 호출 등의 동작을 추가
    }
}


</script>

<script>
function toggleFollow(event) {
    const button = event.currentTarget;
    const yourId = "${dto.user_id}";

    if ("${user_id}" === "" || "${user_id}" === null) {
        alert("로그인이 필요합니다.");
        $("#signIn_modal").show();
        return; // 로그인이 필요한 경우 함수 종료
    }

    if (button.classList.contains("following")) {
        deleteDFollow(yourId);
        button.classList.remove("following");
        button.classList.add("follow");
        button.textContent = "팔로우"; // 버튼 텍스트 변경
    } else {
        addFollow(yourId);
        button.classList.remove("follow");
        button.classList.add("following");

        // 새로운 이미지 요소 생성
        const image = document.createElement("img");
        image.src = "/images/mypage/check.svg";
        image.alt = "팔로잉 아이콘";
        image.style.paddingTop = "3px";
             
        image.style.width = "12px";
        image.style.height = "12px";

        // 이미지와 텍스트 추가
        button.innerHTML = ''; // 버튼 내용 초기화
        button.appendChild(image);
        button.insertAdjacentText('beforeend', '팔로잉');
    }
}

function addFollow(yourId) {
	
    $.ajax({
        url: 'addFollow',
        type: 'post',
        data: { 'your_id': yourId },
        success: function (response) {
            if (response !== -1) {
            	
            	

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
function deleteDFollow(yourId) {
    $.ajax({
        url: 'deleteDFollow',
        type: 'post',
        data: { 'your_id': yourId },
        success: function (response) {
            if (response !== -1) {
            	
                

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
function toggleBookmark(event) {
    const bookmarkImage = event.currentTarget.querySelector(".bookmarkImg");
    const boardId = "${dto.board_id}";
	
    if ("${user_id}" === "" || "${user_id}" === null) {
    	 alert("로그인이 필요합니다.");
     	$("#signIn_modal").show();
        
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

     urlmodal(); // 모달 함수 실행
 });

// 모달 함수 정의
function urlmodal() {
    const modal = document.getElementById("modal");
    modal.innerHTML = `
        <div class="modalBackdrop" onclick="cancel()"></div>
        <div class="modalContent">
            <div class="closebox" onclick="cancel()">
                <img class="modal_cancelbtn" src="/images/sign/Close.svg" alt="창닫기" />
            </div>
            <img class="deleteModalImg"  src="/images/ReadMeD_Mint.svg">
            <p>URL이 복사되었습니다.</p>
            <br>
            <div class="buttonWrap">
                <button class="btn cancel" onclick="cancel()">확인</button>
            </div>
        </div>
    `;
}

// 모달 함수에서 모달 닫기
function cancel() {
    const modal = document.getElementById("modal");
    modal.innerHTML = ""; // 모달 내용 초기화
}


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
    
    
    if ("${user_id}" === "" || "${user_id}" === null) {
    	 alert("로그인이 필요합니다.");
    	$("#signIn_modal").show();
        
        return; // 로그인이 필요한 경우 함수 종료
    }
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
            	 alert('댓글 등록이 실패했습니다.');
            } else {
              
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

<script>
$("#signIn_modal .signIn_submit").click(function(event) {
    event.preventDefault(); // 폼 제출 방지

    var email = $("#email").val();
    var password = $("#password").val();

    $.ajax({
        type: "POST",
        url: "/signin",
        data: {
            email: email,
            password: password
        },
        success: function(response) {
            if (response.success) {
                // 로그인 성공 시 처리
                $("#signIn_modal").css("display", "none");
                //새로고침코드
                location.reload();
            } else {
                $(".errorMessage").text(response.errorMessage);
            }
        }
    });
});
</script>

<script src="/js/detail/modal.js"></script>
</body>
</html>
