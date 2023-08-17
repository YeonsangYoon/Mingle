package com.sist.mento;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

/*
 * MENTO_NO
USER_ID
JOB_CAT
KIND_CAT
CAREER
JOB
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
	@Select("SELECT MENTO_NO, USER_ID, JOB_CAT, KIND_CAT, CAREER,"
			+ "JOB, COST, TITLE, INTRO, REGDATE, IMAGE,FOLLOW,"
			+ " sum_star, rev_cnt, cnt_star "
			+ "FROM mento_reg")
	public List<MentoVO> MentoListData();
	
	
	public int mentoTotalPage();
	
	
	

}
