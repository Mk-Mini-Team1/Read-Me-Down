$("#trophy_modal .modal_subtitle.addoption").on('click',function(){
	let str = $(this).text();
	if(str.includes("▼")){
		str=str.replaceAll("▼","▲")
		$(this).text(str);
	}else{
		str=str.replaceAll("▲","▼")
		$(this).text(str);
	}
	$(this).next().slideToggle(300);
});

$("#trophy_modal").on("click","input[name='title_option']",function(){
	if($(this).val()=='all'){
		if(!$(this).is(':checked')){
			$("input[name='title_option']").prop('checked',false);
		}else{
			$("input[name='title_option']").prop('checked',true);
		}
	}else{
		if(!$(this).is(':checked')){
			$($("input[name='title_option']")[0]).prop('checked',false);
		}
	}
});

$("#trophy_modal").on("click","input[name='rank_option']",function(){
	if($(this).val()=='all'){
		if(!$(this).is(':checked')){
			$("input[name='rank_option']").prop('checked',false);
		}else{
			$("input[name='rank_option']").prop('checked',true);
		}
	}else{
		if(!$(this).is(':checked')){
			$($("input[name='rank_option']")[0]).prop('checked',false);
		}
	}
});

$("#trophy_modal").on("click",'#trophy_applybtn',function(){
	let gitid = $("#trophy_modal #trophy_github_ID").val();
	let theme = $("#trophy_modal input[name='theme']:checked").val();
	let title = $("#trophy_modal input[name='title_option']:checked");
	let title_total = $("#trophy_modal input[name='title_option']:checked").length;
	let title_str = "";
	if($(title[0]).val()=='all' || title_total>=7){
		title_str="";
	}else{
		$(title).each(function(i){
			if($(this).val()!='all'){
				if(i === title_total-1){
					title_str += $(this).val();
				}else{
					title_str += $(this).val()+",";
				}
			}
		});
	}
	let rank = $("#trophy_modal input[name='rank_option']:checked");
	let rank_total = $("#trophy_modal input[name='rank_option']:checked").length;
	let rank_str = "";
	if($(rank[0]).val()=='all' || rank_total>=9){
		rank_str="";
	}else{
		$(rank).each(function(i){
			if($(this).val()!='all'){
				if(i === rank_total-1){
					rank_str += $(this).val();
				}else{
					rank_str += $(this).val()+",";
				}
			}
		});
	}
	/*text 추가옵션*/
	let map = new Map();
	map.set("title",title_str);
	map.set("rank",rank_str);
	map.set("row",$("#trophy_row").val()==3?0:$("#trophy_row").val());
	map.set("column",$("#trophy_col").val()==6?0:$("#trophy_col").val());
	map.set("margin-w",$("#trophy_row_margin").val()==0?0:$("#trophy_row_margin").val());
	map.set("margin-h",$("#trophy_col_margin").val()==0?0:$("#trophy_row_margin").val());
	map.set("no-bg",$("input[name='trophy_bg_color']:checked").val());
	map.set("no-frame",$("input[name='trophy_border_color']:checked").val());
	if(gitid == ''){
		$('#trophy_modal .modal_box').scrollTop(0);
		$("#trophy_modal #trophy_github_ID_guide").text("github ID를 입력해 주세요");
		$("#trophy_modal #trophy_github_ID_guide").css("color","var(--neon5)");
		$("#trophy_modal #trophy_github_ID_guide").css("animation","vibration 0.1s");
		setTimeout(function() {$("#trophy_modal #trophy_github_ID_guide").css("animation","");}, 200);
	}else{
		/* 출력 */
		let divString = `<div>[![trophy](https://github-profile-trophy.vercel.app/?username=${gitid}&theme=${theme}`
		for (const [key, value] of map) {
			if(value == "" || value == null || value == undefined || value==0 || value=="false"){
				continue;
			}else{
				divString += `&${key}=${value}`;
			}
		}
		divString += `)](https://github.com/${gitid})</div>`;
		$(".ProseMirror").append(divString);
		$(this).parents(".modal").css("display","none");
	}
})