package com.sist.space;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SpaceController {
	@Autowired
	private SpaceService service;
	
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
	public String space_booking()
	{
		return "space/booking";
	}
	
	@GetMapping("space/zzimInsert_vue.do")
	public void space_zzim_insert(int space_id, int user_id)
	{
		Map<String,Integer> map=new HashMap<>();
		map.put("space_id", space_id);
		map.put("user_id",user_id);
		service.spaceZzimInsert(map);
	}
	
	@GetMapping("space/zzimCancel_vue.do")
	public void space_zzim_cancel(int space_id, int user_id)
	{
		Map<String,Integer> map=new HashMap<>();
		map.put("space_id", space_id);
		map.put("user_id",user_id);
		service.spaceZzimCancel(map);
	}
}
