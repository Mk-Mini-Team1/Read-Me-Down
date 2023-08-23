const modal = document.getElementById('modal');

function clickModal() {
  modal.classList.add('active');

  modal.innerHTML = `
	<label class="modalBackdrop" onclick="cancel()"></label>
	<div id="modal" class="modalContent">
		<p>리드미다운을 탈퇴 하시겠습니까?<br>
		탈퇴한 이메일은 재가입이 불가합니다.</p>
		<div class="buttonWrap">
		  <button class="btn delete" onclick="deleteUser()">삭제</button>
		  <button class="btn cancel" onclick="cancel()">취소</button>
		</div>
	</div>
	`;
}

function deleteUser() {
  const today = new Date();

  $.ajax({
    url: '/deleteuser',
    type: 'post',
    data: {
      today: today
    },
    success: function () {
      alert('탈퇴가 완료되었습니다.');
      location.href = '/';
    },
    error: function (error) {
      console.log(error);
    }
  });
}

function cancel() {
  modal.classList.remove('active');
}
