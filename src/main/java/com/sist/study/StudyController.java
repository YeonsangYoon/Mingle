 package com.sist.study;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StudyController {

	@GetMapping("study/list.do")
	public String study_list()
	{
		return "study/list";
	}
	
	@GetMapping("study/insert.do")
	public String study_insert()
	{
		return "study/insert";
	}
	
	@GetMapping("study/detail.do")
	public String study_detail(int study_id, Model model)
	{
		model.addAttribute("study_id", study_id);
		return "study/detail";
	}
}
