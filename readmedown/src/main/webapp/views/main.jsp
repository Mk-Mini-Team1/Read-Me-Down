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
<link rel="stylesheet" href="/css/main.css" />
<script src="/js/jquery-3.6.4.min.js"></script>
<!-- <script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script> -->
<script src="https://unpkg.com/imagesloaded@5/imagesloaded.pkgd.min.js"></script>
<title>Read Me▼</title>
<script>
$(document).ready(function() {
	function resizeGridItems(){
	    const items = document.querySelectorAll('.grid-item')
	    items.forEach(item=>{
	        imagesLoaded(item,(instance)=>{
	            const item = instance.elements[0];
	            const grid = document.querySelector('.grid-container')
	            const rowHeight = parseInt(window.getComputedStyle(grid).getPropertyValue('grid-auto-rows'))
	            const rowGap = parseInt(window.getComputedStyle(grid).getPropertyValue('grid-row-gap'))
	            const rowSpan =  Math.floor((item.querySelector('.content').offsetHeight+rowGap)/(rowHeight+rowGap))
	            item.style.gridRowEnd = "span "+ rowSpan;
	        })
	    })
	    const gallery = document.querySelector('.grid-container')
	    imagesLoaded(gallery,()=>{
	        document.querySelectorAll('.grid-item').forEach(item=> item.style.visibility = 'visible')
	    })
	}

	window.addEventListener('load',resizeGridItems)
	window.addEventListener('resize',resizeGridItems)
	
}); //ready
</script>
</head>
<body>
<jsp:include page="header.jsp"/>
	
<div id="main_box">
<div id="main_contents">
	<div id="gallery">
		<div class="grid-container">
			<c:forEach begin="1" end="12" varStatus="vs">
	            <div class="grid-item"> 
	                <img class="content" src='/images/main/img_ex${vs.count}.jpg' alt="template">
	            </div>			
			</c:forEach>
	    </div>
	</div>
</div>
</div>

</body>
</html>
