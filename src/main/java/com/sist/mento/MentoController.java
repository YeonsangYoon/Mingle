package com.sist.mento;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MentoController {
	
	@GetMapping("mento/mento_list.do")
	public String mento_list() {
		return "mento/mento_list";
	}
	
	
	

}
