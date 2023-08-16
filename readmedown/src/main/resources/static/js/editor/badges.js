$("#badge_modal #modal_result").on('click', 'button', function() {
	$("#choosed_badges").append('<button class="choosed_badge" id="'+$(this).attr('id')+'">' + $(this).text() + '</button>');
});

$("#badge_modal #choosed_badges").on('dblclick', '.choosed_badge', function() {
	$(this).remove();
});

$("#badge_modal #badge_keyword").on("keyup",function(){
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

$("#badge_modal").on("click",'#applybtn',function(){
	let badgelist = $(".choosed_badge");
	let divString = "<div>";
	for(let i=0; i<badgelist.length; i++){
		divString += $(badgelist[i]).attr('id')+" ";
	}
	divString += "</div>";
	$(".ProseMirror").append(divString);
	$(this).parents(".modal").css("display","none");
	$("#modal_result").html('');
})