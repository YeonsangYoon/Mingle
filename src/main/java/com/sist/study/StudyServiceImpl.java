package com.sist.study;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
@Service
@Primary
public class StudyServiceImpl implements StudyService{
	private final int PAGE_DATA_COUNT = 12;

	@Autowired
	private StudyDAO dao;


	public void setParameterValid(Map<String, Object> params){
		// page
		if(!params.containsKey("page")){
			params.put("page", 1);
		}
		else{
			int page = Integer.parseInt((String)params.get("page"));
			params.put("page", page);
		}
		int page = (Integer)params.get("page");
		params.put("start", (page - 1) * PAGE_DATA_COUNT);
		params.put("end", page * PAGE_DATA_COUNT);
		// tech
		if(!params.containsKey("tech")){
			params.put("tech", "");
		}
		// searchWord
		if(!params.containsKey("searchWord")){
			params.put("searchWord", "");
		}
		//wCheck
		if(!params.containsKey("wCheck")){
			params.put("wCheck", false);
		}
		else{
			boolean wCheck = Boolean.parseBoolean((String)params.get("wCheck"));
			params.put("wCheck", wCheck);
		}
		//tCheck
		if(!params.containsKey("tCheck")){
			params.put("tCheck", false);
		}
		else{
			boolean tCheck = Boolean.parseBoolean((String)params.get("tCheck"));
			params.put("tCheck", tCheck);
		}
		//cCheck
		if(!params.containsKey("cCheck")){
			params.put("cCheck", false);
		}
		else{
			boolean cCheck = Boolean.parseBoolean((String)params.get("cCheck"));
			params.put("cCheck", cCheck);
		}
	}

	@Override
	public Map<String, Object> getStudyListData(Map<String, Object> params) {
		setParameterValid(params);

		int totalpage = dao.getTotalPageByParams(params);
		List<StudyVO> list = dao.getStudyListByParams(params);

		if(!list.isEmpty()){
			List<Integer> idList = new ArrayList<>();
			for(StudyVO vo : list){
				idList.add(vo.getStudy_id());
			}
			List<Map<String, Object>> tech_list = getTechListData(idList);

			for(StudyVO vo : list){
				vo.setTechs(new ArrayList<>());

				for(Map<String, Object> tech : tech_list){
					int study_id = ((BigDecimal)tech.get("STUDY_ID")).intValue();
					String tech_name = (String)tech.get("TECH");

					if(study_id == vo.getStudy_id()){
						vo.getTechs().add(tech_name);
					}
				}
			}
		}

		Map<String, Object> ret = new HashMap<>();
		ret.put("totalpage", totalpage);
		ret.put("list", list);
		return ret;
	}

	@Override
	public List<Map<String, Object>> getTechListData(List<Integer> list) {
		return dao.getTechListData(list);
	}

	@Override
	public StudyVO studyDetailData(int study_id) {
		return dao.studyDetailData(study_id);
	}
}
