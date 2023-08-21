$("#icon_title_div").click(function(){
	if($(this).next().css('display')=='none'){
		$(this).parent().css("height","250px");
	}else{
		$(this).parent().css("height","auto");
	}
	$(this).next().slideToggle(300);
});