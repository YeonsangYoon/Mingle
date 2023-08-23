 package com.sist.study;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class StudyController {
	@Autowired
	private StudyService service;
	
	@Autowired
	private StudyDAO dao;
	
	@GetMapping("study/list.do")
	public String study_list()
	{
		return "study/list";
	}
	
	@GetMapping("study/detail.do")
	public String study_detail(int study_id, Model model)
	{
		StudyVO vo=service.studyDetailData(study_id);
		model.addAttribute("vo", vo);
		return "study/detail";
	}
	
	@GetMapping("study/insert.do")
	public String study_insert()
	{
		return "study/insert";
	}
	
	@PostMapping("study/insert_ok.do")
	public String study_insert_ok(StudyVO vo)
	{
		dao.studyInsert(vo);
		return "redirect:../study/list.do";
	}
}
