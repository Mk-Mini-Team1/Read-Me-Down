<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/css/editor/capsuleRender.css" />
</head>
<body>
	<div id="capsule_render_modal" class="modal">
		<div class="modal_box">
			<div class="closebox">
				<img class="modal_cancelbtn" src="/images/sign/Close.svg" alt="창닫기" />
			</div>
			<span class="modal_title">Capsule Render</span>
			<span class="modal_subtitle">기본 설정</span>
			<div id="optionBoxWrap">
				<div class="optionbox">
					<div class="optionbox_title">텍스트</div>
					<div class="optionbox_contents">
						<input type="text" id="cr_text" placeholder="Text" value="">
					</div>
				</div>
				<div class="optionbox">
					<div class="optionbox_title">영역 설정</div>
					<div class="optionbox_contents">
						<label><input type="radio" name="section_option" value="header" checked><span>Header (default)</span></label>
						<label><input type="radio" name="section_option" value="footer"><span>Footer</span></label>
					</div>
				</div>
				<div class="optionbox">
					<div class="optionbox_title">좌우반전<br></div>
					<div class="optionbox_contents">
						<label><input type="radio" name="reversal_option" value="false" checked><span>없음 (default)</span></label>
						<label><input type="radio" name="reversal_option" value="true"><span>좌우반전</span></label>
					</div>
				</div>
				<div class="optionbox">
					<div class="optionbox_title">높이</div>
					<div class="optionbox_contents">
						<input type="number" name="cr_height" placeholder="120(default)" value="120">
					</div>
				</div>
			</div>
			<span class="modal_subtitle">이미지 타입 설정</span>
			<div class="typetable" id="typetable" >
				<table>
					<thead>
						<tr><th>Name</th><th>Preview</th></tr>
					</thead>
					<tbody>
						<tr>
							<td><label><input type="radio" name="type" value="wave" checked><span>Wave<br>(default)</span></label></td>
							<td><img src="https://capsule-render.vercel.app/api?type=wave&color=auto&height=200&section=header&text=Wave&fontSize=90"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="type" value="egg"><span>Egg</span></label></td>
							<td><img src="https://capsule-render.vercel.app/api?type=egg&color=auto&height=200&section=header&text=Egg&fontSize=90"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="type" value="shark"><span>Shark</span></label></td>
							<td><img src="https://capsule-render.vercel.app/api?type=shark&color=auto&height=200&section=header&text=Shark&fontSize=90"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="type" value="slice"><span>Slice</span></label></td>
							<td><img src="https://capsule-render.vercel.app/api?type=slice&color=auto&height=200&section=header&text=Slice&fontSize=90"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="type" value="rect"><span>Rect</span></label></td>
							<td><img src="https://capsule-render.vercel.app/api?type=rect&color=auto&height=200&section=header&text=Rect&fontSize=90"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="type" value="soft"><span>Soft</span></label></td>
							<td><img src="https://capsule-render.vercel.app/api?type=soft&color=auto&height=200&section=header&text=Soft&fontSize=90"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="type" value="rounded"><span>Rounded</span></label></td>
							<td><img src="https://capsule-render.vercel.app/api?type=rounded&color=auto&height=200&section=header&text=Rounded&fontSize=90"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="type" value="cylinder"><span>Cylinder</span></label></td>
							<td><img src="https://capsule-render.vercel.app/api?type=cylinder&color=auto&height=200&section=header&text=Cylinder&fontSize=90"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="type" value="waving"><span>Waving</span></label></td>
							<td><img src="https://capsule-render.vercel.app/api?type=waving&color=auto&height=200&section=header&text=Waving&fontSize=90"/></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="type" value="transparent"><span style="font: var(--button12);">Transparent</span></label></td>
							<td><img src="https://capsule-render.vercel.app/api?type=transparent&color=auto&height=200&section=header&text=Transparent&fontSize=90&fontColor=ffffff"/></td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<span class="modal_subtitle">이미지 색상 설정</span>
			<div class="typetable" id="colortable" style="height: 200px;" >
				<table>
					<thead>
						<tr><th>종류</th><th>설명</th></tr>
					</thead>
					<tbody>
						<tr>
							<td><label><input type="radio" name="cr_color_option" value="auto" checked><span>auto<br>(default)</span></label></td>
							<td><div>공식 github 리스트 내의 색상들이<br>랜덤 출력됩니다.</div></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="cr_color_option" value="timeAuto"><span>timeAuto</span></label></td>
							<td><div>공식 github 리스트 내의 색상들이<br>시간에 따라 랜덤 출력됩니다..</div></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="cr_color_option" value="random"><span>random</span></label></td>
							<td><div>무작위 색상이 출력됩니다.</div></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="cr_color_option" value="gradient"><span>gradient</span></label></td>
							<td><div>공식 github 리스트 내의 그라데이션 색상들이 랜덤 출력됩니다.</div></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="cr_color_option" value="timeGradient"><span>time<br>Gradient</span></label></td>
							<td><div>공식 github 리스트 내의 그라데이션 색상들이 시간에 따라 랜덤 출력됩니다.</div></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="cr_color_option" value="hexcode"><span>hexcode</span></label></td>
							<td style="flex-direction: column;"><div>사용자가 지정하는 색상이 출력됩니다.</div>
								<div style="display:flex; align-items: center;"><span>색상선택 :</span><input type="color" class="colorpicker" id="color_option_choice" value="#ffffff"><span>#FFFFFF</span></div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<p style="font-size:14px; text-align: center; margin-bottom: 10px;">색상 리스트와 관련한 내용은 <a style="color:var(--neon4);" href="https://github.com/kyechan99/capsule-render">공식 github 링크</a>를 참조하세요.</p>
			
			<span class="modal_subtitle addoption" id="add_text_option_btn">▼ Text 추가 옵션 설정 ▼</span>
			<div class="additional_optionBoxWrap">
				<div class="add_optionbox" id="hidden_option_box">
					<div class="add_optionbox_title">글자 색상</div>
					<div class="add_optionbox_contents">
						<input type="color" class="colorpicker" id="color_font_choice" value=""><span>색상선택</span>
					</div>
				</div>
				<div class="add_optionbox" id="hidden_option_box">
					<div class="add_optionbox_title">글자 크기</div>
					<div class="add_optionbox_contents">
						<input type="number" id="cr_font_size" placeholder="70(default)" value="70">
					</div>
				</div>
				<div class="add_optionbox" id="hidden_option_box">
					<div class="add_optionbox_title">글자 정렬</div>
					<div class="add_optionbox_contents">
						<span>X :</span>
						<input type="number" style="width:190px;" id="cr_align_x" placeholder="50(default)" value="50">
						<span>Y :</span>
						<input type="number" style="width:190px;" id="cr_align_y" placeholder="50(default)" value="50">
					</div>
				</div>
				<div class="add_optionbox" id="hidden_option_box">
					<div class="add_optionbox_title">글자 효과</div>
					<div class="add_optionbox_contents">
						<label><input type="radio" name="cr_animation" value="fadeIn"><span>FadeIn</span></label>
						<label><input type="radio" name="cr_animation" value="scaleIn"><span>ScaleIn</span></label>
						<label><input type="radio" name="cr_animation" value="blink"><span>Blink</span></label>
						<label><input type="radio" name="cr_animation" value="blinking"><span>Blinking</span></label>
						<label><input type="radio" name="cr_animation" value="twinkling"><span>Twinkling</span></label>
					</div>
				</div>
				<div class="add_optionbox" id="hidden_option_box">
					<div class="add_optionbox_title">글자 회전</div>
					<div class="add_optionbox_contents">
						<input type="number" id="cr_rotate_size" placeholder="0(default)" value="0">
					</div>
				</div>
				<div class="add_optionbox" id="hidden_option_box">
					<div class="add_optionbox_title">글자 윤곽선 색상</div>
					<div class="add_optionbox_contents">
						<input type="color" class="colorpicker" id="color_stroke_choice" value=""><span>색상선택</span>
					</div>
				</div>
				<div class="add_optionbox" id="hidden_option_box" style="border:0">
					<div class="add_optionbox_title">글자 윤곽선 두께</div>
					<div class="add_optionbox_contents">
						<input type="number" id="cr_stroke_size" placeholder="0(default)" value="0" >
					</div>
				</div>
			</div>
			<span class="modal_subtitle addoption" id="add_desc_option_btn">▼ Desc 추가 옵션 설정 ▼</span>
			<div class="additional_optionBoxWrap">
				<div class="add_optionbox" id="hidden_option_box">
					<div class="add_optionbox_title">부제 Text</div>
					<div class="add_optionbox_contents">
						<input type="text" id="cr_desc_text" placeholder="Text">
					</div>
				</div>
				<div class="add_optionbox" id="hidden_option_box">
					<div class="add_optionbox_title">부제 글자 크기</div>
					<div class="add_optionbox_contents">
						<input type="number" id="cr_desc_size" placeholder="20(default)" value="20">
					</div>
				</div>
				<div class="add_optionbox" id="hidden_option_box">
					<div class="add_optionbox_title">부제 정렬</div>
					<div class="add_optionbox_contents">
						<span>X :</span>
						<input type="number" style="width:190px;" id="cr_descalign_x" placeholder="50(default)" value="50">
						<span>Y :</span>
						<input type="number" style="width:190px;" id="cr_descalign_y" placeholder="60(default)" value="60">
					</div>
				</div>
			</div>
			
			<div class="modal_btns">
				<button class="modal_cancelbtn">취소</button>
				<button id="cr_applybtn">적용하기</button>
			</div>
		</div>
	</div>
	
	<script src="/js/editor/capsuleRender.js"></script>
</body>
</html>
