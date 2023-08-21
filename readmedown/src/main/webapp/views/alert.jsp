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
<link rel="icon" href="/images/logo-pencil.png" />
<link rel="apple-touch-icon" href="/images/logo-pencil.png" />
<script src="/js/jquery-3.6.4.min.js"></script>
<title>Read Me▼</title>
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/editor/modal.css" />
</head>
<body>
	<div id="alert_modal" class="modal">
		<div class="modal_box">
<!-- 			<div class="closebox">
				<img class="modal_cancelbtn" src="/images/sign/Close.svg" alt="창닫기" />
			</div> -->
			<div class="logobox">
				<img src="/images/ReadMeD_Mint.svg" alt="logo" />
			</div>
			<div class="modal_alert_text" id="modal_alert_text"></div>
			<div class="modal_btns">
				<button id="modal_ok_btn">확인</button>
			</div>
		</div>
	</div>
</body>
<script>
	let msg = "<c:out value='${msg}' />";
	let url = "<c:out value='${url}' />";

	openAlertModal(msg);
	$("#modal_ok_btn").on('click', function(){
		location.href = url;		
	});
	
	//모달 취소버튼(공통)
	$("body").on('click','.modal_cancelbtn',function(){
		$(this).parents(".modal").css("display","none");
	});

	//모달함수선언
	function openAlertModal(modal_msg){
		$("#alert_modal").css("display","flex");
		$("#alert_modal #modal_alert_text").html(modal_msg);
	}
	
</script>
</html>
