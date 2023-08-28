package com.sist.mento;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
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
	
	/* 멘토 삭제관련 스퀀스 */
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
	
	@Insert("INSERT INTO mento_reg VALUES("
			+ "(SELECT NVL(MAX(mento_no)+1,1) FROM mento_reg),"
			+ "#{user_id},"
			+ "#{job_cat},"
			+ "#{job},"
			+ "#{cost},"
			+ "#{title},"
			+ "#{intro},"
			+ "sysdate,"
			+ "null,0,0,0,0," //이미지, 팔로워, 별점합, 댓글수, 별점참여자수
			+ "#{career},"
			+ "#{dept}"
			+ ")")
	public void mentoRegist(MentoVO vo);
	
	@Select("SELECT COUNT(*) FROM mento_reg "
			+ "WHERE user_id=#{user_id}")
	public int regist_usercheck(String user_id);


	// 멘토 팔로우 관련
	@Select("SELECT COUNT(*) FROM MENTO_FOLLOW WHERE MENTO_NO = #{mento_no}")
	public int getFollowerCountByMentoNo(@Param("mento_no")int mento_no);

	@Update("UPDATE MENTO_REG SET " +
			"	FOLLOW = FOLLOW + #{val} " +
			"WHERE MENTO_NO = #{mento_no}")
	public void modifyMentoFollowerCount(@Param("mento_no")int mento_no, @Param("val")int val);

	@Insert("INSERT INTO MENTO_FOLLOW VALUES(#{user_id}, #{mento_no})")
	public void insertMentoFollow(@Param("user_id")String user_id, @Param("mento_no")int mento_no);

	@Delete("DELETE FROM MENTO_FOLLOW WHERE MENTO_NO = #{mento_no} AND USER_ID = #{user_id}")
	public void deleteMentoFollow(@Param("user_id")String user_id, @Param("mento_no")int mento_no);

	public List<Integer> getfollowCheckListByUserId(Map<String, Object> params);
	
	
	@Insert("INSERT INTO mento_counsel VALUES("
			+ "MENTO_COUNTSEL_SEQ.nextval,"
			+ "SYSDATE,"
			+ "#{user_id},"
			+ "#{mento_no},"
			+ "#{str_time},"
			+ "#{end_time},"
			+ "0, "
			+ "0, "
			+ "#{content},"
			+ "#{hope_date}"
			+ ")")
	public void mentoContact(ContactVO vo);
	
	//멘토 정보 관련
	@Select("SELECT MENTO_NO, USER_ID, JOB_CAT, JOB, COST, TITLE, INTRO, REGDATE, IMAGE, FOLLOW, sum_star, rev_cnt, cnt_star, career, dept "
			+ "FROM mento_reg "
			+ "WHERE user_id=#{id} ")
	public MentoVO getMentoByID(String id);
	
	@Update("UPDATE mento_reg SET "
			+ "job_cat = #{job_cat},"
			+ "career = #{career},"
			+ "job = #{job},"
			+ "cost = #{cost},"
			+ "title = #{title},"
			+ "intro = #{intro},"
			+ "dept = #{dept} "
			+ "WHERE user_id = #{user_id}")
	public void mentoUpdate(MentoVO vo);
	
	@Delete("DELETEFROM mento_reg WHERE mento_no = #{mento_no}")
	public void mentoDelete(int mento_no);

	// 팔로우 많은 3명 순
	@Select("SELECT A.*, ROWNUM FROM (" +
			"	SELECT " +
			"		MENTO_NO, " +
			"		MEMBER.USER_ID, " +
			"		JOB_CAT, " +
			"		JOB, " +
			"		COST, " +
			"		TITLE, " +
			"		INTRO, " +
			"		MENTO_REG.REGDATE, " +
			"		FOLLOW, " +
			"		CAREER, " +
			"		DEPT," +
			"		MEMBER.USER_NAME " +
			"	FROM MENTO_REG, MEMBER " +
			"	WHERE MENTO_REG.USER_ID = MEMBER.USER_ID " +
			"	ORDER BY FOLLOW DESC) A " +
			"WHERE 3 >= ROWNUM")
	public List<MentoVO> getMostFollowedMento();
}
