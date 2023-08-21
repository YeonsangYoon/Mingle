// 마이페이지 list, grid 전환
$('.grid').click(function (){
    $('.list').removeClass('active');
    $('.grid').addClass('active');
    let product_area = $('.products-area-wrapper');
    product_area.addClass('gridView');
    product_area.removeClass('tableView');
})
$('.list').click(function (){
    $('.list').addClass('active');
    $('.grid').removeClass('active');
    let product_area = $('.products-area-wrapper');
    product_area.removeClass('gridView');
    product_area.addClass('tableView');
})

// 회원정보 수정 페이지로 이동
function editInfoPage(){
    let pwd = $('#edit-profile-modal input[type=password]');

    if(pwd.val().trim() === ''){
        pwd.focus();
        return;
    }

    $.post('/mingle/mypage/checkPassword.do',{
        pwd : pwd.val(),
    }, 'text')
        .done(function (result){
            if(result === 'OK'){
                let input = $('<input type="hidden" name="pwd">')
                input.val(pwd.val());
                let form = $('<form>',{
                    method:'post',
                    action:'/mingle/mypage/editinfo.do',
                    html:input
                }).appendTo('body');
                form.submit();
            }
            else{
                alert('잘못된 비밀번호 입니다');
            }
        })
        .fail(function (){
            alert('비밀번호 확인에 실패했습니다');
        })
}

function editInfoRequest(){
    let user_name = $('#edit-user-name');
    let nickname = $('#edit-nickname');
    let phone = $('#edit-phone');
    let email = $('#edit-email');
    let birthday = $('#edit-birthday');
    let address = $('#edit-address');
    let detail_address = $('#edit-detail-address');

    let phone_reg = /^[A-Za-z0-9]{6,12}$/;
    let email_reg = /([\w\-]+\@[\w\-]+\.[\w\-]+)/;

    $('.edit-info-content input').each(function (index, el){
        if($(el).val().trim() === ''){
            $(el).focus();
            alert('모든 정보를 입력해주세요');
            return false;
        }
    })

    if(!phone_reg.test(phone.val())){
        phone.val('');
        phone.focus();
        alert('전화번호 형식을 확인하세요');
        return false;
    }
    if(!email_reg.test(email.val())){
        email.val('');
        email.focus();
        alert('이메일 형식을 확인하세요');
        return false;
    }

    $.post('/mingle/mypage/edit.do',{
        user_name : user_name.val(),
        nickname : nickname.val(),
        gender : $('input[name=gender]:checked').val(),
        phone : phone.val(),
        email : email.val(),
        birthday : birthday.val(),
        address : address.val(),
        detail_address : detail_address.val()
    })
        .done(function(result){
            if(result==='OK'){
                alert('회원정보가 수정되었습니다.');
                location.href = '/mingle/mypage/info.do';
            }
            else if(result==='DUPNICKNAME'){
                alert('닉네임이 중복되었습니다.');
            }
            else{
                alert('회원정보 수정에 실패했습니다')
            }
        })
}

function openAddressSearch(){
    new daum.Postcode({
        oncomplete: function(data) {
            let addr = ''; // 주소 변수-
            let extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                addr = addr + ' ' + extraAddr;
            }

            // 우편번호와 주S소 정보를 해당 필드에 넣는다.
            $('#edit-address').val(addr);
            // 커서를 상세주소 필드로 이동한다.
            $('#detail_address').focus();
        }
    }).open();
}

function withdrawMemberRequest(){
    let pwd = $('#withdraw-modal input[type=password]');

    if(pwd.val().trim() === ''){
        pwd.focus();
        return;
    }
    $.post('/mingle/mypage/checkPassword.do',{
        pwd : pwd.val()
    }, 'text')
        .done(function (result){
            if(result === 'OK'){
                $.post('/mingle/auth/withdraw.do',{
                    pwd : pwd.val()
                })
                    .done(function (res){
                        if(res === 'OK'){
                            alert('회원탈퇴 완료');
                            location.href = '/mingle/main/main.do';
                        }
                        else if(res === 'NOPWD'){
                            alert('잘못된 비밀번호입니다');
                        }
                        else{
                            alert('회원가입 실패');
                        }
                    })
            }
            else if(result === 'NOPWD'){
                alert('잘못된 비밀번호입니다');
            }
        })
        .fail(function (){
            alert('비밀번호 확인에 실패했습니다');
        })
}

$('#pwd-edit').keydown(function(e){
    if(e.keyCode === 13){
        editInfoPage();
    }
})
$('#pwd-withdraw').keydown(function(e){
    if(e.keyCode === 13){
        withdrawMemberRequest();
    }
})

$('.login-content form').on('submit', function(event) {
    event.preventDefault(); // 폼 제출 방지
});

$('#edit-profile-button').click(function(){
    $('#edit-profile-modal input[type=password]').val('');
})
$('#withdraw-button').click(function (){
    $('#withdraw-modal input[type=password]').val('');
})