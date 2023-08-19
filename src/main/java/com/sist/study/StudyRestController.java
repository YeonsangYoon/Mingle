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

	@Autowired
	private StudyService service;
	
	@RequestMapping(value = "study/list_vue.do", produces = "text/plain;charset=UTF-8")
	public String study_list(int page)
	{
		JSONObject retval=new JSONObject();
		JSONArray arr=new JSONArray();
		
		int curpage=page;
		int totalpage=service.studyTotalpage();
		
		final int BLOCK=5;
		int startpage=((curpage-1)/BLOCK*BLOCK)+1;
		int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endpage>totalpage)
			endpage=totalpage;
		
		try {
			Map map=new HashMap();
			map.put("start", (curpage*12)-11);
			map.put("end", curpage*12);
			
			List<StudyVO> list=service.studyListData(map);
			for(StudyVO vo:list)
			{
				Map<String, Object> mvo=new HashMap<String, Object>();
				  mvo.put("title", vo.getTitle());
				  mvo.put("deadline", vo.getDeadline());
				  mvo.put("hit", vo.getHit());
				
				JSONObject obj=new JSONObject(mvo);
				arr.add(obj);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		retval.put("list", arr);
		retval.put("curpage", curpage);
		retval.put("totalpage", totalpage);
		retval.put("startpage", startpage);
		retval.put("endpage", endpage);
		
		return retval.toJSONString();
	}
	
	@GetMapping(value = "study/study_detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String study_detail(int study_id) throws Exception
	{
		StudyVO vo=service.studyDetailData(study_id);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}

}
