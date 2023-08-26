$('.reply-open').click(function (){
    let ri = $(this).parent().parent().next();
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
        let ri = $(el).parent().parent().next();
        if(!ri.hasClass('d-none')){
            ri.addClass('d-none');
        }
    })
}

function openReplyEdit(t){
    let reply_info = $(t).parent().parent();
    let msg = reply_info.find('.study-reply-msg').text();
    let reply_input = reply_info.next();

    reply_info.addClass('d-none');
    reply_input.removeClass('d-none');
    reply_input.find('.study-reply-input').val(msg);
    reply_input.find('.reg').addClass('d-none');
    reply_input.find('.edit').removeClass('d-none');
    reply_input.find('.cancel').removeClass('d-none');
}

function cancelEditReply(t){
    let reply_input = $(t).parent();
    reply_input.find('.study-reply-input').val('');
    reply_input.addClass('d-none');
    reply_input.prev().removeClass('d-none');
    reply_input.find('.reg').removeClass('d-none');
    reply_input.find('.edit').addClass('d-none');
    reply_input.find('.cancel').addClass('d-none');
}

function sendReplyEditRequest(t){
    let reply_id = $(t).parent().parent().data('rid');
    let msg = $(t).prev().prev().val();

    $.post('/mingle/study/replyupdate.do',{
        reply_id : reply_id,
        msg : msg
    })
        .done(function (result){
            if(result === 'OK'){
                location.reload();
            }
            else{
                alert('댓글 수정에 실패했습니다');
            }
        })
}

function sendReplyDeleteRequest(t){
    let reply_id = $(t).parent().parent().parent().data('rid');
    console.log(reply_id)
    $.post('/mingle/study/replydelete.do',{
        reply_id : reply_id
    })
        .done(function (result){
            if(result === 'OK'){
                location.reload();
            }
            else{
                alert('댓글 삭제에 실패했습니다.');
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