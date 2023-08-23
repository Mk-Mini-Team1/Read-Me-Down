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
<script>
$(document).ready(function() {
//------------------------------- paging --------------------------------------
//페이지 버튼 눌렀을때 해당페이지 보여주기
	$(".pageNumBtn").on('click', function(){
	const queryparamsPage = {
	   page: $(this).val()
	   }
	location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
});//pageNumBtn클릭

//첫페이지
	$("#boardPageBtnFirst").on('click', function(){
	const queryparamsPage = {
	   page: 1
	}
	location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
});
	//이전페이지
	$("#boardPageBtnPre").on('click', function(){
	const queryparamsPage = {
	   page: "${response.pagination.startPage-1}"
	 
	}
	location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
});
//다음페이지
	$("#boardPageBtnNext").on('click', function(){
	const queryparamsPage = {
	   page: "${response.pagination.endPage+1}"
	   
	}
	location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
});

	//마지막페이지
	$("#boardPageBtnLast").on('click', function(){
	const queryparamsPage = {
	   page: "${response.pagination.totalPageCount}"
	 
	}
	location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
});//pageNumBtn클릭
});
//------------------------------- paging --------------------------------------
</script>
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
						<a href="/bookmarks?searchType1=${user_id}" class="category-link" id="bookmarksLink"
							style="border-bottom: 7px solid var(--neon3);"> <img
							src="/images/mypage/bookmarks.svg">북마크
						</a>
					</div>
					<div class="category">
						<a href="/following?searchType1=${user_id}" class="category-link"
							id="followingLink"> <img src="/images/mypage/following.svg">팔로잉
						</a>
					</div>
				</div>
				<div class="infoWrap" id="infoWrap">
					<div class="mypage_list" id="mypage_list">
						<div class="mypage" id="mypage">
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
//북마크 해제
$(".main_bookmarked_btn").on('click', function(e){
	e.stopPropagation();//클릭 이벤트 버블링 막기
	const gridItem = $(this).parents().parents(".grid-item");
	const boardId2 = $(this).parents().parents(".grid-item").attr('id');
	const bookmarkCss2 = $(this).parents(".bookmarked-plus");	
	
  		$.ajax({
			url : 'deleteBookmark',
			type : 'post',
			data : {'board_id' : boardId2},
			success : function(response){
				if(response != -1) {
					bookmarkCss2.hide();//북마크제거 css효과		
					gridItem.remove();
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

