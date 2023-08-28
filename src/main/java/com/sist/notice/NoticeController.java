package com.sist.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class NoticeController {
    private final int PAGE_COUNT = 5;
    private NoticeService noticeService;
    @Autowired
    public NoticeController(NoticeService noticeService) {
        this.noticeService = noticeService;
    }

    @GetMapping("/notice/list.do")
    public String noticeListPage(String page, Model model){
        int curpage = 1;
        try{
            curpage = Integer.parseInt(page);
        }catch (NullPointerException | NumberFormatException e){}

        int totalpage = noticeService.getNoticeTotalPage();
        int startpage = (curpage - 1) / PAGE_COUNT * PAGE_COUNT + 1;
        int endpage = Math.min(totalpage, startpage + PAGE_COUNT - 1);
        List<NoticeVO> list = noticeService.visitNoticeListPage(curpage);

        model.addAttribute("curpage", curpage);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);
        model.addAttribute("list", list);
        return "notice/notice_list";
    }

    @GetMapping("/notice/detail.do")
    public String noticeDetailPage(int notice_id, Model model){
        NoticeVO notice = noticeService.visitNoticeDetailPage(notice_id);
        model.addAttribute("notice", notice);
        return "notice/notice_detail";
    }

    @GetMapping("/notice/write.do")
    public String noticeWritePage(HttpSession session){
        String user_id = (String)session.getAttribute("id");
        if(user_id == null || !user_id.equals("admin"))
            return "redirect:/auth/admin_require.do";
        return "notice/notice_insert";
    }

    @PostMapping("/notice/insert.do")
    public String insertNotice(NoticeVO notice, HttpSession session){
        String user_id = (String)session.getAttribute("id");
        if(user_id == null || !user_id.equals("admin"))
            return "redirect:/auth/admin_require.do";
        noticeService.insertNewNotice(notice);
        return "redirect:/notice/list.do";
    }

    @GetMapping("/notice/delete.do")
    public String deleteNotice(int notice_id, HttpSession session){
        String user_id = (String)session.getAttribute("id");
        if(user_id == null || !user_id.equals("admin"))
            return "redirect:/auth/admin_require.do";
        noticeService.deleteNotice(notice_id);
        return "redirect:/notice/list.do";
    }

    @GetMapping("/notice/edit.do")
    public String noticeEditPage(int notice_id, Model model, HttpSession session){
        String user_id = (String)session.getAttribute("id");
        if(user_id == null || !user_id.equals("admin"))
            return "redirect:/auth/admin_require.do";
        model.addAttribute("notice", noticeService.getNoticeByNoticeId(notice_id));
        return "notice/notice_edit";
    }

    @PostMapping("/notice/edit.do")
    public String editNotice(NoticeVO notice, HttpSession session){
        String user_id = (String)session.getAttribute("id");
        if(user_id == null || !user_id.equals("admin"))
            return "redirect:/auth/admin_require.do";
        noticeService.updateNotice(notice);
        return "redirect:/notice/detail.do?notice_id=" + notice.getNotice_id();
    }
}
