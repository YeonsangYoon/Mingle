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

// 회원정보 수정 요청
function editProfileRequest(){
    let pwd = $('#edit-profile-modal input[type=password]');

    if(pwd.val().trim() === ''){
        pwd.focus();
        return;
    }

    $.post('/mingle/mypage/checkPassword.do',{
        pwd : pwd.val()
    }, 'text')
        .done(function (result){
            if(result === 'OK'){
                alert('회원정보 수정 동작 수행');
            }
            else{
                alert('잘못된 비밀번호 입니다');
            }
        })
        .fail(function (){
            alert('비밀번호 확인에 실패했습니다');
        })
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
                alert('회원 탈퇴 동작 수행');
            }
            else{
                alert('잘못된 비밀번호 입니다');
            }
        })
        .fail(function (){
            alert('비밀번호 확인에 실패했습니다');
        })
}