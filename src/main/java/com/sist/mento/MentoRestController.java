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

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@RestController
public class MentoRestController {
	private MentoService service;

	@Autowired
	public MentoRestController(MentoService service) {
		this.service = service;
	}

	@GetMapping(value = "mento/mento_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String mento_list_vue(int page, String column, String fd, HttpSession session, HttpServletRequest request, HttpServletResponse reponse) throws Exception{
		
		
		Cookie[] cookies=request.getCookies();
	      List<MentoVO> ckList=new ArrayList<MentoVO>();
	      if(cookies!=null) {
	         for(int i=cookies.length-1;i>=0;i--) {
	            String key=cookies[i].getName();
	            if(key.startsWith("mento_")) {
	               String data=cookies[i].getValue();
	               MentoVO vo=new MentoVO();
	               vo=service.mentoDetailData(Integer.parseInt(data));
	               ckList.add(vo);
	               if(ckList.size()==2) {
	                  break;
	               }
	            }
	         }
	      }
		
	      
		String user_id = (String)session.getAttribute("id");
		List<MentoVO> list=service.MentoListData(page, column, fd, user_id);
		ObjectMapper obj= new ObjectMapper();
		
		Map map = new HashMap();
		map.put("ckList", ckList);
		map.put("list", list);
		
		return obj.writeValueAsString(map);
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
	public String mento_detail(int mento_no, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
	      Cookie[] cookies=request.getCookies();
	      if(cookies!=null) {
	         for(int i=cookies.length-1;i>=0;i--) {
	            String key=cookies[i].getName();
	            if(key.equals("mento_"+mento_no)) {
	               cookies[i].setMaxAge(0); // 쿠키를 삭제하기 위해 만료시간을 0으로 설정
	                   cookies[i].setPath("/");
	                   response.addCookie(cookies[i]);
	                   break;
	            }
	         }
	      }
	      
	      Cookie cookie=new Cookie("mento_"+mento_no, String.valueOf(mento_no));
	      cookie.setPath("/");
	      cookie.setMaxAge(60*60*24);
	      response.addCookie(cookie);

		
		
		MentoVO vo=service.mentoDetailData(mento_no);
		List<ReviewVO> list=service.getReviewByMentoNo(mento_no);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("vo", vo);
		map.put("list", list);
		ObjectMapper mapper=new ObjectMapper();
		
		return mapper.writeValueAsString(map);
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
	public String mentoContact(ContactVO vo, HttpSession session) throws Exception{
		String user_id = (String)session.getAttribute("id");
		if(user_id == null){
			return "NOID";
		}
		vo.setUser_id(user_id);
		service.mentoContact(vo);
		return "OK";
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
	
	//멘토 수정 및 삭제 
	@PostMapping(value = "mento/update_mento.do", produces = "application/json;charset=UTF-8")
	public String mentoUpdate(MentoVO vo, HttpSession session){
		String user_id = (String)session.getAttribute("id");
		vo.setUser_id(user_id);
		service.mentoUpdate(vo);
		return "Update 완료";
	}
	
	@PostMapping(value = "mento/delete_mento.do", produces = "application/json;charset=UTF-8")
	public String mentoDelete(int mento_no){
		service.mentoDelete(mento_no);
		return "Delete 완료";
	}
	
	// 멘토링 리스트 관련
	@GetMapping(value = "mento/mentoring_list.do", produces = "text/plain;charset=UTF-8")
	public String mentoring_list_vue(int page, String column, HttpSession session) throws Exception{
		
		String user_id = (String)session.getAttribute("id");
		List<CounselVO> list=service.MentoringListData(page, column, user_id);
		ObjectMapper obj= new ObjectMapper();
		return obj.writeValueAsString(list);
	}
	
	@GetMapping(value="mento/mentoring_page_vue.do", produces="text/plain;charset=UTF-8")
	public String mentoring_page(int page, String column, HttpSession session) throws Exception{
		
		String user_id = (String)session.getAttribute("id");
		
		Map map=new HashMap();
		map.put("column", column);
		map.put("user_id", user_id);
		
		int totalpage=service.mentoringTotalPage(map);
		
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
	
	@GetMapping(value = "mento/mento_mentoring_list.do", produces = "text/plain;charset=UTF-8")
	public String mento_mentoring_list_vue(int page, String column, int mento_no) throws Exception{
		
		List<CounselVO> list=service.mentoMentoringListData(page, column, mento_no);
		ObjectMapper obj= new ObjectMapper();
		return obj.writeValueAsString(list);
	}
	
	@GetMapping(value="mento/mento_mentoring_page_vue.do", produces="text/plain;charset=UTF-8")
	public String mento_mentoring_page(int page, String column, int mento_no) throws Exception{
		
		
		Map map=new HashMap();
		map.put("column", column);
		map.put("mento_no", mento_no);
		
		int totalpage=service.mentomentoringTotalPage(map);
		
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
	
	@GetMapping(value = "mento/stateChange.do", produces = "text/plain;charset=UTF-8")
	public String counselStateChange(int counsel_no, int val){
		service.counselStateChange(counsel_no, val);
		return "반영 완료!";
	}
}
