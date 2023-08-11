/**
 *
 */
function addcl(){
    let parent = this.parentNode.parentNode;
    parent.classList.add("focus");
}

function remcl(){
    let parent = this.parentNode.parentNode;
    if(this.value === ""){
        parent.classList.remove("focus");
    }
}

function clearLoginModal(){ // 로그인 창 비우기
    $('#idInput').val('');
    $('#pwdInput').val('');
    $('#login-result-msg').hide();
}

function logoutCheck(){ // 로그아웃 확인
    if(confirm('정말 로그아웃 하시겠습니까?')){
        location.href="/mingle/member/logout.do";
    }
}


function sendLoginRequest(){ // 로그인 버튼 클릭
    let id = $('#idInput');
    let pwd = $('#pwdInput');
    let msg = $('#login-result-msg');

    if(id.val().trim()===''){
        msg.text('아이디를 입력해주세요');
        msg.show();
        id.focus();
        return;
    }
    if(pwd.val().trim()===''){
        pwd.focus();
        msg.text('비밀번호를 입력해주세요');
        msg.show();
        return;
    }

    $.post('/mingle/member/loginCheck.do', {
            id:id.val(),
            pwd:pwd.val()
        },
        'text'
    )
        .done(function(result){

            if(result === 'NOID'){
                id.val('');
                pwd.val('');
                id.focus();
                alert('아이디를 찾을 수 없습니다');
            }
            else if(result === 'NOPWD'){
                pwd.val('');
                pwd.focus();
                alert('잘못된 비밀번호입니다')
            }
            else if(result ==='OK'){
                location.reload();
            }
        })
        .fail(function(){
            alert('로그인에 실패했습니다');
        })
}

const inputs = document.querySelectorAll(".login-content .input");
inputs.forEach(input => {
    input.addEventListener("focus", addcl);
    input.addEventListener("blur", remcl);
});
$('#open-login-btn').click(clearLoginModal);
$('#loginBtn').click(sendLoginRequest);
$('#logout-btn').click(logoutCheck);
