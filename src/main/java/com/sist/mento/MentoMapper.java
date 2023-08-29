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
			+ "mr_mentono_seq.nextval,"
			+ "#{user_id},"
			+ "#{job_cat},"
			+ "#{job},"
			+ "#{cost},"
			+ "#{title},"
			+ "#{intro},"
			+ "sysdate,"
			+ "'https://media.istockphoto.com/id/1401470512/ko/%EB%B2%A1%ED%84%B0/%EB%B8%94%EB%A3%A8-%EA%B5%90%EC%9C%A1-%EB%B0%8F-%EC%98%A8%EB%9D%BC%EC%9D%B8-%EC%88%98%EC%97%85-%EA%B0%9C%EB%85%90%EC%97%90-%EA%B3%A0%EB%A6%BD-%EB%90%9C-%ED%95%99%EA%B5%90-%EC%95%84%EC%9D%B4%EC%BD%98%EC%9C%BC%EB%A1%9C-%EB%8F%8C%EC%95%84%EA%B0%80%EB%8A%94-3d-%EB%AA%A8%EC%9D%8C.jpg?s=612x612&w=0&k=20&c=boDBwRFBK2Rb_0Z6mbWMcPB9EhfdnruvjGrr2OlVgqo=',"
			+ "0,0,0,0," //이미지, 팔로워, 별점합, 댓글수, 별점참여자수
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
	
	public List<CounselVO> MentoringListData(Map map);
	public int mentoringTotalPage(Map map);
	public List<CounselVO> mentoMentoringListData(Map map);
	public int mentomentoringTotalPage(Map map);
	
	@Update("UPDATE mento_counsel SET state = #{val} WHERE counsel_no=#{counsel_no}")
	public void counselStateChange(@Param("counsel_no")int counsel_no, @Param("val")int val);

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
