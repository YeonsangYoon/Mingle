package com.sist.study;

import java.util.*;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.study.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class StudyRestController {
	private static final int PAGE_STUDY_COUNT = 12;

	@Autowired
	private StudyService service;
	
	@RequestMapping(value = "study/list_vue.do", produces = "text/plain;charset=UTF-8")
	public String study_list(String page) throws JsonProcessingException {
		int curpage = (page==null) ? 1 : Integer.parseInt(page);
		int totalpage = service.studyTotalpage();
		List<StudyVO> list = service.studyListData((curpage-1)*PAGE_STUDY_COUNT+1, curpage*PAGE_STUDY_COUNT);

		Map<String, Object> json = new HashMap<>();
		json.put("curpage", curpage);
		json.put("totalpage", totalpage);
		json.put("list", list);

		ObjectMapper objectMapper = new ObjectMapper();
		return objectMapper.writeValueAsString(new JSONObject(json));
	}
	
	@RequestMapping(value = "study/find.do",produces = "text/plain;charset=UTF-8")
	public String study_find(String[] fs, String ss) throws Exception
	{
		// 검색한 데이터를 읽어온다(데이터베이스 연결)
		Map map=new HashMap();
		map.put("fsArr", fs);
		map.put("ss", ss);
		List<StudyVO> list=service.studyFindData(map);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}

}
