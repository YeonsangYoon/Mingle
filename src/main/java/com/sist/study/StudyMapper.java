package com.sist.study;

import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.GetMapping;

public interface StudyMapper {
	// 스터디 목록
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

	// 기술 목록
	@Select("SELECT STUDY_ID ,TECH FROM STUDY_TECH WHERE STUDY_ID BETWEEN #{start} AND #{end}")
	public List<Map<String, Object>> getTechListData(@Param("start")int start, @Param("end")int end);
	
	// 상세 페이지
	@Select("SELECT study_id,title,content,onoff,recruit,contact_type,contact_link,period,deadline "
			+ "FROM study "
			+ "WHERE study_id=#{study_id}")
	public StudyVO studyDetailData(int study_id);
	/*
	 * STUDY_IDd
TITLEd
CONTENTd
REGDATEd
HITd
DEADLINEd
ISCLOSEDd
PERIODd
RECRUIT d
ONOFFd
CONTACT_TYPEd
CONTACT_LINKd
USER_IDd
MODIFYDATEd
	 */
	// 등록 페이지
	@Insert("INSERT INTO study VALUES((SELECT NVL(MAX(study_id)+1,1) FROM study),#{title},#{content},"
	      + "SYSDATE,0,#{deadline},'O',#{period},#{recruit},#{onoff},#{contact_type},#{contact_link},#{user_id},SYSDATE)")
	public void studyInsert(StudyVO vo);
	
	// 다중검색 (동적쿼리)
	@Select({
		"<script>"
		+ "SELECT study_id,title,nickname,TO_CHAR(regdate,'YYYY-MM-DD') as dbday "
		+ "FROM study"
		+ "WHERE "
		+ "<trim prefixOverrides=\"OR\">"
			+ "<foreach collection=\"fsArr\" item=\"fd\">"
				+ "<trim prefix=\"OR\">"
					+ "<choose>"
						+ "<when test=\"fd=='N'.toString()\">"
						+ "nickname LIKE '%'||#{ss}||'%'"
						+ "</when>"
						+ "<when test=\"fd=='T'.toString()\">"
						+ "title LIKE '%'||#{ss}||'%'"
						+ "</when>"
						+ "<when test=\"fd=='C'.toString()\">"
						+ "content LIKE '%'||#{ss}||'%'"
						+ "</when>"
					+ "</choose>"
				+ "</trim>"
			+ "</foreach>"
		+ "</trim>"
		+ "</script>"
	})
	public List<StudyVO> studyFindData(Map map);
}
