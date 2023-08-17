package com.sist.space;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class SpaceRestController {
	@Autowired
	private SpaceServiceImpl service;
	
	@GetMapping(value = "space/list_vue.do", produces = "text/plain;charset=UTF-8")
	public String space_list_vue(Model model) throws Exception
	{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("start", 1);
		map.put("end", 10);
		List<SpaceVO> list=service.spaceListData(map);
		ObjectMapper mapper=new ObjectMapper();
        return mapper.writeValueAsString(list);
	}
}
