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
	@Insert("INSERT INTO study VALUES(" +
			"	STUDY_SEQ.nextval, " +
			"	#{title}, " +
			"	#{content}, "
	      + "	SYSDATE, " +
			"	0, " +
			"	#{deadline}, " +
			"	'O'," +
			"	#{period}, " +
			"	#{recruit}, " +
			"	#{onoff}, " +
			"	#{contact_type}, " +
			"	#{contact_link}, " +
			"	#{user_id}, " +
			"	SYSDATE) ")
	public void studyInsert(Map<String, Object> params);

	@Select("SELECT MAX(STUDY_ID) FROM STUDY")
	public int getMaxStudy_id();

	@Insert("INSERT INTO STUDY_TECH VALUES (" +
			"	#{tech}, " +
			"	#{study_id} " +
			")")
	public void studyTechInsert(@Param("study_id")int study_id, @Param("tech")String tech);

	// 스터디 삭제 관련
	@Select("SELECT USER_ID FROM STUDY WHERE STUDY_ID = #{study_id}")
	public String getUserIdByStudyId(@Param("study_id")int study_id);

	@Delete("DELETE FROM STUDY_REPLY WHERE STUDY_ID = #{study_id}")
	public void deleteStudyReplyByStudyId(@Param("study_id")int study_id);

	@Delete("DELETE FROM STUDY_FILE WHERE STUDY_ID = #{study_id}")
	public void deleteStudyFileByStudyId(@Param("study_id")int study_id);

	@Delete("DELETE FROM STUDY_LIKE WHERE STUDY_ID = #{study_id}")
	public void deleteStudyLikeByStudyId(@Param("study_id")int study_id);

	@Delete("DELETE FROM STUDY_TECH WHERE STUDY_ID = #{study_id}")
	public void deleteStudyTechByStudyId(@Param("study_id")int study_id);

	@Delete("DELETE FROM STUDY WHERE STUDY_ID = #{study_id}")
	public int deleteStudyByStudyId(@Param("study_id")int study_id);

	/* 댓글 관련 */
	// 댓글 목록
	@Select("SELECT S.*, " +
			"	TO_CHAR(S.REGDATE, 'yyyy-MM-dd HH24:MM') AS DBDAY, " +
			"	(SELECT SR.NICKNAME FROM STUDY_REPLY SR WHERE SR.REPLY_ID = S.PARENT_ID) AS PARENT_NICKNAME " +
			"FROM STUDY_REPLY S " +
			"WHERE S.STUDY_ID = #{study_id} " +
			"ORDER BY GROUP_ID, PARENT_ID, REPLY_ID	")
	public List<ReplyVO> getReplyList(int study_id);

	// 삽입
	@Insert("INSERT INTO STUDY_REPLY VALUES( " +
			"	STUDY_REPLY_SEQ.nextval, " +
			"#{study_id}, " +
			"#{user_id}, " +
			"#{nickname}, " +
			"#{msg}, " +
			"SYSDATE, " +
			"(SELECT GROUP_ID FROM STUDY_REPLY WHERE REPLY_ID = #{parent_id}), " +
			"#{parent_id}, " +
			"(SELECT DEPT FROM STUDY_REPLY WHERE REPLY_ID = #{parent_id}) + 1)")
	public int insertStudyReply(ReplyVO vo);

	@Insert("INSERT INTO STUDY_REPLY VALUES (" +
			"	STUDY_REPLY_SEQ.nextval, " +
			"#{study_id}, " +
			"#{user_id}, " +
			"#{nickname}, " +
			"#{msg}, " +
			"SYSDATE, " +
			"STUDY_REPLY_SEQ.currval, " +
			"STUDY_REPLY_SEQ.currval, " +
			"0)")
	public int insertStudyRootReply(ReplyVO vo);

	// 수정
	@Update("UPDATE STUDY_REPLY SET " +
			"	MSG = #{msg} " +
			"WHERE REPLY_ID = #{reply_id}")
	public int updateReply(@Param("reply_id")int reply_id, @Param("msg")String msg);

	// 삭제 관련
	@Select("SELECT REPLY_ID, PARENT_ID " +
			"FROM STUDY_REPLY " +
			"WHERE GROUP_ID = (SELECT GROUP_ID FROM STUDY_REPLY WHERE REPLY_ID = #{reply_id})")
	public List<ReplyVO> getReplyBySameGroup(int reply_id);
	public int deleteReplys(List<Integer> list);
}
