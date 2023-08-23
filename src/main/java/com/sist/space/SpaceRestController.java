package com.sist.space;

import java.util.*;

import com.fasterxml.jackson.core.JsonProcessingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;

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
	
	@GetMapping(value = "space/detail_vue.do", produces = "text/plain;charset=UTF-8")
	public String space_detail_vue(int space_id) throws Exception
	{
		List<SpaceVO> list=service.spaceDetailData(space_id);
		List<String> images = new ArrayList<String>();
		for(SpaceVO vo : list) {
			images.add(vo.getImages());
		}
		
		List<ReviewVO> rList=service.spaceReviewData(space_id);
		
		Map<String, Object> json = new HashMap<String, Object>();
		json.put("space_detail", list.get(0));
		json.put("images", images);
		json.put("rList", rList);
		/*
		 * {
		 *  space : {  }
		 *  images : [ ]
		 * }
		 */
		ObjectMapper mapper=new ObjectMapper();
		return mapper.writeValueAsString(json);
	}
	
	
	
}

