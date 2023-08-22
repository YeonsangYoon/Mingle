$('#logout-btn1').click(logoutCheck1);
function logoutCheck1(){ // 로그아웃 확인
    if(confirm('정말 로그아웃 하시겠습니까?')){
        location.href="/mingle/auth/logout.do";
    }
}