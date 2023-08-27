package com.sist.mento;

import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.commons.*;

import javax.servlet.http.HttpSession;


@RestController
public class MentoRestController {
	private MentoService service;

	@Autowired
	public MentoRestController(MentoService service) {
		this.service = service;
	}

	@GetMapping(value = "mento/mento_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String mento_list_vue(int page, String column, String fd, HttpSession session) throws Exception{
		String user_id = (String)session.getAttribute("id");
		List<MentoVO> list=service.MentoListData(page, column, fd, user_id);
		ObjectMapper obj= new ObjectMapper();
		return obj.writeValueAsString(list);
	}
	
	@GetMapping(value="mento/mento_page_vue.do", produces="text/plain;charset=UTF-8")
	public String mento_page(int page, String column, String fd) throws Exception{
		
		Map map=new HashMap();
		map.put("column", column);
		map.put("fd", fd);
		
		int totalpage=service.mentoTotalPage(map);
		
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
		MentoVO vo=service.mentoDetailData(mento_no);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		
		return json;
		
	}
	
	@PostMapping(value="mento/regist_ok_vue.do",produces = "text/plain;charset=UTF-8")
	public String mento_regist(MentoVO vo) throws Exception{
		   service.mentoRegist(vo);
		   
		   String result="등록 성공!";
		   return result;
	}
	
	@PostMapping(value="member/regist_usercheck.do",produces = "text/plain;charset=UTF-8")
	public String regist_usercheck(String user_id) throws Exception{
		String result="";
		int count=service.regist_usercheck(user_id);
		
		if(count!=0) {
			result="no";
		}else {
			result=user_id;
		}
		
		return result;
		
	}
	
	@PostMapping(value="mento/contact_ok.do",produces = "text/plain;charset=UTF-8")
	public void mentoContact(ContactVO vo) throws Exception{
		service.mentoContact(vo);
		
	}
	
	
	
	
	
	//태그 편집
	@GetMapping(value="mento/mento_edit_data.do", produces="text/plain;charset=UTF-8")
	public String mento_edit_data() throws Exception{
		List<MentoVO> list=service.mentoEdit();
		
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
			
			service.mentoEditUpdate(map);
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
		
		return "占쏙옙占쏙옙 占쏙옙占쏙옙";
		
	}
	
	
	// 멘토 팔로우 관련
	@PostMapping("mento/follow.do")
	public String followMentor(int mento_no, boolean isFollowed, HttpSession session){
		String user_id = (String) session.getAttribute("id");
		if(user_id == null)
			return "NOID";

		int followCount;
		if(!isFollowed)
			followCount = service.followMentor(mento_no, user_id);
		else
			followCount = service.unFollowMentor(mento_no, user_id);

		return String.valueOf(followCount);
	}
}
