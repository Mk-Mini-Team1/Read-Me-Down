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
						<a href="/bookmarks?searchType1=${user_id}" class="category-link"
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
					<div class="mypage_list">
						<div class="mypage">
							<c:forEach items="${response.list}" var="template">
								<div class="grid-item" id="${template.board_id}">
									<img src='${template.board_img}'
										onerror="this.src='/images/main/no_img.svg'" alt="template">
									<div class="darkness"></div>
									<div class="btn-plus">
										<div class="main_bookmark_box">
											<img class="main_bookmark_btn"
												src='/images/mypage/unlock.svg'>
										</div>
									</div>
									<c:choose>
										<c:when test="${template.secret eq 'yes'}">
											<div class="lock-plus" style="display: block;">
												<div class="main_lock_box">
													<img class="main_lock_btn"
														src='/images/mypage/lock.svg'>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="lock-plus">
												<div class="main_lock_box">
													<img class="main_lock_btn"
														src='/images/mypage/lock.svg'>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				
				<!-- pagination -->
<div id="below_box">
<div id="board_paging_box">
         <c:if test="${fn:length(response.list) != 0}">
            <div class="pagefirst"
               <c:if test="${!response.pagination.existPrevPage}"> style="visibility: hidden;" </c:if>>
               <input type="button" class="pageBtn" id="boardPageBtnFirst" value="◁◁">
            </div>
            <div class="prev" id="${response.pagination.startPage-1}"
               <c:if test="${!response.pagination.existPrevPage}"> style="visibility: hidden;" </c:if>>
               <input type="button" class="pageBtn" id="boardPageBtnPre" value="◁">
            </div>

            <c:forEach begin="${response.pagination.startPage}"
               end="${response.pagination.endPage}" varStatus="vs">
               <c:if test="${vs.index == searchdto.page}">
	               <input type="button" class="pageNumBtn" value="${vs.index}" style="font-weight: 900; color:var(--point);">
               </c:if>
               <c:if test="${vs.index != searchdto.page}">
	               <input type="button" class="pageNumBtn" value="${vs.index}" style="font-weight: 300">
               </c:if>
            </c:forEach>

            <div class="next" id="${response.pagination.startPage+10}"
               <c:if test="${!response.pagination.existNextPage}"> style="visibility: hidden;" </c:if>>
               <input type="button" class="pageBtn" id="boardPageBtnNext" value="▷">
            </div>
            <div class="pagelast" id="${response.pagination.totalPageCount}"
               <c:if test="${!response.pagination.existNextPage}"> style="visibility: hidden;" </c:if>>
               <input type="button" class="pageBtn" id="boardPageBtnLast" value="▷▷">
            </div>
         </c:if>
</div>
</div>
<!-- pagination -->
			</div>
		</div>		
	</div>
	<script>
	
//사진 누르면 디테일 페이지로 이동
$(".mypage").on('click', ".grid-item" ,function(){
	let bi = $(this).attr("id");
	//alert(bi);
	location.href = "/detail?bi="+bi;
});


$(".main_bookmark_btn").on('click', function(e) {
    e.stopPropagation(); // 클릭 이벤트 버블링 막기
    const boardId = $(this).parents(".grid-item").attr('id'); 
    const lockCss = $(this).parents().siblings(".lock-plus"); 
    const isSecret = $(this).parents(".grid-item").find(".secret");

    $.ajax({
        url: '/updateTemplateSecret',
        type: 'post',
        data: {
            'board_id': boardId,
            'secret': isSecret.text().trim() === 'yes' ? 'no' : 'yes' // .trim()으로 공백 제거하여 비교
        },
        success: function(response) {
            if (response === 'success') {
                if (isSecret.text().trim() === 'yes') {
                    lockCss.hide();
                    isSecret.text('no');
                } else {
                    lockCss.show();
                    isSecret.text('yes');
                }
            } else {               
                openAlertModal("문제가 발생했습니다.");
            }
        },
        error: function(request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    }); // ajax
});



//------------------------------- paging --------------------------------------

let searchWord = $("#search_word_input").val();

//페이지 버튼 눌렀을때 해당페이지 보여주기
	$(".pageNumBtn").on('click', function(){
	const queryparamsPage = {
	   page: $(this).val(),
	   keyword : searchWord
	}
	location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
});//pageNumBtn클릭

//첫페이지
	$("#boardPageBtnFirst").on('click', function(){
	const queryparamsPage = {
	   page: 1,
	   keyword : searchWord
	}
	location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
});
	//이전페이지
	$("#boardPageBtnPre").on('click', function(){
	const queryparamsPage = {
	   page: "${response.pagination.startPage-1}",
	   keyword : searchWord
	}
	location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
});
//다음페이지
	$("#boardPageBtnNext").on('click', function(){
	const queryparamsPage = {
	   page: "${response.pagination.endPage+1}",
	   keyword : searchWord
	}
	location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
});

	//마지막페이지
	$("#boardPageBtnLast").on('click', function(){
	const queryparamsPage = {
	   page: "${response.pagination.totalPageCount}",
	   keyword : searchWord
	}
	location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
});//pageNumBtn클릭
//------------------------------- paging --------------------------------------


</script>

<script src="/js/mypage/myPage.js"></script>
</body>
</html>

