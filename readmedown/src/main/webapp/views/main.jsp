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
<link rel="icon" href="/images/logo-pencil.png" />
<link rel="apple-touch-icon" href="/images/logo-pencil.png" />
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/main.css" />
<script src="/js/jquery-3.6.4.min.js"></script>
<title>Read Me▼</title>
<script>
$(document).ready(function() {
	var msnry = new Masonry( '.grid', {
		  itemSelector: '.grid-item',
		  // columnWidth: 200
		  columnWidth: '.grid-sizer',
		  percentPosition: true,
		  gutter : 20,
		});
	imagesLoaded( '.grid' ).on( 'progress', function() {
	  msnry.layout();
	});
	
}); //ready
</script>
</head>
<body>
<jsp:include page="header.jsp"/>
	
<div id="main_box">
<div id="main_contents">
	<div id="main_top">
		<div id="search_box">
			<div id="search_icon_box"><img id="search_icon_img" src="/images/main/search_icon.svg"></div>
			<div id="search_word_box"><input type="text" id="search_word_input"></div>
		</div>
	</div>
	<div id="main_gallery">
		<div class="grid">
		  <div class="grid-sizer"></div>
			<c:forEach begin="1" end="12" varStatus="vs">
		           <div class="grid-item"> 
		               <img src='/images/main/img_ex${vs.count}.jpg' alt="template">
		               <div class="darkness"></div>
		               <div class="btn-plus">
		               		<input type=button class="main_bookmark_btn" value="북마크">
		               </div>
		           </div>	
		       </c:forEach>
			<c:forEach begin="1" end="12" varStatus="vs">
		           <div class="grid-item"> 
		               <img src='/images/main/img_ex${vs.count}.jpg' alt="template">
		               <div class="darkness"></div>
		               <div class="btn-plus">
		               		<input type=button class="main_bookmark_btn" value="북마크">
		               </div>
		           </div>	
		       </c:forEach>

		</div>
	</div>
</div>
</div>

</body>
</html>
