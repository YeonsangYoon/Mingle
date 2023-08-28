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

    private int convertPage(String page){
        try{
            return Integer.parseInt(page);
        } catch (NullPointerException | NumberFormatException e){
            return 1;
        }
    }

    @GetMapping("admin.do")
    public String adminPage(String page, Model model){
        model.addAttribute("curpage", convertPage(page));
        model.addAttribute("content_jsp", "member_list.jsp");
        return "admin/adminpage";
    }

    @GetMapping("mento.do")
    public String adminMentoPage(String page, Model model) {
        model.addAttribute("curpage", convertPage(page));
        model.addAttribute("content_jsp", "mento_list.jsp");
        return "admin/adminpage";
    }

    @GetMapping("booking.do")
    public String adminBookingPage(String page, Model model){
        model.addAttribute("curpage", convertPage(page));
        model.addAttribute("content_jsp", "booking_list.jsp");
        return "admin/adminpage";
    }
    @GetMapping("mentoring.do")
    public String adminMentoringPage(String page, Model model){
        model.addAttribute("curpage", convertPage(page));
        model.addAttribute("content_jsp", "mentoring_list.jsp");
        return "admin/adminpage";
    }
}
