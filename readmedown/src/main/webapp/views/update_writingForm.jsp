<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
<link rel="icon" href="/images/logo-pencil.png" />
<link rel="apple-touch-icon" href="/images/logo-pencil.png" />
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/writingForm.css" />
<script src="/js/jquery-3.6.4.min.js"></script>
<title>Read Me▼</title>
<script>
$(document).ready(function() {
	//글 공개여부값 가져와 표시하기
	 isSecret();
	
	// Textarea 자동 높이 조절
	autosize($('textarea'));
	
	//체크박스 중복 막기
	$('input[type="checkbox"][name="secret"]').on('click', function(){
	  if($(this).prop('checked')){
	     $('input[type="checkbox"][name="secret"]').prop('checked',false);
	     $(this).prop('checked',true);
	  }
	});
	
	//뒤로가기 버튼 호버이벤트
	$("#back_to_editor_btn").hover(function(){
		$(this).attr("src", "/images/back_icon_point.png");
	}, function(){
		$(this).attr("src", "/images/back_icon.png");
	});

	//이미지 첨부
 	$("#board_img_upload").change(function() {
	  	const fileInput = document.getElementById('board_img_upload');
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
     	    	$("#board_img").val(imgUrl);     	    	
				$("#upload_img_box").css("display","none");
				$("#after_upload").css("display","block");
            },
            error: function(request,status,error) {
			      		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			      		console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			      }
        });//ajax
	});//사진첨부
	
	//글 작성(코드 이후)
	$("#submit_board_btn").on('click', function(){
		//제목, 이미지첨부, 공개여부 없으면 입력불가
 		if($.trim($("#board_img").val()) !== ""){
	  		if($.trim($("#board_title").val()) !== ""){
 				if($('input[name="secret"]').is(':checked') == true) {
 					$("#second_update_form").submit();	
 				}
 				else {
	 				alert("공개 여부를 선택해주세요."); 						 					
 				}
 			}
 			else {
	 			alert("제목을 입력해주세요.");
 			}	
 		}
 		else {
			alert("대표 이미지를 첨부해주세요.");
 		} 
		 
	});
	
	
}); //ready
</script>
</head>
<body>
<jsp:include page="header.jsp"/>
	
<div id="main_box">
<div id="main_contents">
<div id="whole_wrapper">

<form action="secondupdate" id="second_update_form" method="post">
	<div id="writingForm_wrap_box">
		<div id="writingForm_top_btns">
			<div id="back_to_editor"><img id="back_to_editor_btn" src="/images/back_icon.png" /></div>
			<div id="submit_board"><input type=button id="submit_board_btn" value="수정완료"/></div>
		</div>
		<div id="writingForm">
			<div id="wf_left">
				<div id="upload_img_box" style="display : none;">
					<label for="board_img_upload">
						<div id="upload_img_border_box">
								<div id="img_plus_box"><img id="img_plus_btn" src="/images/img_plus_btn.png"></div>
								<div id="upload_explain1">이미지 업로드하기</div>
								<div id="upload_explain2">대표 이미지를 첨부해주세요.<br>이미지 파일의 크기는<br>최대 5MB까지 가능합니다.</div>
						</div>
					</label>
					<input type="file" id="board_img_upload">
				</div>
				<div id="after_upload" style="display : block;">					
 					<div id="preview_wrapper" >
						<div id="delete_img_box"><div id="delete_img_icon" onclick='cancleImg(this)'>X</div></div>
						<div id="img_preview_box">
							<img id="img_preview" src="${dto.board_img }" onerror="this.src='/images/main/no_img.svg'"/>
							<input type="hidden" id="board_img" name="board_img" value="${dto.board_img }" />
						</div>
					</div>
				</div>
			</div>
			<div id="wf_right">
					<div id="board_title_box"><input type=text id="board_title" name="title" placeholder="제목" value="${dto.title }" /></div>
					<div id="board_contents_box">
					    <textarea rows=1, id="board_contents" name="contents" placeholder="내용을 입력하세요.">${dto.contents }</textarea>
					</div>
					<div id="board_tag_box"><input type=text id="board_tag" name="board_tag" placeholder="#을 이용하여 태그를 추가해보세요." value="${dto.board_tag }"/></div>
					<div id="board_link_box"><input type=text id="board_link" name="board_link" placeholder="링크를 추가하세요." value="${dto.board_link }"/></div>
					<input type=hidden id="board_id" name="board_id" value="${dto.board_id }"/>
					<div id="is_secret_box">
						<div id="for_gap_box">
							<input type="checkbox" id="no_secret" name="secret" value="no"><label for="no_secret"></label>템플릿 공개하기
							<input type="checkbox" id="yes_secret" name="secret" value="yes"><label for="yes_secret"></label>나만 보기
						</div>
					</div>
			</div>
		</div>
	</div>
</form>	

</div><!-- end whole_wrapper -->	
</div></div>

</body>
<script>
//댓글,대댓글에 사진 첨부한거 취소하기
function cancleImg(e){
/* 	let imgId = $(e).parent().siblings().children().attr('id');
	let divId = $(e).parents().parents("#after_upload").attr('id');
	let divId = $(e).parents().parents().prev("#upload_img_box").attr('id');
	alert(imgId + " / " + divId); */
	
 	$(e).parent().siblings().children("#img_preview").attr('src',"");
 	$(e).parent().siblings().children("#board_img").val("");
	$(e).parents().parents("#after_upload").hide();
	$(e).parents().parents().prev("#upload_img_box").show();
};  

//체크박스 표시하기
function isSecret(){
	const secret = "${dto.secret}";
	if("${dto.secret}" == "yes"){
		$('#yes_secret').prop('checked',true);
	}
	else {
		$('#no_secret').prop('checked',true);		
	}
	
};
</script>
</html>
