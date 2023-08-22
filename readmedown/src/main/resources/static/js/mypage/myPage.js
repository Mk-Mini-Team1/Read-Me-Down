//프로필수정 이동
function redirectToEditProfile() {
	window.location.href = "/mypage/edit"; // 지정된 페이지로 이동
}

//북마크 추가(프론트)
$(".mypage_bookmark_btn").on('click', function() {
	$(this).parents().siblings(".bookmarked-plus").show();
});
//북마크 해제(프론트)
$(".mypage_bookmarked_btn").on('click', function() {
	$(this).parents(".bookmarked-plus").hide();
});


//함수 정의: 팔로우 버튼에 마우스를 가져다 대면 언팔로우로 변경
function showUnfollowText(button) {
    $(button).text("언팔로우");
}

$(document).ready(function() {
    // 팔로우 버튼에 마우스를 가져다 대면 언팔로우로 변경
    $(".follow_button button").hover(
        function() {
            showUnfollowText(this);
        },
        function() {
            // 마우스를 떼었을 때 버튼 텍스트를 팔로잉 또는 언팔로우로 변경
            var buttonText = $(this).hasClass("following") ? "언팔로우" : "팔로잉";
            $(this).text(buttonText);
        }
    );

    // 팔로우 버튼 클릭 시 클래스 토글 및 동작 실행
    $(".follow_button button").on('click', function() {
        var isFollowing = $(this).hasClass("following");      
        // 팔로우 버튼 클래스 토글
        $(this).toggleClass("following");
    });

    // 팔로우 제거 버튼 클릭 시 해당 팔로우 유저 삭제
    $(".follow_button button").on('click', function() {
        removeFollowingUser(this);
    });
});

function removeFollowingUser(button) {
    if (button) {
        var followingUserDiv = $(button).closest('.following_user');
        if (followingUserDiv) {
            followingUserDiv.remove();
        }
    }
}