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
	public List<StudyVO> studyListData(int start, int end) {
		return dao.studyListData(start, end);
	}

	@Override
	public int studyTotalpage() {
		return dao.studyTotalpage();
	}

	@Override
	public StudyVO studyDetailData(int study_id) {
		return dao.studyDetailData(study_id);
	}
	
	
}
