package com.sist.member;

import com.sist.Authentication.AuthenticationService;
import com.sist.Authentication.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("mypage/")
public class MypageController {
    private AuthenticationService authService;

    @Autowired
    public MypageController(AuthenticationService authService){
        this.authService = authService;
    }

    @GetMapping("info.do")
    public String mypage_info(HttpSession session, Model model){
        String id = (String)session.getAttribute("id");
        MemberVO member = authService.getMemberByID(id);

        model.addAttribute("member", member);
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

    @PostMapping("editinfo.do")
    public String mypage_editinfo(String pwd, HttpSession session, Model model){
        String id = (String)session.getAttribute("id");

        if(!authService.isValidPassword(id, pwd)){
            return "redirect:/mypage/info.do";
        }

        MemberVO member = authService.getMemberByID(id);

        model.addAttribute("member", member);
        model.addAttribute("content_jsp", "edit_info.jsp");
        return "member/mypage";
    }
}
