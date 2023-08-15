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

//모달 취소버튼(공통)
$("body").on('click','.modal_cancelbtn',function(){
	$(this).parents(".modal").css("display","none");
});

//모달함수선언
function openbadges(){
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
	//로드시 modal_result 버튼 채우기
}
