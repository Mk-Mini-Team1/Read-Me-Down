$("#readme_stats_modal").on("click","input[name='hidden_option']",function(){
	if($(this).val()=='all'){
		if(!$(this).is(':checked')){
			$("input[name='hidden_option']").prop('checked',false);
		}else{
			$("input[name='hidden_option']").prop('checked',true);
		}
	}else{
		if(!$(this).is(':checked')){
			$($("input[name='hidden_option']")[0]).prop('checked',false);
		}
	}
});

$("#readme_stats_modal").on("click","input[name='add_option']",function(){
	if($(this).val()=='all'){
		if(!$(this).is(':checked')){
			$("input[name='add_option']").prop('checked',false);
		}else{
			$("input[name='add_option']").prop('checked',true);
		}
	}else{
		if(!$(this).is(':checked')){
			$($("input[name='add_option']")[0]).prop('checked',false);
		}
	}
});


$("#stats_theme_keyword").on("keyup",function(){
	$("#readme_stats_modal #themetable tbody").html('');
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

$("#readme_stats_modal").on("click",'#applybtn',function(){
	let gitid = $("#readme_stats_modal #github_ID").val();
	let hiddenop = $("#readme_stats_modal input[name='hidden_option']:checked")[0];
	let hiddenop_str = '';
	let total_hidden = $("#readme_stats_modal input[name='hidden_option']:not(:checked)").length;
	if($(hiddenop).val() != 'all'){
		$("#readme_stats_modal input[name='hidden_option']:not(:checked)").each(function(i){
			if($(this).val()!='all'){
				if(i === total_hidden-1){
					hiddenop_str += $(this).val();
				}else{
					hiddenop_str += $(this).val()+",";
				}
			}
		});
	};
	let addop = $("#readme_stats_modal input[name='add_option']:checked");
	let addop_str = '';
	let total_add = $("#readme_stats_modal input[name='add_option']:checked").length;
	$(addop).each(function(i){
		if($(this).val()!='all'){
			if(i === total_add-1){
				addop_str += $(this).val();
			}else{
				addop_str += $(this).val()+",";
			}
		}
	});
	let iconop = $("#readme_stats_modal input[name='icon_option']:checked").val();
	let theme = $("#readme_stats_modal input[name='theme']:checked").val();
	if(gitid == ''){
		$('#readme_stats_modal .modal_box').scrollTop(0);
		$("#readme_stats_modal #github_ID_guide").text("github ID를 입력해 주세요");
		$("#readme_stats_modal #github_ID_guide").css("color","var(--neon5)");
		$("#readme_stats_modal #github_ID_guide").css("animation","vibration 0.1s");
		setTimeout(function() {$("#readme_stats_modal #github_ID_guide").css("animation","");}, 200);
	}else{
		let divString = `<div>[![Anurag's GitHub stats](https://github-readme-stats.vercel.app/api?username=${gitid}`
		if(hiddenop_str != ''){
			divString += `&hide=${hiddenop_str}`;
		}
		if(addop_str != ''){
			divString += `&show=${addop_str}`;
		}
		divString += `&show_icons=${iconop}&theme=${theme})](https://github.com/${gitid})</div>`;
		$(".ProseMirror").append(divString);
		$(this).parents(".modal").css("display","none");
	}
})