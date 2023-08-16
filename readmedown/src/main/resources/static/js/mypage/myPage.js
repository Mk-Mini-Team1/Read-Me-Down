// 함수 정의: 팔로우 버튼에 마우스를 가져다 대면 언팔로우로 변경
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




//프로필수정 이동
function redirectToEditProfile() {
	window.location.href = "/mypage/edit"; // 지정된 페이지로 이동
}

//카테고리 적용
function showContent(contentType) {
	var contentDivs = document.getElementsByClassName("infoWrap")[0].children;
	for (var i = 0; i < contentDivs.length; i++) {
		if (contentDivs[i].classList.contains(contentType + "_list")) {
			contentDivs[i].style.display = "block";
		} else {
			contentDivs[i].style.display = "none";
		}
	}

	// 카테고리 링크에 선택된 스타일 적용
	var categoryLinks = document.getElementsByClassName("category-link");
	for (var i = 0; i < categoryLinks.length; i++) {
		if (categoryLinks[i].id === contentType + "Link") {
			categoryLinks[i].classList.add("category-selected");
		} else {
			categoryLinks[i].classList.remove("category-selected");
		}
	}

	// 내 템플릿 카테고리에 선택된 스타일 적용 (기본 선택)
	var myTemplateLink = document.getElementById("myTemplateLink");
	if (contentType === "myTemplate") {
		myTemplateLink.classList.add("category-selected");
	} else {
		myTemplateLink.classList.remove("category-selected");
	}
}



//북마크 추가(프론트)
$(".main_bookmark_btn").on('click', function() {
	$(this).parents().siblings(".bookmarked-plus").show();
});
//북마크 해제(프론트)
$(".main_bookmarked_btn").on('click', function() {
	$(this).parents(".bookmarked-plus").hide();
});



// 페이지 로딩 시 기본 카테고리 설정
window.onload = function() {
	showContent('myTemplate');
};



//Masonry
$(document).ready(function() {
	var msnry = new Masonry('.grid', {
		itemSelector : '.grid-item',
		columnWidth : '.grid-sizer',
		percentPosition : true,
		gutter : 20,
	});
	imagesLoaded('.grid').on('progress', function() {
		msnry.layout();
	});

}); //ready