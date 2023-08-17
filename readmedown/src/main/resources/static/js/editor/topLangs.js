$("#top_langs_modal #additional_option_btn").on('click',function(){
	if($(this).text()=='▼추가 옵션 설정'){
		$(this).text('▲추가 옵션 설정');
	}else{
		$(this).text('▼추가 옵션 설정');
	}
	
	$("#top_langs_modal #additional_option_box").slideToggle();
});

$("#top_langs_modal #stats_theme_keyword").on("keyup",function(){
	$("#top_langs_modal #themetable tbody").html('');
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
					<td><label><input type="radio" name="theme" value="${list[i].stats_theme_name}"><span>${themename}</span></label></td>
					<td><img src="${list[i].stats_theme_img}"></td>
				</tr>`
				);
			}
		},
		error: function(request, status, error) { // 결과 에러 콜백함수
			console.log(error)
		}
	});//ajax end
})

$("#top_langs_modal").on("click",'#applybtn',function(){
	let gitid = $("#top_langs_modal #github_ID").val();
	let excludeRepo = $("#top_langs_modal #excludeRepo").val();
	let hideLang = $("#top_langs_modal #hideLang").val();
	let showLangCnt = $("#top_langs_modal #showLangCnt").val();
	let layout = $("#top_langs_modal input[name='layout']:checked").val();
	let theme = $("#top_langs_modal input[name='theme']:checked").val();
	
	if(gitid == ''){
		$('#top_langs_modal .modal_box').scrollTop(0);
		$("#top_langs_modal #github_ID_guide").text("github ID를 입력해 주세요");
		$("#top_langs_modal #github_ID_guide").css("color","var(--neon5)");
		$("#top_langs_modal #github_ID_guide").css("animation","vibration 0.1s");
		setTimeout(function() {$("#top_langs_modal #github_ID_guide").css("animation","");}, 200);
	}else{
		let divString = `<div>[![Top Langs](https://github-readme-stats.vercel.app/api/top-langs/?username=${gitid}`
		if(excludeRepo != ''){
			divString += `&exclude_repo=${excludeRepo}`;
		}
		if(hideLang != ''){
			divString += `&hide=${hideLang}`;
		}
		if(showLangCnt != ''){
			divString += `&langs_count=${showLangCnt}`;
		}
		if(layout != ''){
			if(layout == 'hidebar'){
				divString += `&hide_progress=true`;
			}else{
				divString += `&layout=${layout}`;
			}
		}
		divString += `&theme=${theme})](https://github.com/${gitid})</div>`;
		$(".ProseMirror").append(divString);
		$(this).parents(".modal").css("display","none");
	}
})