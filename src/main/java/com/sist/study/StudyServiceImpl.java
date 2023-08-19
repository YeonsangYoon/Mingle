package com.sist.study;

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
	public List<StudyVO> studyListData(Map map) {
		// TODO Auto-generated method stub
		return dao.studyListData(map);
	}

	@Override
	public int studyTotalpage() {
		// TODO Auto-generated method stub
		return dao.studyTotalpage();
	}

	@Override
	public StudyVO studyDetailData(int study_id) {
		// TODO Auto-generated method stub
		return dao.studyDetailData(study_id);
	}
	
	
}
