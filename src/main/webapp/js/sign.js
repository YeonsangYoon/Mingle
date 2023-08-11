/**
 *
 */
const inputs = document.querySelectorAll(".input");


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


inputs.forEach(input => {
    input.addEventListener("focus", addcl);
    input.addEventListener("blur", remcl);
});

//Source :- https://github.com/sefyudem/Responsive-Login-Form/blob/master/img/avatar.svg

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

$('#loginBtn').click(sendLoginRequest);

