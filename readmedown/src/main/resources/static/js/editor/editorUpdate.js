//header-side 전환효과
$("#header").animate({ left: "-100px" }, 500);
$("#main_box").animate({ 'margin-left' : "0" }, 500);

//header in-out
$('body').on('click','#menubar_homebtn',function(){
	if($(this).hasClass('active')){
		$(this).toggleClass('active');
		$("#header").animate({ left: "-100px" }, 300);
		$("#main_box").animate({ 'margin-left' : "0" }, 300);
	}else{
		$(this).toggleClass('active')
		$("#header").animate({ left: "0px" }, 300);
		$("#main_box").animate({ 'margin-left' : "100px" }, 300);
	}
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
$(".ProseMirror").html($("#myCodes").val()+"</div>");

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
		openAlertModal("로그인 회원 전용 기능입니다.<br>로그인 후 이용해 주세요.");
	} else if (saveCode.length < 1) {
		openAlertModal("내용을 작성해 주세요.");
	} else {
		if ($("#myBoardWritetime").val() == '') { //writetime 없을때(작성폼이동)
			$.ajax({
				type: 'post',
				url: '/savecodes',
				dataType: 'json',
				data: {
					user_id: $("#user_id").val(),
					codes: saveCode
				},
				success: function(data) { // 결과 성공 콜백함수
					$("#save_okay_modal").css("display", "flex");
					$("#save_okay_modal #modal_alert_text").html("코드 저장이 완료되었습니다.<br>다음 글쓰기 단계로 이동합니다.");
					$("#save_okay_modal #modal_okay_btn").on('click', function() {
						location.href = "/writingForm?bi=" + data.board_id;
					});
				},
				error: function(request, status, error) { // 결과 에러 콜백함수
					console.log(error)
				}
			}); //ajax end
		} else { //writetime 있을때(수정폼이동)
			$.ajax({
				type: 'post',
				url: '/updatecodes',
				dataType: 'json',
				data: {
					board_id: $("#myBoardID").val(),
					user_id: $("#user_id").val(),
					codes: saveCode
				},
				success: function(data) { // 결과 성공 콜백함수
					$("#save_okay_modal").css("display", "flex");
					$("#save_okay_modal #modal_alert_text").text("코드 수정이 완료되었습니다.<br>다음 수정단계로 이동합니다.");
					$("#save_okay_modal #modal_okay_btn").on('click', function() {
						location.href = "/boardupdateform?bi=" + data.board_id;
					});
				},
				error: function(request, status, error) { // 결과 에러 콜백함수
					console.log(error)
				}
			}); //ajax end
		}
	}
});