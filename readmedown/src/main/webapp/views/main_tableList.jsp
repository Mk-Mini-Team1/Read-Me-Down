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
<!-- <script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script> -->
<link rel="icon" href="/images/logo-pencil.png" />
<link rel="apple-touch-icon" href="/images/logo-pencil.png" />
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/main_tableList.css" />
<script src="/js/jquery-3.6.4.min.js"></script>
<title>Read Me▼</title>
<script>
$(document).ready(function() {
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

	//북마크 추가
	$(".main_bookmark_btn").on('click', function(e){
		e.stopPropagation();//클릭 이벤트 버블링 막기
		const boardId = $(this).parents().parents(".one_board").attr('id');
		const bookmarkCss = $(this).parents().siblings(".bookmarked-plus");
		//alert(boardId);
 		if("${user_id}" == "" || "${user_id}" == null){
			openConfirmModal("로그인 회원 전용 기능입니다.<br>로그인 하시겠습니까?");
			$("#confirm_modal #confirm_modal_ok_btn").on('click', function() {
			   $(this).parents(".modal").css("display", "none");
			   $("#signIn_modal").show();
			});
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
		const boardId2 = $(this).parents().parents(".one_board").attr('id');
		const bookmarkCss2 = $(this).parents(".bookmarked-plus");
		//alert(boardId2);
 		if("${user_id}" == "" || "${user_id}" == null){
			openConfirmModal("로그인 회원 전용 기능입니다.<br>로그인 하시겠습니까?");
			$("#confirm_modal #confirm_modal_ok_btn").on('click', function() {
			   $(this).parents(".modal").css("display", "none");
			   $("#signIn_modal").show();
			});
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
	
	//추천검색어 누르면 검색
 	$(".search_keyword").on('click', function(){
		let keyword = $(this).text();
		//alert(keyword);
		location.href="http://localhost:8070/boardlist?keyword="+keyword;
	});
	
	//사진 누르면 디테일 페이지로 이동
  	$(".one_board").on('click',function(){
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
	
	//Confirm모달함수선언
	function openConfirmModal(modal_msg) {
	   $("#confirm_modal").css("display", "flex");
	   $("#confirm_modal #modal_alert_text").html(modal_msg);
	   $("#confirm_modal").css("top", $(window).scrollTop() + "px");
	   $('#confirm_modal').on('scroll touchmove mousewheel', function(event) {
	      event.preventDefault();
	      event.stopPropagation();
	      return false;
	   });
	}
	
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
	            location.reload();
	         } else {
	            $(".errorMessage").text(response.errorMessage);
	         }
	      }
	   });
	});
	
	//검색 ---------------------------------------
 	$("#search_word_input").on("keyup",function(key){
        if(key.keyCode==13) {
			let searchWord = $("#search_word_input").val();
		
			if(searchWord.trim() !== "") {
	            location.href="http://localhost:8070/boardlist?keyword="+searchWord;
			}
			else {
	            location.href="http://localhost:8070/boardlist";
				alert("검색어가 없습니다.");
			}
        }
	});
	
	
}); //ready
</script>
</head>
<body>
<jsp:include page="header.jsp"/>
	
<div id="main_box">
<div id="main_contents">
<div id="main_wrapper">
<div id="top_box">
 	<div id="search_top_box">
 		<div id="search_box">
			<div id="search_icon_box"><img id="search_icon_img" src="/images/main/search_icon.svg"></div>
			<div id="search_word_box"><input type="text" id="search_word_input" name="searchWord" value="${param.keyword }" autocomplete="off"></div>
		</div>
	</div>
 	<div id="search_below_box">
 		<div id="search_btns_box">
 			<div id="recommend_searchword" style="font-size : 20px">추천 키워드<br>
				<div class="search_words_box">
					<div class="one_searchword">
						<div class="search_keyword">심플</div>
					</div>
					<div class="one_searchword">
						<div class="search_keyword">라이트모드</div>
					</div>
					<div class="one_searchword">
						<div class="search_keyword">다크모드</div>
					</div>
				</div>				
			</div>
		</div> 
	</div>
</div>
<div id="main_gallery">
	<div id="board_list_box">
		<c:forEach items="${response.list}" var="dto" varStatus="vs">
			<div class="one_board" id="${dto.board_id}">
				<img src='${dto.board_img}' alt="template">
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
<jsp:include page="editor/modal.jsp"/>
<jsp:include page="confirm_modal.jsp"/>
</body>
</html>
