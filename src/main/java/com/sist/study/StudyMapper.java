package com.sist.study;

import java.util.*;

import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.GetMapping;

public interface StudyMapper {
	// 목록
	@Select("SELECT study_id,title,hit,deadline,TO_CHAR(regdate,'yyyy-MM-dd') as dbday,num " + 
			"FROM (SELECT study_id,title,hit,deadline,regdate,rownum as num " + 
			"FROM (SELECT study_id,title,hit,deadline,regdate " + 
			"FROM study ORDER BY study_id)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<StudyVO> studyListData(Map map);
	
	// 총 페이지
	@Select("SELECT CEIL(COUNT(*)/5.0) FROM study")
	public int studyTotalpage();
	
	// 상세페이지
	@Select("SELECT study_id,title,content,onoff,recruit,contact_type,contact_link,period,deadline "
			+ "FROM study "
			+ "WHERE study_id=#{study_id}")
	public StudyVO studyDetailData(int study_id);
	
}
