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
<link rel="stylesheet" href="/css/userMain.css" />
<script src="/js/jquery-3.6.4.min.js"></script>
<title>Read Me▼</title>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div id="main_box">
		<div id="main_contents">
			<div class="container">
				<div class="userInfo" id="userInfo">
					<div class="profile-image" style="background-image: url('${otherInfo.profile_image eq null?'/images/default_profile.svg':otherInfo.profile_image}');"></div>
					<div class="user" id="user">
						<div class="nick-name">${otherInfo.name}</div>
						<c:if test="${otherInfo.git_id != ''}">
							<div class="git-name"><a href="https://github.com/${otherInfo.git_id}"><img src="/images/mypage/git.svg"><span>${otherInfo.git_id}</span></a></div>
						</c:if>
						<div class="follow-num">팔로워 ${followerCnt}명</div>
					</div>
					<c:if test="${otherInfo.user_id != user_id}">
						<div class="follow_button" id="follow_button">
							<c:choose>
								<c:when test="${isfollowing ne null && isfollowing}">
									<button id="followingbtn"><img src="/images/mypage/check.svg">팔로잉</button>
								</c:when>
								<c:otherwise>
									<button id="followbtn">팔로우</button>
								</c:otherwise>
							</c:choose>
						</div>
					</c:if>
				</div>
				<div class="categoryWrap">
					<div class="category">
						<p><img src="/images/mypage/my_template.svg">작성 템플릿</p>
					</div>
				</div>
				<div class="listWrap" id="listWrap">
					<div id="templateWrap">
						<c:if test="${fn:length(response.list)==0}">
							<div class="no_list">작성한 템플릿이 없습니다.</div>
						</c:if>
						<c:forEach items="${response.list}" var="dto" varStatus="status">
							<div class="templates" id="${dto.board_id}">
								<img src='${dto.board_img}' onerror="this.src='/images/main/no_img.svg'" alt="template">
								<div class="darkness"></div>
								<div class="btn-plus" id="${dto.bookmarked}">
					               <div class="main_bookmark_box"><img class="main_bookmark_btn" src='/images/main/bookmark_before.svg'></div>
				               </div>
								<c:choose>
									<c:when test="${dto.bookmarked}">
										<div class="bookmarked-plus" style="display: block;">
											<div class="main_bookmarked_box">
												<img class="main_bookmarked_btn" src='/images/main/bookmark_after.svg'>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="bookmarked-plus">
											<div class="main_bookmarked_box">
												<img class="main_bookmarked_btn" src='/images/main/bookmark_after.svg'>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</c:forEach>
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
						      <c:if test="${vs.index == (param.page eq null?1:param.page)}">
						       <input type="button" class="pageNumBtn" value="${vs.index}" style="font-weight: 900; color:var(--point);">
						      </c:if>
						      <c:if test="${vs.index != (param.page eq null?1:param.page)}">
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
	<input type="hidden" id="user_id" value="${user_id}">
	<input type="hidden" id="other_id" value="${otherInfo.user_id}">
	
	<jsp:include page="editor/modal.jsp"/>
	<jsp:include page="confirm_modal.jsp"/>
	
	<script src="/js/userMain.js"></script>
	<script>
		//페이지 버튼 눌렀을때 해당페이지 보여주기
	 	$(".pageNumBtn").on('click', function(){
			const queryparamsPage = {
				ui: "${otherInfo.user_id}",
				page: $(this).val()
			}
			location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
		});//pageNumBtn클릭
		
		//첫페이지
	 	$("#boardPageBtnFirst").on('click', function(){
			const queryparamsPage = {
				ui: "${otherInfo.user_id}",
				page: 1
			}
			location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
		});
	 	//이전페이지
	 	$("#boardPageBtnPre").on('click', function(){
			const queryparamsPage = {
				ui: "${otherInfo.user_id}",
				page: "${response.pagination.startPage-1}"
			}
			location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
		});
		//다음페이지
	 	$("#boardPageBtnNext").on('click', function(){
			const queryparamsPage = {
				ui: "${otherInfo.user_id}",
				page: "${response.pagination.endPage+1}"
			}
			location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
		});
		
	 	//마지막페이지
	 	$("#boardPageBtnLast").on('click', function(){
			const queryparamsPage = {
				ui: "${otherInfo.user_id}",
				page: "${response.pagination.totalPageCount}"
			}
			location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
		});//pageNumBtn클릭
	</script>
</body>
</html>

