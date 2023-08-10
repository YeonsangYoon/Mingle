/**
 *
 */

$('#loginBtn').click(function(){ // 로그인 버튼 클릭
    let id = $('#idInput');
    let pwd = $('#pwdInput');
    let msg = $('#login-result-msg');

    if(id.val().trim()===''){
        id.val('');
        pwd.val('');
        id.focus();
        return;
    }
    if(pwd.val().trim()===''){
        pwd.val('');
        pwd.focus();
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
                msg.text('아이디를 찾을 수 없습니다');
                msg.show();
            }
            else if(result === 'NOPWD'){
                msg.text('잘못된 비밀번호입니다');
                msg.show();
            }
            else if(result ==='OK'){
                location.reload();
            }
        })
        .fail(function(){
            alert('로그인에 실패했습니다');
        })
})