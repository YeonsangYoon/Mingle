package com.sist.study;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
@Service
@Primary
public class StudyServiceImpl implements StudyService{
	@Autowired
	private StudyDAO dao;

	@Override
	public List<StudyVO> studyListData(int start, int end) {
		List<StudyVO> list = dao.studyListData(start, end);

		if(!list.isEmpty()){
			int s = list.get(0).getStudy_id();
			int e = list.get(list.size()-1).getStudy_id();

			List<Map<String, Object>> tech_list = dao.getTechListData(s, e);

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

		return list;
	}

	@Override
	public List<Map<String, Object>> getTechListData(int start, int end) {
		return dao.getTechListData(start, end);
	}

	@Override
	public int studyTotalpage() {
		return dao.studyTotalpage();
	}

	@Override
	public StudyVO studyDetailData(int study_id) {
		return dao.studyDetailData(study_id);
	}
	
	@Override
	public List<StudyVO> studyFindData(Map map) {
		// TODO Auto-generated method stub
		return dao.studyFindData(map);
	}
}
