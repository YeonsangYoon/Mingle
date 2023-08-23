package com.sist.mento;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

/*
 * MENTO_NO
USER_ID
JOB_CAT
KIND_CAT
CAREER
JOB`
COST
TITLE
INTRO
REGDATE
IMAGE
FOLLOW
SUM_STAR
REV_CNT
CNT_STAR
 */
public interface MentoMapper {
	
	public List<MentoVO> MentoListData(Map map);
	
	
	//@Select("SELECT CEIL(COUNT(*)/12.0) FROM mento_reg")
	public int mentoTotalPage(Map map);
	
	@Select("SELECT MENTO_NO, USER_ID, JOB_CAT, JOB, COST, TITLE, INTRO, REGDATE, IMAGE, FOLLOW, sum_star, rev_cnt, cnt_star, career, dept "
			+ "FROM mento_reg "
			+ "WHERE mento_no=#{mento_no}")
	public MentoVO mentoDetailData(int mento_no);
	
	
	
	@Select("SELECT mento_no, intro, career FROM mento_reg ORDER BY MENTO_NO")
	public List<MentoVO> mentoEdit();
	
	@Update("UPDATE mento_reg SET INTRO = #{intro}, CAREER = #{career} WHERE mento_no=#{mento_no}")
	public void mentoEditUpdate(Map map);
	
	/* 멘토 삭제 관련 */
	@Delete("DELETE MENTO_TIME WHERE MENTO_NO = #{mento_no}")
	public void deleteMentoTimeByMentoNo(@Param("mento_no")int mento_no);

	@Delete("DELETE MENTO_COUNSEL WHERE MENTO_NO = #{mento_no}")
	public void deleteMentoCounselByMentoNo(@Param("mento_no")int mento_no);

	@Delete("DELETE MENTO_REVIEW WHERE MENTO_NO = #{mento_no}")
	public void deleteMentoReviewByMentoNo(@Param("mento_no")int mento_no);

	@Delete("DELETE MENTO_FOLLOW WHERE MENTO_NO = #{mento_no}")
	public void deleteMentoFollowByMentoNo(@Param("mento_no")int mento_no);

	@Delete("DELETE MENTO_REG WHERE MENTO_NO = #{mento_no}")
	public int deleteMentoByMentoNo(@Param("mento_no")int mento_no);
}
