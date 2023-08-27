package com.sist.study;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class StudyController {
	@Autowired
	private StudyService service;

	@Autowired
	private StudyDAO dao;
	
	private StudyController() {};

	@GetMapping("study/list.do")
	public String study_list(Model model) {
		model.addAttribute("today", new SimpleDateFormat("yyy-MM-dd").format(new Date()));
		return "study/list";
	}

	@GetMapping("study/detail.do")
	public String study_detail(int study_id, Model model) {
		StudyVO vo = service.studyDetailData(study_id);
		List<ReplyVO> rlist = service.getReplyList(study_id);
		model.addAttribute("rlist", rlist);
		model.addAttribute("vo", vo);
		return "study/detail";
	}

	@GetMapping("study/insert.do")
	public String study_insert() {
		return "study/insert";
	}

	@PostMapping("study/insert_ok.do")
	public String study_insert_ok(@RequestParam Map<String, Object> params, @RequestParam String[] tech){
		service.insertStudy(params, tech);
		return "redirect:/study/list.do";
	}

	@GetMapping("study/delete.do")
	public String study_delete(int study_id, HttpSession session) {
		String user_id = (String)session.getAttribute("id");
		if(user_id == null){
			return "redirect:/study/detail.do?study_id=" + study_id;
		}

		int result = service.deleteStudy(study_id, user_id);
		return (result == 1) ? "redirect:/study/list.do" : "redirect:/study/detail.do?study_id="+study_id;
	}
	
	@GetMapping("study/update.do")
	public String study_update(int study_id, Model model) {
		StudyVO vo=service.studyDetailData(study_id);
		model.addAttribute("vo", vo);
		return "study/update";
	}
	
	@PostMapping("study/update_ok.do")
	public String study_update_ok(@RequestParam Map<String, Object> params, @RequestParam String[] tech) {
		service.updateStudy(params, tech);
		return "redirect:/study/detail.do?study_id=" + (Integer)params.get("study_id");
	}
}
