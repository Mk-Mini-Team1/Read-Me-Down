<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" href="/images/logo-pencil.png" />
<link rel="apple-touch-icon" href="/images/logo-pencil.png" />
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/mypage/editProfile.css" />
<script src="/js/jquery-3.6.4.min.js"></script>
<title>Read Me▼</title>

</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="main_box">
		<div id="main_contents">
			<main class="edit_container">
				<a href="/"> <img src="/images/ReadMeD_Mint.svg" alt="로고아이콘" />
				</a>
				<p>내 정보 수정</p>
				<div class="editinfoForm">
					<div class="edit_userWrapper">
						<div class="userId">
							<p>${my_info.email}</p>
						</div>
						<div class="upload_img_box">
							<div class="edit_profile_image">
								<img id="img_preview" src="${my_info.profile_image}"
  								  onerror="this.src='/images/profile-default.svg'" />

									<input type="file" id="imageUploadInput" style="display: none;">
									<input type="hidden" id="profile_img" name="profile_img" value="" />
								<button
									onclick="document.getElementById('imageUploadInput').click();">Image
									Upload</button>
							</div>
						</div>
					</div>
					<div class="edit_nameWrapper">
						<p>닉네임</p>
						<input type="text" placeholder="닉네임 입력" id="edit_name"
							name="edit_name" value="${my_info.name}"/> 
							<span id="Rule">닉네임은  2~10글자 이내로 한글, 영어, 숫자를 포함 할 수 있습니다.</span>
					</div>
					<div class="edit_passwordWrapper">
						<p>현재 비밀번호</p>
						<input type="password" id="now_password" name="password" placeholder="현재 비밀번호 입력" />
						<p>새 비밀번호</p>
						<input type="password" id="edit_password" name="edit_password"
							maxlength="25" placeholder="비밀번호 입력" /> <span
							id="Rule">영문과 숫자, 특수문자를 포함한 8~20자리의 규칙을 지켜주세요.</span>
						<p>비밀번호 확인</p>
						<input type="password" id="check_edit_Password" name="check_edit_password"maxlength="25"
							placeholder="비밀번호 확인" /> 
					</div>
					<div class="edit_gitWrapper">
						<p>
							Github ID
						</p>
						<input type="text" placeholder="깃아이디" id="edit_gitId"
							name="edit_gitId" value="${my_info.git_id}"/>
					</div>
					<button class="editButton">수정하기</button>
				</div>
			</main>
		</div>
	</div>
	<script>
    // 이미지 첨부
    $("#imageUploadInput").change(function () {
        const fileInput = document.getElementById('imageUploadInput');
        const formData = new FormData();
        const file = fileInput.files[0];
        formData.append('uploadFile', file);

        $.ajax({
            type: 'post',
            enctype: 'multipart/form-data',
            url: '/board/imageUpload',
            data: formData,
            processData: false,
            contentType: false,
            dataType: 'json',
            success: function (data) {
                data.uploadPath = data.uploadPath.replace(/\\/g, '/');
                let imgUrl = "/display?fileName=" + data.uploadPath + "/" + data.uuid + "_" + data.fileName;
                $("#img_preview").attr("src", imgUrl);
                
                // 이미지 URL을 imageValue 변수에 할당
                imageValue = imgUrl;
                $("#profile_img").val(imageValue); // 이미지 URL을 숨겨진 필드에도 할당
            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });

    });//사진첨부
    
    
    
    
	</script>

<script src="/js/mypage/updateUser.js"></script>
</body>
</html>

