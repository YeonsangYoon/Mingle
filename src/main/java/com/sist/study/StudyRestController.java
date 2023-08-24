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
	public StudyRestController(StudyService service) {
		this.service = service;
		objectMapper = new ObjectMapper();
	}

	@RequestMapping(value = "study/list_vue.do", produces = "text/plain;charset=UTF-8")
	public String study_list(@RequestParam Map<String, Object> params) throws JsonProcessingException {
		Map<String, Object> json = service.getStudyListData(params);
		return objectMapper.writeValueAsString(json);
	}

	@PostMapping(value = "study/replyinsert.do", produces = "application/json;charset=UTF-8")
	public String insertReply(ReplyVO reply){
		int result = service.insertStudyReply(reply);
		return (result == 1) ? "OK" : "NO";
	}

	@PostMapping(value = "study/replyupdate.do", produces = "application/json;charset=UTF-8")
	public String updateReply(int reply_id, String msg){
		int result = service.updateReply(reply_id, msg);
		return (result == 1) ? "OK" : "NO";
	}
}
