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
	// Textarea 자동 높이 조절
	autosize($('textarea'));
	
	//체크박스 중복 막기
	$('input[type="checkbox"][name="is_secret"]').on('click', function(){
	  if($(this).prop('checked')){
	     $('input[type="checkbox"][name="is_secret"]').prop('checked',false);
	     $(this).prop('checked',true);
	  }
	});
	
	//뒤로가기 버튼 호버이벤트
	$("#back_to_editer_btn").hover(function(){
		$(this).attr("src", "/images/back_icon_point.png");
	}, function(){
		$(this).attr("src", "/images/back_icon.png");
	});

	
}); //ready
</script>
</head>
<body>
<jsp:include page="header.jsp"/>
	
<div id="main_box">
<div id="main_contents">
<div id="whole_wrapper">
	<div id="writingForm_wrap_box">
		<div id="writingForm_top_btns">
			<div id="back_to_editer"><img id="back_to_editer_btn" src="/images/back_icon.png" /></div>
			<div id="submit_board"><input type=button id="submit_board_btn" value="작성완료"/></div>
		</div>
		<div id="writingForm">
			<div id="wf_left">
				<div id="upload_img_box">
					<label for="board_img_upload">
						<div id="upload_img_border_box">
								<div id="img_plus_box"><img id="img_plus_btn" src="/images/img_plus_btn.png"></div>
								<div id="upload_explain1">이미지 업로드하기</div>
								<div id="upload_explain2">대표 이미지를 첨부해주세요.<br>이미지 파일의 크기는<br>최대 5MB까지 가능합니다.</div>
						</div>
					</label>
					<input type="file" id="board_img_upload">
				</div>
			</div>
			<div id="wf_right">
					<div id="board_title_box"><input type=text id="board_title" placeholder="제목" /></div>
					<div id="board_contents_box">
					    <textarea rows=1, id="board_contents" placeholder="내용을 입력하세요."></textarea>
					</div>
					<div id="board_tag_box"><input type=text id="board_tag" placeholder="태그를 추가하세요." /></div>
					<div id="board_link_box"><input type=text id="board_link" placeholder="링크를 추가하세요." /></div>
					<div id="is_secret_box">
						<div id="for_gap_box">
							<input type="checkbox" id="no_secret" name="is_secret" value="no"><label for="no_secret"></label>템플릿 공개하기
							<input type="checkbox" id="yes_secret" name="is_secret" value="yes"><label for="yes_secret"></label>나만 보기
						</div>
					</div>
			</div>
		</div>
	</div>
	
</div><!-- end form_wrap_box -->	
</div></div>

</body>
</html>
