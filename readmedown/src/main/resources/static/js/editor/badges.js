$("#modal_result").on('click', 'button', function() {
	$("#choosed_badges").append('<button class="choosed_badge" id="'+$(this).attr('id')+'">' + $(this).text() + '</button>');
});

$("#choosed_badges").on('dblclick', '.choosed_badge', function() {
	$(this).remove();
});

$("#badge_keyword").on("keyup",function(){
	$("#modal_result").css('height','155px');
	$("#modal_result").html('');
	$.ajax({
		type: 'post',
		url: '/getbadges',
		dataType: 'json',
		data: {
			keyword: $("#badge_keyword").val()
		},
		success: function(data) { // 결과 성공 콜백함수
			let badgelist = data;
			for (let i = 0; i < badgelist.length; i++) {
				$("#modal_result").append("<button id='"+badgelist[i].badge_link+"'>" + badgelist[i].badge_name + '</button>');
			}
		},
		error: function(request, status, error) { // 결과 에러 콜백함수
			console.log(error)
		}
	});//ajax end
})

$("#searchbtn").on("click",function(){
	$("#modal_result").html('');
	$.ajax({
		type: 'post',
		url: '/getbadges',
		dataType: 'json',
		data: {
			keyword: $("#badge_keyword").val()
		},
		success: function(data) { // 결과 성공 콜백함수
			let badgelist = data;
			for (let i = 0; i < badgelist.length; i++) {
				$("#modal_result").append("<button id='"+badgelist[i].badge_link+"'>" + badgelist[i].badge_name + '</button>');
			}
		},
		error: function(request, status, error) { // 결과 에러 콜백함수
			console.log(error)
		}
	});//ajax end
})

$("#applybtn").on("click",function(){
	let badgelist = $(".choosed_badge");
	/*let badgelist = $($(".choosed_badge")[0]).attr('id');*/
	$(".ProseMirror").append("<div>");
	for(let i=0; i<badgelist.length; i++){
		$(".ProseMirror").append($(badgelist[i]).attr('id'));
	}
	$(".ProseMirror").append("</div>");
	$(this).parents(".modal").css("display","none");
})