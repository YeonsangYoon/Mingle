package com.sist.study;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudyDAO {

	@Autowired
	private StudyMapper mapper;
	
	// 스터디 목록
	public List<StudyVO> studyListData(int start, int end)
	{
		return mapper.studyListData(start, end);
	}
	
	// 총 페이지
	public int studyTotalpage()
	{
		return mapper.studyTotalpage();
	}

	// 기술 목록
	public List<Map<String, Object>> getTechListData(int start, int end)
	{
		return mapper.getTechListData(start, end);
	}
	
	// 상세 페이지
	public StudyVO studyDetailData(int study_id)
	{
		return mapper.studyDetailData(study_id);
	}
	
	// 등록 페이지
	public void studyInsert(StudyVO vo)
	{
		mapper.studyInsert(vo);
	}
	
	// 검색 페이지
	public List<StudyVO> studyFindData(Map map)
	{
		return mapper.studyFindData(map);
	}
}
