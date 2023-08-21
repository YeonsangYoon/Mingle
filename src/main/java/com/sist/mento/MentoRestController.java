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
		 * addr=addr.substring(0,addr.indexOf("지번"));
		 * vo.setAddress(addr.trim());
		 */
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		
		return json;
		
	}
	
	//문자 제거
	@GetMapping(value="mento/mento_edit_data.do", produces="text/plain;charset=UTF-8")
	public String mento_edit_data() throws Exception{
		List<MentoVO> list=dao.mentoEdit();
		
		for(MentoVO vo:list) {
			Map map=new HashMap();
			
			String intro=vo.getIntro().replaceAll("(<p>)", "");
			intro=intro.replaceAll("(</p>)", "");
			intro=intro.replaceAll("(<br>)", "");
			
			String career=vo.getCareer().replaceAll("(<p>)", "");
			career=career.replaceAll("(</p>)", "");
			career=career.replaceAll("(<br>)", "");
			
			int mento_no=vo.getMento_no();
			
			System.out.println(vo.getMento_no());
			System.out.println(intro);
			
			System.out.println("---------------");
			map.put("intro", intro);
			map.put("mento_no", mento_no);
			map.put("career", career);
			
			dao.mentoEditUpdate(map);
			System.out.println("---------------");
			
		}
		/*
		 * 
		 * mentoEdit:function(){
				axios.get("http://localhost/mingle/mento/mento_edit_data.do",{
    				params:{
    				
    				}
    			}).then(response=>{
    				console.log(response.data)
    			})
			}
		 */
		
		ObjectMapper mapper=new ObjectMapper();
		
		return "편집 종료";
		
	}
	
	

}
