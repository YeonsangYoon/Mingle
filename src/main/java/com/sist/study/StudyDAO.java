package com.sist.study;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudyDAO {
	private StudyMapper mapper;
	@Autowired
	public StudyDAO(StudyMapper mapper) {
		this.mapper = mapper;
	}

	// 스터디 목록
	public List<StudyVO> getStudyListByParams(Map<String, Object> params){
		return mapper.getStudyListByParams(params);
	}

	// 총페이지
	public int getTotalPageByParams(Map<String, Object> params){
		return mapper.getTotalPageByParams(params);
	}

	// 기술 목록
	public List<Map<String, Object>> getTechListData(List<Integer> list) {
		return mapper.getTechListData(list);
	}
	
	// 상세 페이지
	public StudyVO studyDetailData(int study_id)
	{
		return mapper.studyDetailData(study_id);
	}
	public void increaseStudyHit(int study_id){
		mapper.increaseStudyHit(study_id);
	}
	
	// 등록 페이지
	public void studyInsert(StudyVO vo)
	{
		mapper.studyInsert(vo);
	}
}
