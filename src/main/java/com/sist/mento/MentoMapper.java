package com.sist.mento;

import java.util.List;
import java.util.Map;

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
	
	
	
	
	

}
