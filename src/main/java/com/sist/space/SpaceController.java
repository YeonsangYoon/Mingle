package com.sist.space;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SpaceController {
	@GetMapping("space/main.do")
	public String space_main()
	{
		return "space/list";
	}
	
	
	@GetMapping("space/detail.do")
	public String space_detail()
	{
		return "space/detail";
	}
}