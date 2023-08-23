package com.sist.study;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.study.*;

@RestController
public class ReplyRestController {
	@Autowired
	private ReplyDAO dao;
	
	// insert, update, delete => 공통으로 사용
	public String reply_list_data(int study_id)
	{
		String json="";
		try {
			List<ReplyVO> list=dao.replyListData(study_id);
			
			ObjectMapper mapper=new ObjectMapper();
			json=mapper.writeValueAsString(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
	@GetMapping(value = "study/reply_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String reply_list(int study_id)
	{
		return reply_list_data(study_id);
	}
	
	@PostMapping(value = "study/reply_insert_vue.do",produces = "text/plain;charset=UTF-8")
	public String reply_insert(ReplyVO vo, HttpSession session)
	{
		String user_id=(String)session.getAttribute("user_id");
		String nickname=(String)session.getAttribute("nickname");
		vo.setUser_id(user_id);
		vo.setNickname(nickname);
		dao.replyInsert(vo);
		return reply_list_data(vo.getStudy_id());
	}
	
	@GetMapping(value = "study/reply_delete_vue.do",produces = "text/plain;charset=UTF-8")
	public String reply_delete(int no, int study_id)
	{
		dao.replyDelete(no);
		return reply_list_data(study_id);
	}
	
	@PostMapping(value = "study/reply_update_vue.do",produces = "text/plain;charset=UTF-8")
	public String reply_update(ReplyVO vo)
	{
		dao.replyUpdate(vo);
		return reply_list_data(vo.getStudy_id());
	}
}
