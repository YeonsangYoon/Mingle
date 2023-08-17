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
	public String mento_list_vue() throws Exception{
			
		List<MentoVO> list=dao.MentoListData();
		ObjectMapper obj= new ObjectMapper();
		String json = obj.writeValueAsString(list);
		
		return json;
		
	}
	
	@GetMapping(value="mento/mento_page_vue.do", produces="text/plain;charset=UTF-8")
	public String food_page(int page, String column) throws Exception{
		
		/*
		 * Map map=new HashMap(); map.put("column", column);
		 */
		
		int totalpage=dao.mentoTotalPage();
		
		final int BLOCK=9;
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
		
		System.out.println(vo.getCurpage());
		
		ObjectMapper obj=new ObjectMapper();
		String json= obj.writeValueAsString(vo);
		return json;
		
	}

}
