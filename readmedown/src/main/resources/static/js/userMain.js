// 팔로잉 버튼에 마우스를 가져다 대면 언팔로우로 변경
$("#userInfo").on("mouseover", "#followingbtn", function() {
	$(this).text("언팔로우");
});
$("#userInfo").on("mouseleave", "#followingbtn", function() {
	$(this).html("<img src='/images/mypage/check.svg'>팔로잉");
});
// 팔로우 버튼에 마우스를 가져다 대면 언팔로우로 변경
$("#userInfo").on("mouseover", "#followbtn", function() {
	$(this).text("팔로잉하기");
});
$("#userInfo").on("mouseleave", "#followbtn", function() {
	$(this).text("팔로우");
});

// 팔로우 클릭
$("#userInfo").on("click", "#followbtn", function() {
	if ($("#user_id").val() == '') {
		openConfirmModal("로그인 회원 전용 기능입니다.<br>로그인 하시겠습니까?");
		$("#confirm_modal #confirm_modal_ok_btn").on('click', function() {
			$(this).parents(".modal").css("display", "none");
			$("#signIn_modal").show();
		});
	} else {
		$.ajax({
			type: 'post',
			url: '/insertfollowdto',
			dataType: 'json',
			data: {
				my_id: $("#user_id").val(),
				your_id: $("#other_id").val()
			},
			success: function(response) { // 결과 성공 콜백함수
				$("#user").load(window.location.href + " #user");
			},
			error: function(request, status, error) { // 결과 에러 콜백함수
				console.log(error)
			}
		});//ajax end
	}
});

// 언팔로우 클릭
$("#userInfo").on("click", "#followingbtn", function() {
	if ($("#user_id").val() == '') {
		openConfirmModal("로그인 회원 전용 기능입니다.<br>로그인 하시겠습니까?");
		$("#confirm_modal #confirm_modal_ok_btn").on('click', function() {
			$(this).parents(".modal").css("display", "none");
			$("#signIn_modal").show();
		});
	} else {
		$.ajax({
			type: 'post',
			url: '/deletefollowdto',
			dataType: 'json',
			data: {
				my_id: $("#user_id").val(),
				your_id: $("#other_id").val()
			},
			success: function(response) { // 결과 성공 콜백함수
				$("#user").load(window.location.href + " #user");
			},
			error: function(request, status, error) { // 결과 에러 콜백함수
				console.log(error)
			}
		});//ajax end
	}
});

//북마크 추가
$(".main_bookmark_btn").on('click', function(e) {
	e.stopPropagation();//클릭 이벤트 버블링 막기
	const boardId = $(this).parents().parents(".templates").attr('id');
	const bookmarkCss = $(this).parents().siblings(".bookmarked-plus");
	//alert(boardId);
	if ($("#user_id").val() == '') {
		openConfirmModal("로그인 회원 전용 기능입니다.<br>로그인 하시겠습니까?");
		$("#confirm_modal #confirm_modal_ok_btn").on('click', function() {
			$(this).parents(".modal").css("display", "none");
			$("#signIn_modal").show();
		});
	} else {
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
	if ($("#user_id").val() == '') {
		openConfirmModal("로그인 회원 전용 기능입니다.<br>로그인 하시겠습니까?");
		$("#confirm_modal #confirm_modal_ok_btn").on('click', function() {
			$(this).parents(".modal").css("display", "none");
			$("#signIn_modal").show();
		});
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

//모달 취소버튼(공통)
$("body").on('click','.modal_cancelbtn',function(){
	$(this).parents(".modal").css("display","none");
});

//Confirm모달함수선언
function openConfirmModal(modal_msg) {
	$("#confirm_modal").css("display", "flex");
	$("#confirm_modal #modal_alert_text").html(modal_msg);
	$("#confirm_modal").css("top", $(window).scrollTop() + "px");
	$('#confirm_modal').on('scroll touchmove mousewheel', function(event) {
		event.preventDefault();
		event.stopPropagation();
		return false;
	});
}

$("#signIn_modal .signIn_submit").click(function(event) {
	event.preventDefault(); // 폼 제출 방지

	var email = $("#email").val();
	var password = $("#password").val();

	$.ajax({
		type: "POST",
		url: "/signin",
		data: {
			email: email,
			password: password
		},
		success: function(response) {
			if (response.success) {
				// 로그인 성공 시 처리
				$("#signIn_modal").css("display", "none");
				location.reload();
			} else {
				$(".errorMessage").text(response.errorMessage);
			}
		}
	});
});

//사진 누르면 디테일 페이지로 이동
$("#templateWrap").on('click', ".templates" ,function(){
	let bi = $(this).attr("id");
	//alert(bi);
	location.href = "/detail?bi="+bi;
});