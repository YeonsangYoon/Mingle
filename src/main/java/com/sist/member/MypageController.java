package com.sist.member;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("mypage/")
public class MypageController {
    @GetMapping("info.do")
    public String mypage_info(Model model){
        model.addAttribute("content_jsp", "info.jsp");
        return "member/mypage";
    }

    @GetMapping("space.do")
    public String mypage_space(Model model){
        model.addAttribute("content_jsp", "space.jsp");
        return "member/mypage";
    }

    @GetMapping("study.do")
    public String mypage_study(Model model){
        model.addAttribute("content_jsp", "study.jsp");
        return "member/mypage";
    }

    @GetMapping("mento.do")
    public String mypage_mento(Model model){
        model.addAttribute("content_jsp", "mento.jsp");
        return "member/mypage";
    }
}
