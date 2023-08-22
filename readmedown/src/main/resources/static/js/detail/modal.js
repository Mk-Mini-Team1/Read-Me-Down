const modal = document.getElementById('modal');

function cancel() {
  modal.classList.remove('active');
  modal.innerHTML = ''; // 모달 내용 초기화

}
function ok() {
	modal.classList.remove('active');
  modal.innerHTML = ''; // 모달 내용 초기화
   window.location.href = "/";

}
function Cok() {
	modal.classList.remove('active');
  modal.innerHTML = ''; // 모달 내용 초기화
  location.reload();

}

function clickModal(event) {
  modal.classList.add('active');
  let id = event.target.id;
  let board_id = event.target.getAttribute('data-placeid');
  modal.innerHTML = `
	<div class="modalBackdrop" onclick="cancel()"></div>
	<div class="modalContent">
	<div onclick="cancel()" class="closebox">
				<img class="modal_cancelbtn" src="/images/sign/Close.svg" alt="창닫기" />
			</div>
		<img class="deleteModalImg"  src="/images/ReadMeD_Mint.svg">
		<p>삭제된 데이터는 복구 불가합니다.</p>
		<p>템플릿을 정말 삭제하시겠습니까?</p>
		<br>
	
		<div class="buttonWrap">
		  
		  <button  class="btn cancel" onclick="cancel()">취소</button>
		  <button  class="btn delete" id="${id}" data-placeid="${board_id}" onclick="deleteBoard(event)">삭제</button>
		</div>
	</div>
	`;
}

function deleteBoard(event) {
  let board_id = event.target.getAttribute('data-placeid');
  
 
  
  $.ajax({
    url: `/deleteBoard`,
    type: 'post',
    data: {
      board_id: board_id
    },
    success: function() {
      // 삭제 성공 시 모달 내용 업데이트
      modal.innerHTML = `
        <div class="modalBackdrop" onclick="cancel()"></div>
        <div class="modalContent">
        <div onclick="cancel()" class="closebox">
				<img class="modal_cancelbtn" src="/images/sign/Close.svg" alt="창닫기" />
			</div>
          <img class="deleteModalImg" src="/images/ReadMeD_Mint.svg">
          <p>게시물이 삭제되었습니다.</p>
          <br>
          <div class="buttonWrap">
            <button class="btn cancel" onclick="ok()">확인</button>
          </div>
        </div>
      `;
 
      
    },
    error: function(error) {
      console.log(error);
      // 에러 처리를 위한 모달 내용 업데이트
      modal.innerHTML = `
        <div class="modalBackdrop" onclick="cancel()"></div>
        <div class="modalContent">
         <div onclick="cancel()" class="closebox">
				<img class="modal_cancelbtn" src="/images/sign/Close.svg" alt="창닫기" />
			</div>
          <p>삭제 중 오류가 발생했습니다.</p>
          <br>
          <div class="buttonWrap">
            <button class="btn cancel" onclick="cancel()">확인</button>
          </div>
        </div>
      `;
    }
  });
}

 

function clickCommentModal(event) {
  modal.classList.add('active');
  let id = event.target.id;
   let comment_id = event.target.getAttribute('data-placeid');
  modal.innerHTML = `
	<div class="modalBackdrop" onclick="cancel()"></div>
	<div class="modalContent">
		<h3>정말로 댓글을 삭제 하시겠습니까?</h3>
		<p>삭제한 댓글은 되돌릴 수 없습니다.</p>
		<div class="buttonWrap">
		  <button class="btn cancel" onclick="cancel()">취소</button>
		  <button class="btn delete" id="${id}" data-placeid="${comment_id}" onclick="deleteComment(event)">삭제</button>
		</div>
	</div>
	`;
}



function deleteComment(event) {
	  let comment_id = event.target.getAttribute('data-placeid');
  $.ajax({
    url: `/deletecomment`,
    type: 'post',
    data: {
     comment_id: comment_id
    },
    success: function() {
      modal.innerHTML = `
        <div class="modalBackdrop" onclick="cancel()"></div>
        <div  style="width:60px;" class="modalContent">
        <div  style="margin-left:300px;   width:60px;" onclick="cancel()" class="closebox">
				<img class="modal_cancelbtn" src="/images/sign/Close.svg" alt="창닫기" />
			</div>
          <p >댓글이 삭제되었습니다.</p>
          <br>
          <div  class="buttonWrap">
            <button class="btn cancel" onclick="Cok()">확인</button>
          </div>
        </div>
      `;
      
    },
    error: function(error) {
      console.log(error);
    }
  })
}
modal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("modal")) {
        modal.style.display = "none"
    }
});

document.onkeydown = function(event) {
  if (event.key === "Escape") {
    cancel(); // ESC 키를 누르면 모달을 닫음
  }
};