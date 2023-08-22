package com.sist.Authentication;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("auth/")
public class AuthenticationController {
    @GetMapping("logout.do")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/main/main.do";
    }

    @GetMapping("register.do")
    public String memberRegisterPage(){
        return "auth/register";
    }

    @GetMapping("login_require.do")
    public String loginRequirePage(HttpSession session){
        String id = (String)session.getAttribute("id");
        if(id != null){
            return "redirect:/main/main.do";
        }
        else{
            return "auth/login_require";
        }
    }
    @GetMapping("admin_require.do")
    public String adminRequirePage(){
        return "auth/admin_require";
    }
}
