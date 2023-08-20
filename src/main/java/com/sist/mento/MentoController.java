package com.sist.mento;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MentoController {
	
	@GetMapping("mento/mento_list.do")
	public String mento_list() {
		return "mento/mento_list";
	}
	
	@GetMapping("mento/mento_contact.do")
	public String mento_contact() {
		return "mento/mento_contact";
	}
	
	@GetMapping("mento/mento_regist.do")
	public String mento_regist() {
		return "mento/mento_regist";
	}
	
	@GetMapping("mento/mento_info.do")
	public String mento_info() {
		return "mento/mento_info";
	}
	
	
	
	
	

}
