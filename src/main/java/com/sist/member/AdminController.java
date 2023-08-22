package com.sist.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/")
public class AdminController {
    private MemberService service;

    @Autowired
    public AdminController(MemberService service) {
        this.service = service;
    }

    @GetMapping("admin.do")
    public String adminPage(String page, Model model){
        try{
            model.addAttribute("curpage", Integer.parseInt(page));
        } catch(NullPointerException | NumberFormatException e){
            model.addAttribute("curpage", 1);
        }
        model.addAttribute("content_jsp", "member_list.jsp");
        return "admin/adminpage";
    }

    @GetMapping("mento.do")
    public String adminMentoPage(String page, Model model){
        try{
            model.addAttribute("curpage", Integer.parseInt(page));
        } catch (NullPointerException | NumberFormatException e){
            model.addAttribute("curpage", 1);
        }
        model.addAttribute("content_jsp", "mento_list.jsp");
        return "admin/adminpage";
    }
}
