package com.sist.study;

import java.util.*;

import org.apache.ibatis.annotations.*;
import org.springframework.web.bind.annotation.GetMapping;

public interface StudyMapper {
	// 스터디 목록 검색(param : start, end, tech, searchWord, checks...)
	public List<StudyVO> getStudyListByParams(Map<String, Object> params);

	// 총페이지
	public int getTotalPageByParams(Map<String, Object> params);

	//기술 목록
	public List<Map<String, Object>> getTechListData(List<Integer> list);

	// 상세 페이지
	public StudyVO studyDetailData(int study_id);
	@Update("UPDATE STUDY SET " +
			"	HIT = HIT + 1 " +
			"WHERE STUDY_ID = #{study_id}")
	public void increaseStudyHit(int study_id);

	// 등록 페이지
	@Insert("INSERT INTO study VALUES((SELECT NVL(MAX(study_id)+1,1) FROM study),#{title},#{content},"
	      + "SYSDATE,0,#{deadline},'O',#{period},#{recruit},#{onoff},#{contact_type},#{contact_link},#{user_id},SYSDATE)")
	public void studyInsert(StudyVO vo);

}
