package com.sist.study;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudyDAO {

	@Autowired
	private StudyMapper mapper;
	
	// ���
	public List<StudyVO> studyListData(int start, int end)
	{
		return mapper.studyListData(start, end);
	}
	
	// �� ������
	public int studyTotalpage()
	{
		return mapper.studyTotalpage();
	}

	public List<Map<String, Object>> getTechListData(int start, int end){
		return mapper.getTechListData(start, end);
	}
	
	// �� ������
	public StudyVO studyDetailData(int study_id)
	{
		return mapper.studyDetailData(study_id);
	}
}
