$("#boj_m_modal").on("click",'#applybtn',function(){
	let bojID = $("#boj_m_modal #boj_ID").val();
	let version = $("#boj_m_modal input[name='version']:checked").val();
	if(bojID == ''){
		$("#boj_m_modal #boj_ID_guide").text("ID를 입력해 주세요");
		$("#boj_m_modal #boj_ID_guide").css("color","var(--neon5)");
		$("#boj_m_modal #boj_ID_guide").css("animation","vibration 0.1s");
		setTimeout(function() {$("#boj_m_modal #boj_ID_guide").css("animation","");}, 200);
	}else if(version == undefined){
		$("#boj_m_modal #boj_version_guide").text("버전을 선택해 주세요");
		$("#boj_m_modal #boj_version_guide").css("color","var(--neon5)");
		$("#boj_m_modal #boj_version_guide").css("animation","vibration 0.1s");
		setTimeout(function() {$("#boj_m_modal #boj_version_guide").css("animation","");}, 200);
	}else{
		let divString = ``
		if(version == 'mini'){
			divString = `<div>[![Solved.ac profile](http://mazassumnida.wtf/api/mini/generate_badge?boj=${bojID})](https://solved.ac/${bojID})</div>`;
		}
		if(version == 'v1'){
			divString = `<div>[![Solved.ac profile](http://mazassumnida.wtf/api/generate_badge?boj=${bojID})](https://solved.ac/${bojID})</div>`;
		}
		if(version == 'v2'){
			divString = `<div>[![Solved.ac profile](http://mazassumnida.wtf/api/v2/generate_badge?boj=${bojID})](https://solved.ac/${bojID})</div>`;
		}
		$(".ProseMirror").focus();
		$(".ProseMirror").append(divString);
		$(this).parents(".modal").css("display","none");
	}
})

$("#boj_h_modal").on("click",'#applybtn',function(){
	let bojID = $("#boj_h_modal #boj_ID").val();
	if(bojID == ''){
		$("#boj_h_modal #boj_ID_guide").text("ID를 입력해 주세요");
		$("#boj_h_modal #boj_ID_guide").css("color","var(--neon5)");
		$("#boj_h_modal #boj_ID_guide").css("animation","vibration 0.1s");
		setTimeout(function() {$("#boj_m_modal #boj_ID_guide").css("animation","");}, 200);
	}else{
		let divString = `<div>![hyp3rflow's solved.ac stats](https://github-readme-solvedac.hyp3rflow.vercel.app/api/?handle=${bojID})</div>`
		$(".ProseMirror").append(divString);
		$(this).parents(".modal").css("display","none");
	}
})

$("#codeforces_modal").on("click",'#applybtn',function(){
	let codeID = $("#codeforces_modal #codeforces_ID").val();
	if(codeID == ''){
		$("#codeforces_modal #codeforces_ID_guide").text("ID를 입력해 주세요");
		$("#codeforces_modal #codeforces_ID_guide").css("color","var(--neon5)");
		$("#codeforces_modal #codeforces_ID_guide").css("animation","vibration 0.1s");
		setTimeout(function() {$("#codeforces_modal #codeforces_ID_guide").css("animation","");}, 200);
	}else{
		let divString = `<div>[![CodeForces Profile](https://cf.leed.at?id=${codeID})](https://codeforces.com/profile/${codeID})</div>`
		$(".ProseMirror").append(divString);
		$(this).parents(".modal").css("display","none");
	}
});

$("#solved_grass_modal").on("click",'#applybtn',function(){
	let bojID = $("#solved_grass_modal #boj_ID").val();
	let theme = $("#solved_grass_modal input[name='theme']:checked").val();
	if(bojID == ''){
		$("#solved_grass_modal #boj_ID_guide").text("ID를 입력해 주세요");
		$("#solved_grass_modal #boj_ID_guide").css("color","var(--neon5)");
		$("#solved_grass_modal #boj_ID_guide").css("animation","vibration 0.1s");
		setTimeout(function() {$("#solved_grass_modal #boj_ID_guide").css("animation","");}, 200);
	}else if(theme == undefined){
		$("#solved_grass_modal #boj_version_guide").text("테마를 선택해 주세요");
		$("#solved_grass_modal #boj_version_guide").css("color","var(--neon5)");
		$("#solved_grass_modal #boj_version_guide").css("animation","vibration 0.1s");
		setTimeout(function() {$("#solved_grass_modal #boj_version_guide").css("animation","");}, 200);
	}else{
		let divString = `<div>![mazandi profile](http://mazandi.herokuapp.com/api?handle=${bojID}&theme=${theme})</div>`
		$(".ProseMirror").append(divString);
		$(this).parents(".modal").css("display","none");
	}
})