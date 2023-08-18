 package com.sist.study;

import org.springframework.stereotype.Controller;
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
}
