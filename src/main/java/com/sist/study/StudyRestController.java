package com.sist.study;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.study.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class StudyRestController {
	private StudyService service;
	private ObjectMapper objectMapper;
	@Autowired
	private StudyDAO dao;
	
	@Autowired
	public StudyRestController(StudyService service) {
		this.service = service;
		objectMapper = new ObjectMapper();
	}

	@RequestMapping(value = "study/list_vue.do", produces = "text/plain;charset=UTF-8")
	public String study_list(@RequestParam Map<String, Object> params) throws JsonProcessingException {
		Map<String, Object> json = service.getStudyListData(params);
		return objectMapper.writeValueAsString(json);
	}
	
	   @GetMapping(value="study/delete_ok_vue.do",produces = "text/plain;charset=UTF-8")
	   public String databoard_delete(int study_id,String pwd)
	   {
		   String result=dao.studyDelete(study_id, pwd);
		   return result;
	   }
}
