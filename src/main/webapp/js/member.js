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
        location.href="/mingle/auth/logout.do";
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

    $.post('/mingle/auth/login.do', {
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

/* Register 유효성 검사 */
function ck_id(){
    let user_id = $('#userId');
    let MsgId = $('#MsgId');
    let isUserID = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,15}$/

    if(!isUserID.test(user_id.val())){
        MsgId.attr('class', 'error');
        MsgId.text('영어, 숫자 포함 6자 이상');
        user_id.css('background-color', 'rgb(255, 255, 255)');
        return;
    }

    $.post('/mingle/auth/dupIdCheck.do',{
        userid:user_id.val()
        },
        'text'
    )
        .done(function(result){
            if(result === 'OK'){
                MsgId.attr('class', 'vaild');
                MsgId.text('ok');
                user_id.css('background-color', 'rgb(232, 240, 254)');
            }
            else{
                MsgId.attr('class', 'error');
                MsgId.text('이미 존재하는 아이디입니다.');
                user_id.css('background-color', 'rgb(255, 255, 255)');
            }
        })
}

function ck_nickname(){
    let nickname = $('#nickname');
    let MsgNickname = $('#MsgNickName');

    if(nickname.val().trim() === ''){
        MsgNickname.attr('class', 'error');
        MsgNickname.text('닉네임을 입력해주세요.');
        nickname.css('background-color', 'rgb(255, 255, 255)');
        return;
    }

    $.post('/mingle/auth/dupNicknameCheck.do', {
        nickname:nickname.val()
    },
        'text'
    )
        .done(function (result){
            if(result === 'OK'){
                MsgNickname.attr('class', 'vaild');
                MsgNickname.text('ok');
                nickname.css('background-color', 'rgb(232, 240, 254)');
            }
            else{
                MsgNickname.attr('class', 'error');
                MsgNickname.text('이미 존재하는 닉네임입니다.');
                nickname.css('background-color', 'rgb(255, 255, 255)');
            }
        })
}

function ck_email(){
    let email = $('#email');
    let MsgEmail = $('#MsgEmail');
    let isEmail = /([\w\-]+\@[\w\-]+\.[\w\-]+)/

    if(!isEmail.test(email.val())){
        MsgEmail.css('display', 'block');
        MsgEmail.attr('class', 'error');
        MsgEmail.text('이메일 형식을 확인하세요');
        email.css('background-color', 'rgb(255, 255, 255)');
    } else{
        MsgEmail.attr('class', 'vaild');
        MsgEmail.text('ok');
        email.css('background-color', 'rgb(232, 240, 254)');
    }
}

function ck_pwd(){
    let pwd = $('#pwd');
    let MsgPw = $('#MsgPw');
    let isPwd = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,15}$/

    if(!isPwd.test(pwd.val())){
        MsgPw.css('display', 'block');
        MsgPw.attr('class', 'error');
        MsgPw.text('영어, 숫자 포함 8자 이상');
        pwd.css('background-color', 'rgb(255, 255, 255)');
    } else{
        MsgPw.attr('class', 'vaild');
        MsgPw.text('ok');
        pwd.css('background-color', 'rgb(232, 240, 254)')
    }
}


function ck_pwd2(){
    let pwd_ck = $('#pwd_ck');
    let pwd = $('#pwd');
    let MsgPwck = $('#MsgPwck');

    if(pwd_ck.val()!==pwd.val()){
        MsgPwck.css('display', 'block');
        MsgPwck.attr('class', 'error');
        MsgPwck.text('비밀번호가 일치하지 않습니다.');
        pwd_ck.css('background-color', 'rgb(255, 255, 255)');
    } else{
        MsgPwck.attr('class', 'vaild');
        MsgPwck.text('ok');
        pwd_ck.css('background-color', 'rgb(232, 240, 254)')
    }
}


function ck_name(){
    let name = $('#name');
    let MsgName = $('#MasName');

    if(name.val().trim() === ''){
        MsgName.css('display', 'block');
        MsgName.attr('class', 'error');
        MsgName.text('2자 이상 입력하세요.');
        name.css('background-color', 'rgb(255, 255, 255)');
    } else{
        MsgName.attr('class', 'vaild');
        MsgName.text('ok');
        name.css('background-color', 'rgb(232, 240, 254)');
    }
}

function ck_birthday(){
    $('#birthday').css('background-color', 'rgb(232, 240, 254)');
}

function ck_detail_address(){
    let detail_address = $('#detail_address');
    if(detail_address.val().trim() !== ''){
        detail_address.css('background-color', 'rgb(232, 240, 254)');
    }
}

function ck_gender(){
    let man = $('#man');
    let woman = $('#woman');

    if(man.is(':checked')){
        $('#wrap_man').attr('class', 'gender_act');
        $('#wrap_woman').attr('class', 'gender');
    }

    if(woman.is(':checked')){
        $('#wrap_man').attr('class', 'gender');
        $('#wrap_woman').attr('class', 'gender_act');
    }
}

function ck_phone(){
    let phone = $('#phone');
    let MsgPhone = $('#MsgPhone');
    let isPhone = /^[A-Za-z0-9]{6,12}$/

    if(!isPhone.test(phone.val())){
        MsgPhone.css('display', 'block');
        MsgPhone.attr('class', 'error');
        MsgPhone.text('휴대폰 번호 형식을 확인하세요');
        phone.css('background-color', 'rgb(255, 255, 255)')
    }
    else{
        MsgPhone.attr('class', 'vaild');
        MsgPhone.text('ok');
        phone.css('background-color', 'rgb(232, 240, 254)');
    }
}

/*
    if(man.checked == false && woman.checked == false){
        MsgGender.style.display="block";
        MsgGender.className='error'
        MsgGender.innerHTML="필수 정보입니다."        wrap_gender.style.borderColor="red";
        return false;
    }
*/

function openZipCodeSearch() {
    new daum.Postcode({
        oncomplete: function(data) {
            let addr = ''; // 주소 변수
            let extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 우편번호와 주S소 정보를 해당 필드에 넣는다.
            let zipcode = $('#zipcode');
            let address = $('#address');

            zipcode.val(data.zonecode);
            zipcode.css('background-color', 'rgb(232, 240, 254)');
            address.val(addr);
            address.css('background-color', 'rgb(232, 240, 254)');
            // 커서를 상세주소 필드로 이동한다.
            $('#detail_address').focus();
        }
    }).open();
}

const inputs = document.querySelectorAll(".login-content .input");
inputs.forEach(input => {
    input.addEventListener("focus", addcl);
    input.addEventListener("blur", remcl);
});
$('#idInput').keydown(function (e){
    if(e.keyCode === 13){
        sendLoginRequest();
    }
})
$('#pwdInput').keydown(function (e){
    if(e.keyCode === 13){
        sendLoginRequest();
    }
})
$('#open-login-btn').click(clearLoginModal);
$('#loginBtn').click(sendLoginRequest);
$('#logout-btn').click(logoutCheck);
