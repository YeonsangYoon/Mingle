package com.sist.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("member/")
public class MemberController {
    @GetMapping("join.do")
    public String memberJoinPage(){
        return "member/join.jsp";
    }

    @GetMapping("mypage.do")
    public String memberMyPage(){
        return "member/mypage";
    }

    @GetMapping("logout.do")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/main/main.do";
    }
}
