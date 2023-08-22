$("#capsule_render_modal .modal_subtitle.addoption").on('click',function(){
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

$("#capsule_render_modal").on("click",'#cr_applybtn',function(){
	let text = $("#cr_text").val().replace(' ','%20');
	let section = $("input[name='section_option']:checked").val();
	let reversal = $("input[name='reversal_option']:checked").val();
	let height = $("input[name='cr_height']").val();
	let type = $("input[name='type']:checked").val();
	let color = $("input[name='cr_color_option']:checked").val();
	if(color == "hexcode"){
		color = $("#color_option_choice").val().replace('#','');
	}
	/*text 추가옵션*/
	let map = new Map();
	map.set("fontColor",$("#color_font_choice").val().replace('#',''));
	map.set("fontSize",$("#cr_font_size").val()==70?0:$("#cr_font_size").val());
	map.set("fontAlign",$("#cr_align_x").val()==50?0:$("#cr_align_x").val());
	map.set("fontAlignY",$("#cr_align_y").val()==50?0:$("#cr_align_y").val());
	map.set("animation",$("input[name='cr_animation']:checked").val());
	map.set("rotate",$("#cr_rotate_size").val());
	map.set("stroke",$("#color_stroke_choice").val().replace('#',''));
	map.set("strokeWidth",$("#cr_stroke_size").val());
	/*desc 추가옵션*/
	map.set("desc",$("#cr_desc_text").val());
	map.set("descSize",$("#cr_desc_size").val()==20?0:$("#cr_desc_size").val());
	map.set("descAlign",$("#cr_descalign_x").val()==50?0:$("#cr_descalign_x").val());
	map.set("descAlignY",$("#cr_descalign_y").val()==50?0:$("#cr_descalign_y").val());
	
	/* 출력 */
	let divString = `<div>![${section}](https://capsule-render.vercel.app/api?section=${section}&type=${type}&color=${color}&height=${height}&text=${text}&reversal=${reversal}`;
	for (const [key, value] of map) {
		if(value == "" || value == null || value == undefined || value==0){
			continue;
		}else{
			divString += `&${key}=${value}`;
		}
	}
	divString += `)</div>`;
	$(".ProseMirror").append(divString);
	$(this).parents(".modal").css("display","none");
})