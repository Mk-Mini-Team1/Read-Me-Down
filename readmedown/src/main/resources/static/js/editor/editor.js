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

//에디터 크기조절
const editorHeight = $(window).height()-40;

const editor = new Editor({
	el: document.querySelector('#editor'),
	height: editorHeight+"px",
	initialEditType: 'markdown',
	previewStyle: 'vertical',
	plugins: [[colorSyntax], [codeSyntaxHighlight]],
	theme: 'dark'
});

//에디터 내부 초기화
$(".ProseMirror").html("<div>안녕</div>");

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
	
	if($("#user_id").val()==''){
		openAlertModal("로그인 회원 전용 기능입니다.<br>로그인 후 이용해 주세요.");
	}else if(saveCode.length < 1){
		openAlertModal("내용을 작성해 주세요.");
	}else{
		$.ajax({
		type: 'post',
		url: '/savecodes',
		dataType: 'json',
		data: {
			user_id:$("#user_id").val(),
			codes: saveCode
		},
		success: function(data) { // 결과 성공 콜백함수
			location.href = "/writingForm?board_id="+data.board_id;
		},
		error: function(request, status, error) { // 결과 에러 콜백함수
			console.log(error)
		}
	});//ajax end
	}
});

/* -------------------- Modal -------------------- */
//모달 취소버튼(공통)
$("body").on('click','.modal_cancelbtn',function(){
	$(this).parents(".modal").css("display","none");
});

//모달함수선언
function openAlertModal(modal_msg){
	$("#alert_modal").css("display","flex");
	$("#alert_modal #modal_alert_text").html(modal_msg);
}

function openBadges(){
	$.ajax({
		type: 'post',
		url: '/getbadges',
		dataType: 'json',
		data: {
			keyword: $("#badge_keyword").val()
		},
		success: function(data) { // 결과 성공 콜백함수
			let badgelist = data;
			for(let i=0; i<badgelist.length; i++){
				$("#modal_result").append("<button id='"+badgelist[i].badge_link+"'>" + badgelist[i].badge_name + '</button>');
			}
			$("#choosed_badges").html('');
			$("#badge_keyword").val('');
		},
		error: function(request, status, error) { // 결과 에러 콜백함수
			console.log(error)
		}
	});//ajax end
	$("#badge_modal").css("display","flex");
}

function openActivityGraph(){
	$("#activity_graph_modal").css("display","flex");
	//모달초기화
	$("#activity_graph_modal #github_ID").val('');
	$($("#activity_graph_modal input[type='radio']")[0]).prop("checked",true);
	$('#activity_graph_modal #themetable').scrollTop(0);
	$("#activity_graph_modal #github_ID_guide").text("조회할 github ID를 입력하세요.");
	$("#activity_graph_modal #github_ID_guide").css("color","var(--text)");
}

function openReadmeStats() {
	$("#readme_stats_modal").css("display", "flex");
	//모달초기화
	$('#readme_stats_modal .modal_box').scrollTop(0);
	$('#readme_stats_modal #themetable').scrollTop(0);
	$("#readme_stats_modal #github_ID").val('');
	$("#readme_stats_modal #github_ID_guide").text("조회할 github ID를 입력하세요.");
	$("#readme_stats_modal #github_ID_guide").css("color","var(--text)");
	$("#readme_stats_modal input[name='hidden_option']").prop("checked",true);
	$("#readme_stats_modal input[name='add_option']").prop("checked",false);
	$($("#readme_stats_modal input[name='icon_option']")[0]).prop("checked",true);
	
	$.ajax({
		type: 'post',
		url: '/getstatstheme',
		dataType: 'json',
		data: {
			keyword: $("#stats_theme_keyword").val()
		},
		success: function(data) { // 결과 성공 콜백함수
			let list = data;
			for (let i = 0; i < list.length; i++) {
				let themename = list[i].stats_theme_name;
				themename = themename.replace("-", "<br>");
				themename = themename.replace("_", "<br>");
				$("#readme_stats_modal #themetable tbody").append(
					`<tr>
					<td><label><input type="radio" name="theme" value="${list[i].stats_theme_name}" checked><span>${themename}</span></label></td>
					<td><img src="${list[i].stats_theme_img}"></td>
				</tr>`
				);
				$($("#readme_stats_modal input[name='theme']")[0]).prop("checked", true);
			}
		},
		error: function(request, status, error) { // 결과 에러 콜백함수
			console.log(error)
		}
	});//ajax end
}

function openTopLangs() {
	$("#top_langs_modal").css("display", "flex");
	//모달초기화
	$('#top_langs_modal .modal_box').scrollTop(0);
	$('#top_langs_modal #themetable').scrollTop(0);
	$('#top_langs_modal #layouttable').scrollTop(0);
	$("#top_langs_modal #github_ID_guide").text("조회할 github ID를 입력하세요.");
	$("#top_langs_modal #github_ID_guide").css("color","var(--text)");
	$("#top_langs_modal input[type='text']").val('');
	$($("#top_langs_modal input[name='layout']")[0]).prop("checked", true);
	$.ajax({
		type: 'post',
		url: '/getstatstheme',
		dataType: 'json',
		data: {
			keyword: $("#top_langs_modal #stats_theme_keyword").val()
		},
		success: function(data) { // 결과 성공 콜백함수
			let list = data;
			for (let i = 0; i < list.length; i++) {
				let themename = list[i].stats_theme_name;
				themename = themename.replace("-", "<br>");
				themename = themename.replace("_", "<br>");
				$("#top_langs_modal #themetable tbody").append(
					`<tr>
					<td><label><input type="radio" name="theme" value="${list[i].stats_theme_name}" checked><span>${themename}</span></label></td>
					<td><img src="${list[i].stats_theme_img}"></td>
				</tr>`
				);
				$($("#top_langs_modal input[name='theme']")[0]).prop("checked", true);
			}
		},
		error: function(request, status, error) { // 결과 에러 콜백함수
			console.log(error)
		}
	});//ajax end
}
