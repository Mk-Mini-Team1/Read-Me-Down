//프로필수정 이동
function redirectToEditProfile() {
	window.location.href = "/mypage/edit"; // 지정된 페이지로 이동
}

// 팔로우 버튼에 마우스를 가져다 대면 언팔로우로 변경
$("#following_list").on("mouseover","button",function() {
   $(this).text("언팔로우");
});

$("#following_list").on("mouseleave","button",function() {
   $(this).text("팔로잉");
});

// 언팔로우 클릭
$("#following_list").on("click","button",function() {
	let followID = $(this).next().val();
	
   $.ajax({
		type: 'post',
		url: '/deletefollow',
		dataType: 'json',
		data: {
			follow_id: followID
		},
		success: function(response) { // 결과 성공 콜백함수
			$("#following_list").load(window.location.href + " #following_list");
		},
		error: function(request, status, error) { // 결과 에러 콜백함수
			console.log(error)
		}
	});//ajax end
});