//header-side 전환효과
$("#header").animate({ left: "-100px" }, 500);
$("#main_box").animate({ 'margin-left' : "0" }, 500);

//header in-out
$('body').on('click','#menubar_homebtn',function(){
	if($(this).hasClass('active')){
		$(this).toggleClass('active');
		$("#header").animate({ left: "-100px" }, 300);
		$("#main_box").animate({ 'margin-left' : "0" }, 300);
		$("#header").toggleClass('show');
	}else{
		$(this).toggleClass('active')
		$("#header").animate({ left: "0px" }, 300);
		$("#main_box").animate({ 'margin-left' : "100px" }, 300);
		$("#header").toggleClass('show');
	}
})

$('body').on('click','#header a',function(e){
	if($("#header").hasClass('show')){
		let hreflink = $(this).attr('href');
		e.preventDefault();
		openConfirmModal("작성중이던 정보는 저장되지 않습니다.<br>해당 항목으로 이동하시겠습니까?");
		$("#confirm_modal #confirm_modal_ok_btn").on('click', function() {
			$.ajax({
				type: 'post',
				url: '/deleteNoSaveBoard',
				dataType: 'json',
				data: {
					user_id: $("#user_id").val()
				},
				success: function(data) { // 결과 성공 콜백함수
					$("#confirm_modal").css("display", "none");
					location.href = hreflink;
				},
				error: function(request, status, error) { // 결과 에러 콜백함수
					console.log(error)
				}
			});//ajax end
		});
	}
})

//help 파일
$('body').on('click', '#helpbtn', function() {
	openConfirmModal("작성중인 내용은 저장되지 않습니다.<br>Help.md 코드를 보시겠습니까?");
	$("#confirm_modal #confirm_modal_ok_btn").on('click', function() {
		$("#confirm_modal").css("display", "none");
		$(".ProseMirror").html($("#helpCodes").val() + "</div>");
	});
})

//Editor
const { Editor } = toastui;
const { colorSyntax } = Editor.plugin;
const { codeSyntaxHighlight } = Editor.plugin;

let editorHeight = $(window).height()-40;

const editor = new Editor({
	el: document.querySelector('#editor'),
	height: editorHeight+"px",
	initialEditType: 'markdown',
	previewStyle: 'vertical',
	plugins: [[colorSyntax], [codeSyntaxHighlight]],
	theme: 'dark',
	hooks: {
		addImageBlobHook: (blob, callback) => {
			// blob : Java Script 파일 객체
			const formData = new FormData();
			formData.append('uploadFile', blob);
			$.ajax({
				type: 'POST',
				enctype: 'multipart/form-data',
				url: '/board/imageUpload',
				data: formData,
				dataType: 'json',
				processData: false,
				contentType: false,
				cache: false,
				timeout: 600000,
				success: function(data) {
					data.uploadPath = data.uploadPath.replace(/\\/g, '/');
               		let imgUrl = "/display?fileName=" + data.uploadPath + "/" + data.uuid + "_" + data.fileName;
					// callback : 에디터(마크다운 편집기)에 표시할 텍스트, 뷰어에는 imageUrl 주소에 저장된 사진으로 나옴
					// 형식 : ![대체 텍스트](주소)
					callback(imgUrl, '사진 대체 텍스트 입력');
				},
				error: function(e) {
					//console.log('ajax 이미지 업로드 실패');
					//console.log(e.abort([statusText]));
					callback('image_load_fail', '사진 대체 텍스트 입력');
				}
			});
		}
	}//hook
});

//창크기 변화시 에디터 크기조절
window.onresize = function() {
	editorHeight = $(window).height() - 40;
	editor.setHeight(editorHeight+"px");
}

//에디터 내부 초기화
if($("#otherCodes").val()!=''){
	$(".ProseMirror").html($("#otherCodes").val()+"</div>");
}

//에디터 다크모드전환
$("body").on('click','#themebtn',function(){
	const editorEL = document.getElementsByClassName("toastui-editor-defaultUI")[0];
	if(editorEL) {
		if(editorEL.classList.contains("toastui-editor-dark")){
			editorEL.classList.remove("toastui-editor-dark");
			$(this).css("background-image","url('/images/editor/moon.svg')");
		}else{
			editorEL.classList.add("toastui-editor-dark");
			$(this).css("background-image","url('/images/editor/sun.svg')");
		}
	}
});

//에디터 내용 클립보드 카피
$("body").on('click', '#copybtn', function() {
	let codes = editor.getMarkdown();
	
	if(codes.length < 1){
		openAlertModal("복사할 내용이 없습니다.");
	}else{
		// 임시의 textarea 생성
		const $textarea = document.createElement("textarea");
		// body 요소에 존재해야 복사가 진행됨
		document.body.appendChild($textarea);
		// 복사할 특정 텍스트를 임시의 textarea에 넣어주고 모두 셀렉션 상태
		$textarea.value = codes;
		$textarea.select();
	
		// 복사 후 textarea 지우기
		document.execCommand('copy');
		document.body.removeChild($textarea);
		openAlertModal("복사가 완료되었습니다.");
	}
});

//에디터 내용 저장하기
$("body").on('click', '#savecodebtn', function() {
	let saveCode = editor.getMarkdown();
	saveCode = saveCode.replace(/\r\n|\n|\r/ig, '<br>');
	
	if ($("#user_id").val() == '') {
		openConfirmModal("로그인 회원 전용 기능입니다.<br>로그인 하시겠습니까?");
		$("#confirm_modal #confirm_modal_ok_btn").on('click', function() {
			$(this).parents(".modal").css("display","none");
			$("#signIn_modal").show();
		});
	} else if (saveCode.length < 1) {
		openAlertModal("내용을 작성해 주세요.");
	} else {
		$.ajax({
			type: 'post',
			url: '/savecodes',
			dataType: 'json',
			data: {
				user_id: $("#user_id").val(),
				codes: saveCode
			},
			success: function(data) { // 결과 성공 콜백함수
				$("#save_okay_modal").css("display","flex");
				$("#save_okay_modal #modal_okay_btn").on('click',function(){
					$("#save_okay_modal").css("display","none");
					location.href = "/writingForm?bi=" + data.board_id;
				});
			},
			error: function(request, status, error) { // 결과 에러 콜백함수
				console.log(error)
			}
		});//ajax end
	}
});

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
				$("#header_down").load(window.location.href + " #header_down");
				$("#hiddenData").load(window.location.href + " #hiddenData");
			} else {
				$(".errorMessage").text(response.errorMessage);
			}
		}
	});
});