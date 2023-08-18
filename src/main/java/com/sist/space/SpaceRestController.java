package com.sist.space;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.commons.PageVO;

@RestController
public class SpaceRestController {
	@Autowired
	private SpaceServiceImpl service;
	
	@GetMapping(value = "space/list_vue.do", produces = "text/plain;charset=UTF-8")
	public String space_list_vue(int page) throws Exception
	{
		Map map=new HashMap();
		int rowSize=12;
		int start=(page-1)*rowSize+1;
		int end=page*rowSize;
		map.put("start", start);
		map.put("end", end);
		List<SpaceVO> list=service.spaceListData(map);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	
	@GetMapping(value = "space/list_pagination_vue.do", produces = "text/plain;charset=UTF-8")
	public String space_pagination(int page) throws Exception{
		
		int totalpage=service.spaceTotalpage();
		
		final int BLOCK=10;
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		
		PageVO vo=new PageVO();
		vo.setTotalpage(totalpage);
		vo.setCurpage(page);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	
}
