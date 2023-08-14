<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
<script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
<style>
.grid { width:80% }
.grid-sizer, .grid-item { width: 23%; }
/* .grid-sizer, .grid-item { width: 200px; } */
.grid-item {border:1px solid #8f99f3; margin-bottom:15px; border-radius: 20px; overflow:hidden;}
.grid-item img {display: block; min-width:100%; max-width: 100%; }
</style>
</head>
<body>
<div class="grid">
  <div class="grid-sizer"></div>
  <div class="grid-item"><img src="https://i.postimg.cc/gkQkrcf3/4.png" /></div>
  <div class="grid-item"><img src="https://i.postimg.cc/zvyyDzqP/5.png" /></div>
  <div class="grid-item"><img src="https://i.postimg.cc/BZz3Jy9S/custom1.png" /></div>
  <div class="grid-item"><img src="https://i.postimg.cc/XYTgXByp/calendar1.png" /></div>
  <div class="grid-item"><img src="https://i.postimg.cc/T1jKdLr8/design2.png" /></div>
  <div class="grid-item"><img src="https://i.postimg.cc/Hs2pxzXv/button1.png" /></div>
  <div class="grid-item"><img src="https://i.postimg.cc/xTwC6ChB/part2.png" /></div>
  <div class="grid-item"><img src="https://i.postimg.cc/9Qc7S16s/canvas1.png" /></div>
  <div class="grid-item"><img src="https://i.postimg.cc/ncT3N5BM/extapp1.png" /></div>
  <div class="grid-item"><img src="https://i.postimg.cc/D0XZbr4D/scrolllock1.jpg" /></div>
  <div class="grid-item"><img src="https://i.postimg.cc/NFdy16gk/smsbackup3.jpg" /></div>
  <div class="grid-item"><img src="https://i.postimg.cc/vHc0VhBL/cisco3.jpg" /></div>
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