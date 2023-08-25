$('.reply-open').click(function (){
    let ri = $(this).next();
    if(ri.hasClass('d-none')){ // 열기
        closeAllReply();
        ri.removeClass('d-none');
    }
    else{ // 닫기
        ri.addClass('d-none');
    }
})

function closeAllReply(){
    $('.reply-open').each(function(i, el){
        let ri = $(el).next();
        if(!ri.hasClass('d-none')){
            ri.addClass('d-none');
        }
    })
}

function registerRootReply(){
    let msg = $('#root-reply-ta');
    let study_id = $('#reply-area').data('sid');

    if(msg.val().trim() === ''){
        msg.val('');
        msg.focus();
        return;
    }

    $.post('/mingle/study/rootreplyinsert.do',{
        study_id : study_id,
        msg : msg.val().trim()
    })
        .done(function (result){
            if(result === 'OK'){
                location.reload();
            }
            else if(result === 'NOID'){
                alert('로그인 해주세요');
            }
            else{
                alert('댓글 등록에 실패했습니다');
            }
        })
}

function registerReply(t){
    let msg = $(t).prev();
    let study_id = $('#reply-area').data('sid');
    let parent_id = $(t).parent().parent().data('rid');

    if(msg.val().trim() === ''){
        msg.val('');
        msg.focus();
        return;
    }

    $.post('/mingle/study/replyinsert.do',{
        study_id : study_id,
        msg : msg.val().trim(),
        parent_id : parent_id
    })
        .done(function (result){
            if(result === 'OK'){
                location.reload();
            }
            else if(result === 'NOID'){
                alert('로그인 해주세요');
            }
            else{
                alert('댓글 등록에 실패했습니다')
            }
        })
}