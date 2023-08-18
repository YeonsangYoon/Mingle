package com.sist.study;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudyDAO {

	@Autowired
	private StudyMapper mapper;
	
	// 목록
	public List<StudyVO> studyListData(Map map)
	{
		return mapper.studyListData(map);
	}
	
	// 총 페이지
	public int studyTotalpage()
	{
		return mapper.studyTotalpage();
	}
}
