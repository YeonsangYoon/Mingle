package com.sist.mento;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MentoController {
	
	@GetMapping("mento/mento_list.do")
	public String mento_list() {
		return "mento/mento_list";
	}
	
	@GetMapping("mento/mento_regist.do")
	public String mento_regist() {
		return "mento/mento_regist";
	}
	
	@GetMapping("mento/mento_mentoring.do")
	public String mento_info() {
		return "mento/mento_mentoring";
	}
	
	@GetMapping("mento/mento_date.do")
	public String mento_date() {
		return "mento/mento_date";
	}
	
	@GetMapping("mento/mento_contact.do")
    public String mento_contact(int mentono,Model model)
    {
	   model.addAttribute("mento_no", mentono);
	   return "mento/mento_contact";
    }
	
	
	
	
	

}
