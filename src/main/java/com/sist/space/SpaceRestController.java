package com.sist.space;

import java.util.*;

import com.fasterxml.jackson.core.JsonProcessingException;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.commons.PageVO;

@RestController
public class SpaceRestController {
	private static final int SPACE_COUNT_IN_PAGE = 12;

	@Autowired
	private SpaceService service;
	
	@GetMapping(value = "space/list_vue.do", produces = "text/plain;charset=UTF-8")
	public String space_list_vue(int page, String category) throws JsonProcessingException {
		Map<String, Object> listParam=new HashMap<>();
		listParam.put("category", category);
		listParam.put("start", (page - 1) * SPACE_COUNT_IN_PAGE + 1);
		listParam.put("end", page * SPACE_COUNT_IN_PAGE);
		List<SpaceVO> list=service.spaceListByCategory(listParam);

		int totalpage = service.spaceTotalpage(category);

		ObjectMapper mapper=new ObjectMapper();
		Map<String, Object> json = new HashMap<>();
		json.put("totalpage", totalpage);
		json.put("list", list);

		return mapper.writeValueAsString(new JSONObject(json));
	}
}

/*
{
	"totalpage" : 123,
	"list" : [
	 	{
	 		space_id : 141,
	 		...
	 	},
	 	{

	 	},
	 	...
	 ]
}
 */
