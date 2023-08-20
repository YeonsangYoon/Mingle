package com.sist.study;

import java.util.*;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.GetMapping;

public interface StudyMapper {
	// 목록
	@Select("SELECT *" +
			"FROM (SELECT /*+ INDEX(S PK_STUDY) */ " +
			"          ROWNUM AS NUM, S.*, TO_CHAR(S.REGDATE, 'yyyy-MM-dd') as dbday, M.NICKNAME AS nickname" +
			"      FROM STUDY S, MEMBER M " +
			"      WHERE S.USER_ID = M.USER_ID) " +
			"WHERE NUM BETWEEN #{start} AND #{end}")
	public List<StudyVO> studyListData(@Param("start")int start, @Param("end")int end);
	
	// 총 페이지
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM study")
	public int studyTotalpage();

	@Select("SELECT STUDY_ID ,TECH FROM STUDY_TECH WHERE STUDY_ID BETWEEN #{start} AND #{end}")
	public List<Map<String, Object>> getTechListData(@Param("start")int start, @Param("end")int end);
	
	// 상세페이지
	@Select("SELECT study_id,title,content,onoff,recruit,contact_type,contact_link,period,deadline "
			+ "FROM study "
			+ "WHERE study_id=#{study_id}")
	public StudyVO studyDetailData(int study_id);
	
}
