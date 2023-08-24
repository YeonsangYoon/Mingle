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

	// 삭제 페이지
	@Select("SELECT pwd FROM member WHERE study_id=#{study_id}")
	public String getPassword(int study_id);
	
	@Delete("DELETE FROM study WHERE study_id=#{study_id}")
	public void studyDelete(int study_id);

	/* 댓글 관련 */
	// 댓글 목록
	@Select("SELECT S.*, TO_CHAR(REGDATE, 'yyyy-MM-dd') AS DBDAY, (SELECT NICKNAME FROM STUDY_REPLY SR WHERE SR.STUDY_ID = S.PARENT_ID) AS PARENT_NICKNAME " +
			"FROM STUDY_REPLY S " +
			"WHERE S.STUDY_ID = #{study_id} " +
			"ORDER BY GROUP_ID DESC, STUDY_REPLY.REGDATE")
	public List<ReplyVO> getReplyList(int study_id);

	// 삽입
	@Insert("INSERT INTO STUDY_REPLY (REPLY_ID, STUDY_ID, USER_ID, NICKNAME, MSG, GROUP_ID, PARENT_ID) VALUES( " +
			"	STUDY_REPLY_SEQ.nextval, #{study_id}, #{user_id}, #{nickname}, #{msg}, #{group_id}, #{parent_id})")
	public int insertStudyReply(ReplyVO vo);

	// 수정
	@Update("UPDATE STUDY_REPLY SET " +
			"	MSG = #{msg} " +
			"WHERE REPLY_ID = #{reply_id}")
	public int updateReply(@Param("reply_id")int reply_id, @Param("msg")String msg);
}
