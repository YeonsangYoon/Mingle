package com.sist.space;


import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.Authentication.AuthenticationService;
import com.sist.Authentication.MemberVO;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class SpaceController {
	private SpaceService service;
	private AuthenticationService authservice;
	
	@Autowired
	public SpaceController(SpaceService service, AuthenticationService authservice) {
		this.service = service;
		this.authservice = authservice;
	}

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
	
	@GetMapping("space/booking.do")
	public String space_booking(@RequestParam Map<String, Object> params, int no, Model model, HttpSession session)
	{
		String user_id=(String)session.getAttribute("id");
		/*
		 * if(user_id==null) { redirect:"login_require.do"; } else {
		 */
			MemberVO mvo=authservice.getMemberByID(user_id);
			SpaceVO svo=service.spaceBookingData(no);
			model.addAttribute("book",params);
			model.addAttribute("vo",svo);
			model.addAttribute("no",no);
			model.addAttribute("mvo",mvo);
			model.addAttribute("user_id",user_id);
/*		}*/
		return "space/booking";
	}
	
	@PostMapping("space/submitbook.do")
	public String space_submit_booking(@RequestParam Map<String, Object> params, HttpSession session)
	{
		String user_id=(String)session.getAttribute("id");
		params.put("user_id", user_id);
		service.spaceBookingSubmit(params);
		System.out.println(params.get("startsAt"));
		// 예약내역 상세보기 페이지로 갈지
		// if 아니면 마저 공간내역을 볼지
		
		return "redirect:/space/main.do";
	}
	
}
