$("#activity_graph_modal").on("click",'#applybtn',function(){
	let gitid = $("#activity_graph_modal #github_ID").val();
	let theme = $("#activity_graph_modal input[type='radio']:checked").val();

	if(gitid == ''){
		$("#activity_graph_modal #github_ID_guide").text("github ID를 입력해 주세요");
		$("#activity_graph_modal #github_ID_guide").css("color","var(--neon5)");
		$("#activity_graph_modal #github_ID_guide").css("animation","vibration 0.1s");
		setTimeout(function() {$("#activity_graph_modal #github_ID_guide").css("animation","");}, 200);
	}else{
		let divString = `<div>[![Ashutosh's github activity graph](https://github-readme-activity-graph.vercel.app/graph?username=${gitid}&theme=${theme})](https://github.com/${gitid})</div>`;
		$(".ProseMirror").append(divString);
		$(this).parents(".modal").css("display","none");
	}
})