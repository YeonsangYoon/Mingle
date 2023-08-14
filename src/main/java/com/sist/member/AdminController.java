package com.sist.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller("admin/")
public class AdminController {
    @GetMapping("admin.do")
    public String adminPage(){
        return "member/adminpage";
    }
}
