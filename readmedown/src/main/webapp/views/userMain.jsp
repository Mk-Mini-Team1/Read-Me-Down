<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
<script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
<link rel="icon" href="/images/logo-pencil.png" />
<link rel="apple-touch-icon" href="/images/logo-pencil.png" />
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/userMain.css" />
<script src="/js/jquery-3.6.4.min.js"></script>
<title>Read Me▼</title>
</head>
<body>
<jsp:include page="header.jsp" />

<div id="main_box">
    <div id="main_contents">
        <div class="container">
            <div class="contentWrap">
                <div class="userInfo">
                    <div class="user">
                    	<div class="profile-image">
                        </div>
                        <div class="nick-name">
                        <p>템플릿기부천사<span>님</span></p></div>
                        <div class="follow-num">
                        <p>팔로워 23명</p>
                        </div>
                        <div class="follow_button">
								<button onmouseover="showUnfollowText()"
									onmouseout="showFollowingText()">Following</button>
						</div>
                    </div>
                </div>
            </div>
				<div class="categoryWrap">
					<div class="category">						
						<p><img src="/images/mypage/my_template.svg">유저 템플릿</p>						
					</div>				
				</div>
				<div class="infoWrap" id="infoWrap">
					<div class="myTemplate_list" style="display: block;">
						<div class="myTemplates">						
							<p>이 유저가 공개한 템플릿을 표시합니다.</p>
						</div>
					</div>					
				</div>
			</div>
    </div>
</div>
<script>
//팔로잉버튼 언팔로우 호버
function showUnfollowText() {
    var button = document.querySelector(".follow_button button");
    if (button) {
        button.textContent = "Unfollow";
    }
}

function showFollowingText() {
    var button = document.querySelector(".follow_button button");
    if (button) {
        button.textContent = "Following";
    }
}

</script>
</body>
</html>

