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
<!-- <script src="https://cdn.jsdelivr.net/gh/marshallku/infinite-scroll/dist/infiniteScroll.min.js"></script> -->
<link rel="icon" href="/images/logo-pencil.png" />
<link rel="apple-touch-icon" href="/images/logo-pencil.png" />
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/main_masonry.css" />
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

	//msnry.layout()

	infiniteScroll({
		container: ".grid",
		item: ".grid-item",
		next: ".next",
		prev: ".prev",
		autoPrev : false,
		prevButton: ".prevBtn",
		prevLoader: ".prevLoader", 
		nextLoader: ".nextLoader", 
		pushHistory: true,
		nextCallback: (newElement) => {
		    msnry.appended(newElement)
		},
			prevCallback: (newElement) => {
		    msnry.prepended(newElement)
		},
		onLoadFinish: () => {
		  msnry.layout();
		}
	}),
	imagesLoaded( '.grid' ).on( 'done', function() {
		  msnry.layout();
	});
	
	//북마크 추가
	$(".main_bookmark_btn").on('click', function(e){
		e.stopPropagation();//클릭 이벤트 버블링 막기
		const boardId = $(this).parents().parents(".grid-item").attr('id');
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
		const boardId2 = $(this).parents().parents(".grid-item").attr('id');
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
		location.href="/?keyword="+keyword;
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

	//이전페이지로 이동 버튼관련
  	let curruntPageNum = "${searchdto.page}";
	//alert(curruntPageNum);
 	if(curruntPageNum >1){
		$("#prevBtn_div").show();
	}
	else{
		$("#prevBtn_div").hide();
	}

	//검색 ---------------------------------------
	$("#search_word_input").on("keyup",function(key){
        if(key.keyCode==13) {
			let searchWord = $("#search_word_input").val();
		
			if(searchWord.trim() !== "") {
	            location.href="/?keyword="+searchWord;
			}
			else {
	            location.href="/";
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
<div id="top_fixed_box">
	<div id="search_area">
		<div id="search_top_box">
			<div id="search_box">
				<div id="search_icon_box"><img id="search_icon_img" src="/images/main/search_icon.svg"></div>
				<div id="search_word_box"><input type="text" id="search_word_input" name="searchWord" value="${searchdto.keyword }" autocomplete="off"></div>
			</div>
		</div>
		<div id="search_below_box">
			<div id="search_btns_box">
				<div id="recommend_searchword" style="font-size : 20px">추천 키워드<br>
					<div class="search_words_box">
						<div class="one_searchword">
							<div class="search_keyword">심플</div>
							<!-- <div class="remove_keyword">X</div> -->
						</div>
						<div class="one_searchword">
							<div class="search_keyword">라이트모드</div>
							<!-- <div class="remove_keyword">X</div> -->
						</div>
						<div class="one_searchword">
							<div class="search_keyword">다크모드</div>
							<!-- <div class="remove_keyword">X</div> -->
						</div>
					</div>				
				</div>
			</div>
		</div>
	</div>
</div>
	<div id="prevBtn_div" style="display:none;">
		<div id="prev_box" class="prevBtn">
			<img id="prev_img" src="/images/prev_icon.png">
			<input type="button" id="prev_btn" value="이전 페이지 로드하기">
		</div>
	</div>
	<div id="main_gallery">
		<div class="grid">
		<div class="prevLoader"></div>
		<div class="nextLoader"></div>
		  <div class="grid-sizer"></div>
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
 	   <a class="pagefirst"
	      <c:if test="${!response.pagination.existPrevPage}"> '/?page=1&keyword=${param.keyword}'</c:if>>
	   </a>   
 	   <a class="prev"
	      <c:if test="${searchdto.page > 1}"> href= '/?page=${searchdto.page-1}&keyword=${param.keyword}' </c:if>>
	   </a>
	   <a class="next"
	      <c:if test="${!response.pagination.existNextPage && searchdto.page < response.pagination.totalPageCount}">  href= '/?page=${searchdto.page + 1}&keyword=${param.keyword}' </c:if>>
	   </a>
	   
 	   <a class="pagelast"
	      <c:if test="${!response.pagination.existNextPage}"> href= '/?page=${response.pagination.totalPageCount}&keyword=${param.keyword}' </c:if>>
	   </a>
	</c:if>
</div>
<!-- pagination -->
	
</div>
</div>
<jsp:include page="editor/modal.jsp"/>
<jsp:include page="confirm_modal.jsp"/>
</body>
<script>
function infiniteScroll({container: e, next: t, prev: r, item: n, nextButton: l, prevButton: o, nextLoader: s, prevLoader: c, pushHistory: i, 
	detectLoad: a, onLoadFinish: u, nextCallback: d, prevCallback: f, autoPrev: y}) {
    const h = window.innerHeight // h = 윈도우 창 크기
      , p = document.querySelector(e) // p = container(.grid) 셀렉터
      , S = document.querySelector(t) // S= 다음 페이지 정보
      , v = document.querySelector(r) // v = 이전페이지 정보
      , m = {
        next: s && document.querySelector(s), //m.next = nextLoder 셀렉터
        prev: c && document.querySelector(c) //m.prev = prevLoder셀렉터
    }
      , q = [] // ??
      , L = "reveal"; //class이름에 추가할 단어
    let g = !1 //!1은 존재하지않는다는 뜻
      , w = !1
      , A = window.scrollY || window.pageYOffset //스크롤 높이
      , E = !1,
      pageNum = 1;
      
    function x() {
    	console.log("x() 시작");
    
        S.classList.add("done"),//.next에 done 클래스 추가하기
        S.removeAttribute("href"),
        s && (m.next.style.display = "none"),
        l && (l.style.display = "none") //다음페이지 버튼 쓴다면 그거 안보이게
    }
    function b() {
    	console.log("b() 시작");
    
        v.classList.add("done"),//.prev에 done클래스 추가하기
        v.removeAttribute("href"),
        c && (m.prev.style.display = "none"),
        o && (o.style.display = "none")
    }
    
    //다음페이지 불러오는 함수
    function k() {
    	console.log("k() 시작");
    	
		const totalPage = "${response.pagination.totalPageCount}";
		const thisPage = "${searchdto.page}";
		if(thisPage == totalPage){
	        	return;
		}
      
        const e = document.querySelector(t); //다음페이지 a태그
    	
        if (null === e || !0 === g || e.classList.contains("done"))//다음페이지 없으면 그만하도록?
            return;
        let r = 0
          , o = 0;
        const c = e.href; //다음페이지 링크
        g = !0,
        s && m.next.classList.add(L), //nextLoader클래스에 "reveal"이란 클래스 추가
        l && (l.style.display = "none"),
        fetch(c).then(e=>{
            const t = e.status;
            if (200 === t)
                return e.text();
            404 === t && x()
        }
        ).then(f=>{
            const y = (new DOMParser).parseFromString(f, "text/html")
              , h = y.querySelectorAll(n);
            null === y.querySelector(t) || "" === y.querySelector(t).getAttribute("href") ? x() : e.href = y.querySelector(t).href,
            h.forEach(e=>{
                a && e.querySelectorAll("img").forEach(e=>{
                    r++,
                    e.addEventListener("load", ()=>{
                        r === ++o && (i  && history.pushState(null, null, c), //주소 안바뀌게하려고 지움
                        s && m.next.classList.remove(L),
                        l && !S.classList.contains("done") && (l.style.display = ""),
                        g = !1,
                        u && u())
                    }
                    )
                }
                ),
                p.append(e),
                d && d(e)
            }
            ),
            a || (g = !1,
            s && m.next.classList.remove(L),
            l && (l.style.display = ""))
        }
        ).catch(e=>{
            console.log(e)
        }
        )
    }
 
 	// 이전페이지 불러오는 함수 F()
    function F() {
    	console.log("F() 시작");
    	
        const e = document.querySelector(r); //.prev 셀렉터
        if (null === e || !0 === w || e.classList.contains("done"))
            return;
        let t = !1
          , l = 0
          , s = 0;
         const i = e.href
          , d = ()=>{
            l === s && (c && m.prev.classList.remove(L),
            w = !1,
            o && !v.classList.contains("done") && (o.style.display = ""),
            history.pushState(null, null, i),//이전페이지 로드할때도 url바뀌도록 추가함
            u && u())
        }
        ;
        w = !0,
        c && m.prev.classList.add(L),
        o && (o.style.display = "none"),
        fetch(i).then(e=>{
            const r = e.status;
            return 200 === r ? e.text() : 404 === r && (t = !0,
            b(),
            !1)
        }
        ).then(o=>{
            const i = (new DOMParser).parseFromString(o, "text/html")
              , u = i.querySelectorAll(n);
            const uArray = Array.from(u); // NodeList를 배열로 변환
            
            y && !t && (t = null === i.querySelector(r) || "" === i.querySelector(r).getAttribute("href")),
            null === i.querySelector(r) || "" === i.querySelector(r).getAttribute("href") ? b() : e.href = i.querySelector(r).href,
            y ? (t ? b() : e.href = i.querySelector(r).href,
            i.querySelectorAll(n).reverse().forEach(e=>{
                q.push(e)	   
            }
            ),
            t ? q.forEach(e=>{
                a && e.querySelectorAll("img").forEach(e=>{
                    l++,
                    e.addEventListener("load", ()=>{
                        s++,
                        d()
                    }
                    )
                }
                ),
                p.prepend(e),
                f && f(e)
            }
            ) : (w = !1,


            F())) : (uArray.reverse().forEach(e=>{
                a && e.querySelectorAll("img").forEach(e=>{
                    l++,
                    e.addEventListener("load", ()=>{
                        s++,
                        d()
                    }
                    )
                }
                ),
                p.prepend(e),
                f && f(e)
            }
            ),
            a || (w = !1,
            c && m.prev.classList.remove(L)))
            
     		let searchdtoPage = "${searchdto.page}";
            let prevHref= $(".prev").attr('href');
            console.log("searchdtoPage = " + searchdtoPage);
            console.log("prevHref = " + prevHref);
             
            if(searchdtoPage > 1){
            	if(prevHref == "" || prevHref == null) {
    	        	$(".prev").remove();  
    	        	$("#prevBtn_div").hide();
            	}
            };
        }
        ).catch(e=>{
            console.log(e)
        }
        )
      
    }
 	
 	//container 높이 파악하고 조건 따지는 함수 -> 이전페이지 다음페이지 불러오기위해서인듯?
     function O() {
    	console.log("O() 시작");
    	const totalPageCount ="${response.pagination.totalPageCount}";

/*         const e = p.offsetTop;

        !l && null !== S && "" !== S.getAttribute("href") && !g && A >= e + p.scrollHeight - h - 800 && k(),
        !o && null !== v && "" !== v.getAttribute("href") && !w && A <= e + 800 && F()   */  
        
        //뒤로가기로 돌아왔을때 마지막페이지면 다음페이지 로드 막기
/*          window.onpageshow = function(event) {
            if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
				const totalPage = "${response.pagination.totalPageCount}";
				const thisPage = "${searchdto.page}";
				if(thisPage == totalPage){
					$(".next").remove();
				}
            }
        }; */
        		
     	// container의 상단 위치
        const containerTop = p.offsetTop;
		
     	if(p.scrollHeight > 700){//조회된 글 수가 적을땐 실행안되도록     		
	        // 다음 페이지를 불러올 조건 확인
	        if (!l && null !== S && "" !== S.getAttribute("href") && !g && A >= containerTop + p.scrollHeight - h - 500) {
	            k(); // 다음 페이지 불러오는 함수 호출
	        }
	        // 이전 페이지를 불러올 조건 확인
	        if (!o && null !== v && "" !== v.getAttribute("href") && !w && A <= containerTop + 500) {
	            F(); // 이전 페이지 불러오는 함수 호출
	        }
     	}
    
    }

    !function() {
        if (!e || !t || !n)
            throw "Initial Elements are Missing!";
        l && (l = document.querySelector(l)),
        o && (o = document.querySelector(o)),
        null === S ? x() : "" === S.getAttribute("href") && x(),
        null === v ? b() : "" === v.getAttribute("href") && b(),
        void 0 === a && (a = !0)
    }(),
    !o && y && F(),
    O(),
    window.addEventListener("scroll", ()=>{
        E || (E = !0,
        window.requestAnimationFrame(()=>{
            A = window.scrollY || window.pageYOffset,
            O(),
            E = !1
        }
        ))
    }
    , {
        passive: !0
    }),
    l && l.addEventListener("click", ()=>{
        k()
    }
    ),
    o && o.addEventListener("click", ()=>{
        F()
    }
    )
}//end infiniteScroll;

</script>
<script>
/* //이미지 masonry로 배열
var msnry = new Masonry( '.grid', {
	itemSelector: '.grid-item',
	columnWidth: '.grid-sizer',
	percentPosition: true,
	gutter : 20,
});

//msnry.layout()

infiniteScroll({
	container: ".grid",
	item: ".grid-item",
	next: ".next",
	prev: ".prev",
	autoPrev : false,
	prevButton: ".prevBtn",
	prevLoader: ".prevLoader", 
	nextLoader: ".nextLoader", 
	pushHistory: true,
	nextCallback: (newElement) => {
	    msnry.appended(newElement)
	},
		prevCallback: (newElement) => {
	    msnry.prepended(newElement)
	},
	onLoadFinish: () => {
	    msnry.layout()
	}
}); */

</script>
</html>
