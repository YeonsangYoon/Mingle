package com.sist.study;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

	@PostMapping(value = "study/replyinsert.do")
	public String insertReply(ReplyVO reply, HttpSession session){
		String user_id = (String)session.getAttribute("id");
		String nickname = (String)session.getAttribute("nickname");
		if(user_id == null){
			return "NOID";
		}

		reply.setUser_id(user_id);
		reply.setNickname(nickname);

		int result = service.insertStudyReply(reply);
		return (result == 1) ? "OK" : "NO";
	}

	@PostMapping("study/rootreplyinsert.do")
	public String insertRootReply(ReplyVO reply, HttpSession session){
		String user_id = (String)session.getAttribute("id");
		String nickname = (String)session.getAttribute("nickname");
		if(user_id == null){
			return "NOID";
		}

		reply.setUser_id(user_id);
		reply.setNickname(nickname);

		int result = service.insertStudyRootReply(reply);
		return (result == 1) ? "OK" : "NO";
	}

	@PostMapping(value = "study/replyupdate.do")
	public String updateReply(int reply_id, String msg){
		int result = service.updateReply(reply_id, msg);
		return (result == 1) ? "OK" : "NO";
	}
}
