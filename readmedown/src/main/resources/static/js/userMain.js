// 팔로잉 버튼에 마우스를 가져다 대면 언팔로우로 변경
$("#userInfo").on("mouseover","#followingbtn",function() {
   $(this).text("언팔로우");
});
$("#userInfo").on("mouseleave","#followingbtn",function() {
   $(this).html("<img src='/images/mypage/check.svg'>팔로잉");
});
// 팔로우 버튼에 마우스를 가져다 대면 언팔로우로 변경
$("#userInfo").on("mouseover","#followbtn",function() {
   $(this).text("팔로잉하기");
});
$("#userInfo").on("mouseleave","#followbtn",function() {
   $(this).text("팔로우");
});

// 팔로우 클릭
$("#userInfo").on("click","#followbtn",function() {
   $.ajax({
		type: 'post',
		url: '/insertfollowdto',
		dataType: 'json',
		data: {
			my_id : $("#user_id").val(),
			your_id : $("#other_id").val()
		},
		success: function(response) { // 결과 성공 콜백함수
			$("#user").load(window.location.href + " #user");
		},
		error: function(request, status, error) { // 결과 에러 콜백함수
			console.log(error)
		}
	});//ajax end
});

// 언팔로우 클릭
$("#userInfo").on("click","#followingbtn",function() {
   $.ajax({
		type: 'post',
		url: '/deletefollowdto',
		dataType: 'json',
		data: {
			my_id : $("#user_id").val(),
			your_id : $("#other_id").val()
		},
		success: function(response) { // 결과 성공 콜백함수
			$("#user").load(window.location.href + " #user");
		},
		error: function(request, status, error) { // 결과 에러 콜백함수
			console.log(error)
		}
	});//ajax end
});

let user_id=

//북마크 추가
$(".main_bookmark_btn").on('click', function(e) {
	e.stopPropagation();//클릭 이벤트 버블링 막기
	const boardId = $(this).parents().parents(".templates").attr('id');
	const bookmarkCss = $(this).parents().siblings(".bookmarked-plus");
	//alert(boardId);
	if ($("#user_id").val() == "" || $("#user_id").val() == null) {
		//alert("로그인이 필요합니다.");
		openAlertModal("로그인이 필요합니다.");
	}
	else {
		$.ajax({
			url: 'addBookmark',
			type: 'post',
			data: { 'board_id': boardId },
			success: function(response) {
				if (response != -1) {
					bookmarkCss.show();//북마크추가 css효과
				}
				else {
					//alert("문제가 발생했습니다.");
					openAlertModal("문제가 발생했습니다.");
				}
			},
			error: function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});//ajax
	}
});
//북마크 해제
$(".main_bookmarked_btn").on('click', function(e) {
	e.stopPropagation();//클릭 이벤트 버블링 막기
	const boardId2 = $(this).parents().parents(".templates").attr('id');
	const bookmarkCss2 = $(this).parents(".bookmarked-plus");
	//alert(boardId2);
	if ($("#user_id").val() == "" || $("#user_id").val() == null) {
		//alert("로그인이 필요합니다.");
		openAlertModal("로그인이 필요합니다.");
	}
	else {
		$.ajax({
			url: 'deleteBookmark',
			type: 'post',
			data: { 'board_id': boardId2 },
			success: function(response) {
				if (response != -1) {
					bookmarkCss2.hide();//북마크제거 css효과					
				}
				else {
					//alert("문제가 발생했습니다.");
					openAlertModal("문제가 발생했습니다.");
				}
			},
			error: function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});//ajax
	}
});