package com.sist.member;

import com.sist.Authentication.AuthenticationService;
import com.sist.Authentication.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("mypage/")
public class MemberRestController {
    private AuthenticationService service;

    @Autowired
    public MemberRestController(AuthenticationService service) {
        this.service = service;
    }

    @PostMapping("checkPassword.do")
    public String checkPassword(String pwd, HttpSession session){
        String user_id = (String)session.getAttribute("id");
        return service.isValidPassword(user_id, pwd) ? "OK" : "NO";
    }

    @PostMapping("withdraw.do")
    public String withdrawMember(String pwd, HttpSession session){
        String user_id = (String)session.getAttribute("id");

        if(!service.isValidPassword(user_id, pwd)){
            return "NOPWD";
        }
        return "OK";
    }

    @PostMapping("edit.do")
    public String edit_info(MemberVO vo, HttpSession session){
        String user_id = (String)session.getAttribute("id");
        String nickname = (String)session.getAttribute("nickname");

        vo.setUser_id(user_id);

        if(!nickname.equals(vo.getNickname()) && service.getNicknameCount(vo.getNickname()) > 0){
            return "DUPNICKNAME";
        }
        else if(service.updateMember(vo) == 1){
            return "OK";
        }
        return "FAIL";
    }

/*
1. 스터디 삭제
    -> 파일 삭제
    -> 기술 스택 삭제
    -> 좋아요 삭제
    -> 댓글 삭제
    -> 스터디 삭제

2. 멘토 삭제
    -> 내가 멘티로서
        -> 멘토 팔로우
        -> 멘토 리뷰
        -> 신청한 상담
    -> 내가 멘토로서
        -> 멘토링 시간
        -> 멘토 리뷰
        -> 멘토 팔로우
        -> 신청된 상담
        -> 멘토 등록
3. 공간 삭제
    -> 공간 리뷰 삭제
    -> 공간 찜 삭제
    -> 공간 예약 삭제
    -> 구매 테이블
*/
}
