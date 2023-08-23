package com.sist.study;

import java.util.*;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.study.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class StudyRestController {
	private static final int PAGE_STUDY_COUNT = 12;

	@Autowired
	private StudyService service;
	
	@RequestMapping(value = "study/list_vue.do", produces = "text/plain;charset=UTF-8")
	public String study_list(@RequestParam Map<String, Object> params) throws JsonProcessingException {
		int curpage = 1;
		int totalpage = service.studyTotalpage();
		List<StudyVO> list = service.studyListData((curpage-1)*PAGE_STUDY_COUNT+1, curpage*PAGE_STUDY_COUNT);

		Map<String, Object> json = new HashMap<>();
		json.put("curpage", curpage);
		json.put("totalpage", totalpage);
		json.put("list", list);

		ObjectMapper objectMapper = new ObjectMapper();
		return objectMapper.writeValueAsString(new JSONObject(json));
	}
}
