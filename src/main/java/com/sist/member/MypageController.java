package com.sist.member;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.Authentication.AuthenticationService;
import com.sist.Authentication.MemberVO;
import com.sist.mento.MentoService;
import com.sist.mento.MentoVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("mypage/")
public class MypageController {
    private AuthenticationService authService;
    private MentoService mentoService;
    private ObjectMapper objectMapper;

    private void addIsMentor(String user_id, Model model){
        model.addAttribute("isMentor", mentoService.validateMento(user_id));
    }

    @Autowired
    public MypageController(AuthenticationService authService, MentoService mentoService){
        this.authService = authService;
        this.mentoService = mentoService;
        objectMapper = new ObjectMapper();
    }

    @GetMapping("info.do")
    public String mypage_info(Model model, HttpSession session){
        String user_id = (String)session.getAttribute("id");
        MemberVO member = authService.getMemberByID(user_id);

        addIsMentor(user_id, model);
        model.addAttribute("member", member);
        model.addAttribute("content_jsp", "info.jsp");

        return "member/mypage";
    }

    @GetMapping("space.do")
    public String mypage_space(Model model, HttpSession session){
        String user_id = (String)session.getAttribute("id");
        addIsMentor(user_id, model);
        model.addAttribute("content_jsp", "space.jsp");
        return "member/mypage";
    }

    @GetMapping("study.do")
    public String mypage_study(Model model, HttpSession session){
        String user_id = (String)session.getAttribute("id");
        addIsMentor(user_id, model);
        model.addAttribute("content_jsp", "study.jsp");
        return "member/mypage";
    }
    @GetMapping("mentoring.do")
    public String mypage_mentoring(Model model, HttpSession session){
        String user_id = (String)session.getAttribute("id");
        addIsMentor(user_id, model);
        model.addAttribute("content_jsp", "mentoring.jsp");
        return "member/mypage";
    }
    
    @GetMapping("mento_mentoring.do")
    public String mento_mentoring(Model model, HttpSession session){
        String user_id = (String)session.getAttribute("id");
        addIsMentor(user_id, model);
        model.addAttribute("content_jsp", "mento_mentoring.jsp");
        return "member/mypage";
    }

    @GetMapping("mento.do")
    public String mypage_mento(Model model, HttpSession session) throws Exception{
    	String user_id = (String)session.getAttribute("id");
        boolean isMentor = mentoService.validateMento(user_id);
    	if(!isMentor) {
    		model.addAttribute("content_jsp", "mentonull.jsp");
    		return "member/mypage";
    	}
    	MentoVO mento = mentoService.getMentoByID(user_id);
        model.addAttribute("isMentor", isMentor);
		model.addAttribute("mento",objectMapper.writeValueAsString(mento));
        model.addAttribute("content_jsp", "mento.jsp");
        return "member/mypage";
    }

    @PostMapping("editinfo.do")
    public String mypage_editinfo(String pwd, HttpSession session, Model model){
        String user_id = (String)session.getAttribute("id");
        if(!authService.isValidPassword(user_id, pwd)){
            return "redirect:/mypage/info.do";
        }

        MemberVO member = authService.getMemberByID(user_id);

        addIsMentor(user_id, model);
        model.addAttribute("member", member);
        model.addAttribute("content_jsp", "edit_info.jsp");
        return "member/mypage";
    }
}
