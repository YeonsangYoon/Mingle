package com.sist.mento;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.commons.*;



@RestController
public class MentoRestController {
	@Autowired
	private MentoDAO dao;
	
	@GetMapping(value = "mento/mento_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String mento_list_vue(int page, String column, String fd) throws Exception{
		
		int rowSize=12;
		int start=(rowSize*page)-(rowSize-1);
		int end=rowSize*page;
		
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("column", column);
		map.put("fd", fd);
		
		List<MentoVO> list=dao.MentoListData(map);
		
		for(MentoVO vo:list) {
			double star = ((double)vo.getSum_star()/vo.getCnt_star());
			vo.setAvg_star(star);
		}
		ObjectMapper obj= new ObjectMapper();
		String json = obj.writeValueAsString(list);
		
		return json;
		
	}
	
	@GetMapping(value="mento/mento_page_vue.do", produces="text/plain;charset=UTF-8")
	public String mento_page(int page, String column, String fd) throws Exception{
		
		Map map=new HashMap();
		map.put("column", column);
		map.put("fd", fd);
		
		int totalpage=dao.mentoTotalPage(map);
		
		final int BLOCK=5;
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalpage) {
			endPage=totalpage;
		}
		
		PageVO vo=new PageVO();
		vo.setCurpage(page);
		vo.setTotalpage(totalpage);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		
		ObjectMapper obj=new ObjectMapper();
		String json= obj.writeValueAsString(vo);
		return json;
		
	}
		
	@GetMapping(value="mento/mento_detail_vue.do", produces="text/plain;charset=UTF-8")
	public String mento_detail(int mento_no) throws Exception{
		MentoVO vo=dao.mentoDetailData(mento_no);
		
		/*
		 * String addr=vo.getAddress(); 
		 * addr=addr.substring(0,addr.indexOf("Áö¹ø"));
		 * vo.setAddress(addr.trim());
		 */
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		
		return json;
		
	}

}
