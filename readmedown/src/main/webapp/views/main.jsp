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
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
<script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/marshallku/infinite-scroll/dist/infiniteScroll.min.js"></script>
<link rel="icon" href="/images/logo-pencil.png" />
<link rel="apple-touch-icon" href="/images/logo-pencil.png" />
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/main.css" />
<script src="/js/jquery-3.6.4.min.js"></script>
<title>Read Me▼</title>
<script>
$(document).ready(function() {
	//이미지 masonry로 배열
 	var msnry = new Masonry( '.grid', {
		  itemSelector: '.grid-item',
		  columnWidth: '.grid-sizer',
		  percentPosition: true,
		  gutter : 20,
	});
	
	  msnry.layout();
	  
/*    infiniteScroll({
	    container: ".grid",
	    item: ".grid-item",
	    next: ".next",
 	    prev: ".prev",
	    prevLoader: ".prevLoader", 
 	    pushHistory: true,
	    nextCallback: (newElement) => {
	        msnry.appended(newElement)
	    },
   	    prevCallback: (newElement) => {
	        msnry.prepended(newElement)
	    } ,
 	    onLoadFinish: () => {
	        msnry.layout()
	    }
	});
   	window.addEventListener("load", () => {
	    msnry.layout()
  		}); */
	
/* 	imagesLoaded( '.grid' ).on( 'progress', function() {
	  msnry.layout();
	}); */
	


	//북마크 추가
	$(".main_bookmark_btn").on('click', function(e){
		e.stopPropagation();//클릭 이벤트 버블링 막기
		const boardId = $(this).parents().parents(".grid-item").attr('id');
		const bookmarkCss = $(this).parents().siblings(".bookmarked-plus");
		//alert(boardId);
		if("${user_id}" == "" || "${user_id}" == null){
			//alert("로그인이 필요합니다.");
			openAlertModal("로그인이 필요합니다.");
		}
		else {
	  		$.ajax({
				url : 'addBookmark',
				type : 'post',
				data : {'board_id' : boardId},
				success : function(response){
					if(response != -1) {
						bookmarkCss.show();//북마크추가 css효과
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
	//북마크 해제
	$(".main_bookmarked_btn").on('click', function(e){
		e.stopPropagation();//클릭 이벤트 버블링 막기
		const boardId2 = $(this).parents().parents(".grid-item").attr('id');
		const bookmarkCss2 = $(this).parents(".bookmarked-plus");
		//alert(boardId2);
		if("${user_id}" == "" || "${user_id}" == null){
			//alert("로그인이 필요합니다.");
			openAlertModal("로그인이 필요합니다.");
		}
		else {
	  		$.ajax({
				url : 'deleteBookmark',
				type : 'post',
				data : {'board_id' : boardId2},
				success : function(response){
					if(response != -1) {
						bookmarkCss2.hide();//북마크제거 css효과					
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
	
	//검색 누르면 박스 오픈
	$("#search_word_input").on('click', function(){
		$("#search_below_box").slideToggle(300);
	});
	
	//검색어 x누르면 삭제(아직기능구현X) -> 근데 추천검색어만 둔다면 필요없음.. 일단 냅두기
	$(".remove_keyword").on('click', function(){
		$(this).parents(".one_searchword").css("display", "none");
	});
	
	//사진 누르면 디테일 페이지로 이동
	$(".grid").on('click', ".grid-item" ,function(){
		let bi = $(this).attr("id");
		//alert(bi);
		location.href = "/detail?bi="+bi;
	});
	
	/* -------------------- Modal -------------------- */
	//모달 취소버튼(공통)
	$("body").on('click','.modal_cancelbtn',function(){
		$(this).parents(".modal").css("display","none");
	});

	//모달함수선언
	function openAlertModal(modal_msg){
		$("#alert_modal").css("display","flex");
		$("#alert_modal #modal_alert_text").html(modal_msg);
	}
	
}); //ready
</script>
</head>
<body>
<jsp:include page="header.jsp"/>
	
<div id="main_box">
<div id="main_contents">
	<div id="search_top_box">
		<div id="search_box">
			<div id="search_icon_box"><img id="search_icon_img" src="/images/main/search_icon.svg"></div>
			<div id="search_word_box"><input type="text" id="search_word_input"></div>
		</div>
	</div>
	<div id="search_below_box">
		<div id="search_btns_box">
			<!-- <div id="latest_searchword" style="font-size : 20px">최근 검색 기록<br>
				<div class="search_words_box">
					<div class="one_searchword" id="">
						<div class="search_keyword">심플</div>
						<div class="remove_keyword">X</div>
					</div>
					<div class="one_searchword">
						<div class="search_keyword">화려</div>
						<div class="remove_keyword">X</div>
					</div>
				</div>				
			</div> -->
			<div id="recommend_searchword" style="font-size : 20px">추천 키워드<br>
				<div class="search_words_box">
					<div class="one_searchword">
						<div class="search_keyword">심플</div>
						<!-- <div class="remove_keyword">X</div> -->
					</div>
					<div class="one_searchword">
						<div class="search_keyword">화려</div>
						<!-- <div class="remove_keyword">X</div> -->
					</div>
				</div>				
			</div>
			<!-- <div id="popular_searchword" style="font-size : 20px">인기 검색어<br>
				<div class="search_words_box">
					<div class="one_searchword">
						<div class="search_keyword">심플</div>
						<div class="remove_keyword">X</div>
					</div>
					<div class="one_searchword">
						<div class="search_keyword">화려</div>
						<div class="remove_keyword">X</div>
					</div>
				</div>				
			</div> -->
		</div>
	</div>
	<div id="main_gallery">
		<div class="grid">
		  <div class="grid-sizer"></div>
		  
<%-- 			<c:forEach items="${response.list}" var="dto" varStatus="status">
		           <div class="grid-item" id="${dto.board_id}"> 
		               <img src='${dto.board_img}' onerror="this.src='/images/main/no_img.svg'" alt="template">
		               <div class="darkness"></div>
		               <div class="btn-plus">
			               <div class="main_bookmark_box"><img class="main_bookmark_btn" src='/images/main/bookmark_before.svg'></div>
		               </div>
		               <div class="bookmarked-plus">
			               <div class="main_bookmarked_box"><img class="main_bookmarked_btn" src='/images/main/bookmark_after.svg'></div>
		               </div>
		           </div>	
		       </c:forEach> --%>
			<c:forEach items="${response.list}" var="dto" varStatus="status">
		           <div class="grid-item" id="${dto.board_id}"> 
		               <img src='${dto.board_img}' onerror="this.src='/images/main/no_img.svg'" alt="template">
		               <div class="darkness"></div>
		               <div class="btn-plus">
			               <div class="main_bookmark_box"><img class="main_bookmark_btn" src='/images/main/bookmark_before.svg'></div>
		               </div>
					<c:choose>
						<c:when test="${dto.bookmarked}">
			               <div class="bookmarked-plus" style="display : block;">
				               <div class="main_bookmarked_box"><img class="main_bookmarked_btn" src='/images/main/bookmark_after.svg'></div>
			               </div>
				        </c:when>
						<c:otherwise>
			               <div class="bookmarked-plus">
				               <div class="main_bookmarked_box"><img class="main_bookmarked_btn" src='/images/main/bookmark_after.svg'></div>
			               </div>
				        </c:otherwise>
					</c:choose>
		           </div>
		       </c:forEach>
		       
		</div>
	</div>
	
<!-- pagination -->
<div class="pagenation" style="visibility: hidden;">
	<c:if test="${fn:length(response.list) != 0}">
 	   <%-- <a class="pagefirst"
	      <c:if test="${!response.pagination.existPrevPage}"> 'http://localhost:8070/?page=1'</c:if>>
	   </a> --%>
 	   <a class="prev"
	      <c:if test="${!response.pagination.existPrevPage && searchdto.page > 1}"> href= 'http://localhost:8070/?page=${searchdto.page-1}' </c:if>>
	   </a>
	   <a class="next"
	      <c:if test="${!response.pagination.existNextPage && searchdto.page < response.pagination.totalPageCount}">  href= 'http://localhost:8070/?page=${searchdto.page + 1}' </c:if>>
	   </a>
 	   <%-- <a class="pagelast"
	      <c:if test="${!response.pagination.existNextPage}"> href= 'http://localhost:8070/?page=${response.pagination.totalPageCount}' </c:if>>
	   </a> --%>
	</c:if>
</div>
<!-- pagination -->
	
	
</div>
</div>
<jsp:include page="editor/modal.jsp"/>
</body>
<!-- <script>
var msnry = new Masonry( '.grid', {
	  itemSelector: '.grid-item',
	  columnWidth: '.grid-sizer',
	  percentPosition: true,
	  gutter : 20,
});

infiniteScroll({
  container: ".grid",
  item: ".grid-item",
  next: ".next",
   prev: ".prev",
   autoPrev : true,
   pushHistory: true,
   nextCallback: (newElement) => {
      msnry.appended(newElement)
  },
	/*    prevCallback: (newElement) => {
      msnry.prepended(newElement)
  }, */
   onLoadFinish: () => {
      msnry.layout()
  }
}),

window.addEventListener("load", () => {
  //msnry.layout()
	imagesLoaded( '.grid' ).on( 'progress', function() {
	  msnry.layout();
	});
})
</script> -->
</html>
