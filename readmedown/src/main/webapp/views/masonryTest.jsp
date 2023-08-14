<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
<script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
<style>
.grid { width:98% }
/* .grid-sizer, .grid-item { width: 23%; } */
.grid-sizer, .grid-item { width: 230px; }
.grid-item {border:1px solid #8f99f3; margin-bottom:15px; border-radius: 20px; overflow:hidden;}
.grid-item img {display: block; min-width:100%; max-width: 100%; }
</style>
</head>
<body>
<div class="grid">
  <div class="grid-sizer"></div>
	<c:forEach begin="1" end="12" varStatus="vs">
           <div class="grid-item"> 
               <img class="content" src='/images/main/img_ex${vs.count}.jpg' alt="template">
           </div>	
       </c:forEach>
	<c:forEach begin="1" end="12" varStatus="vs">
           <div class="grid-item"> 
               <img class="content" src='/images/main/img_ex${vs.count}.jpg' alt="template">
           </div>	
       </c:forEach>
</div>
<script>
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
</script>
</body>
</html>