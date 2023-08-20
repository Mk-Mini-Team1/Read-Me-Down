$("#hit_icon_title_div").click(function(){
	if($(this).next().css('display')=='none'){
		$(this).parent().css("height","245px");
		$.ajax({
			type: 'post',
			url: '/gethits',
			dataType: 'json',
			data: {
				keyword: $("#hit_icon_keyword").val()
			},
			success: function(data) { // 결과 성공 콜백함수
				let list = data;
				for (let i = 0; i < list.length; i++) {
					$("#hit_resultbox").append(`<img id="${list[i].hits_name}.svg" decoding="async" loading="lazy" width="45" height="45" class="hit_icons" src="https://hits.seeyoufarm.com${list[i].hits_img}">`);
				}
			},
			error: function(request, status, error) { // 결과 에러 콜백함수
				console.log(error)
			}
		});//ajax end
	}else{
		$(this).parent().css("height","auto");
	}
	$(this).next().slideToggle(300);
});


$("#hit_resultbox").on('click','.hit_icons',function(){
	$("#hit_icon_title").val($(this).attr('id'));
	$("#hit_icon_title_div").html($(this).attr('id'));
	$("#hit_icon_keyword").val('');
	$(this).parents('.dropbox_contents').slideToggle(300);
	$(this).parents('.dropboxWrap').css("height","auto");
});

$("#hits_modal #hit_icon_keyword").on("keyup", function() {
	$("#hit_resultbox").html('');
	$.ajax({
		type: 'post',
		url: '/gethits',
		dataType: 'json',
		data: {
			keyword: $("#hit_icon_keyword").val()
		},
		success: function(data) { // 결과 성공 콜백함수
			let list = data;
			for (let i = 0; i < list.length; i++) {
				$("#hit_resultbox").append(`<img id="${list[i].hits_name}.svg" class="hit_icons" decoding="async" loading="lazy" width="45" height="45" src="https://hits.seeyoufarm.com${list[i].hits_img}">`);
			}
		},
		error: function(request, status, error) { // 결과 에러 콜백함수
			console.log(error)
		}
	});//ajax end
})

$("#hit_applybtn").on('click',function(){
	let targetURL = $("#hits_modal #target_url").val();
	let targetTitle = $("#hits_modal #target_title").val();
	let isflat = $("#hits_modal input[name='border_option']:checked").val();
	let titleColor = $("#hits_modal #title_color").val().replace("#","%23");
	let countColor = $("#hits_modal #count_color").val().replace("#","%23");
	let iconName = $("#hits_modal #hit_icon_title").val();
	let iconColor = $("#hits_modal #icon_color").val().replace("#","%23");
	
	if(targetURL == ''){
		$('#hits_modal .modal_box').scrollTop(0);
		$("#hits_modal #target_url_guide").css("color","var(--neon5)");
		$("#hits_modal #target_url_guide").css("animation","vibration 0.1s");
		setTimeout(function() {$("#hits_modal #target_url_guide").css("animation","");}, 200);
	}else{
		let divString = `<div>[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=${targetURL}&title=${targetTitle}&title_bg=${titleColor}&count_bg=${countColor}&icon=${iconName}&icon_color=${iconColor}&edge_flat=${isflat})](https://hits.seeyoufarm.com)</div>`
		$(".ProseMirror").append(divString);
		$(this).parents(".modal").css("display","none");
	}
});

