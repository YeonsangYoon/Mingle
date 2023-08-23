package com.sist.study;

import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.GetMapping;

public interface StudyMapper {
	// 스터디 목록 검색(param : start, end, tech, searchWord, checks...)
	public List<StudyVO> getStudyListByParams(Map<String, Object> params);

	@Select("<script> " +
			"	SELECT CEIL(COUNT(*)/12.0) FROM STUDY " +
			"	<where> " +
			"		<if test=\"tech != ''\"> " +
			"			STUDY_ID IN (SELECT STUDY_ID FROM STUDY_TECH WHERE TECH = #{tech}) " +
			"		</if> " +
			"		<if test=\"searchWord != ''\"> " +
			"		AND TITLE LIKE '%'||#{searchWord}||'%' " +
			"		</if> " +
			"	</where> " +
			"</script>")
	public int getTotalPageByParams(Map<String, Object> params);

	//기술 목록
//	@Select("<script>" +
//			"	SELECT STUDY_ID, TECH " +
//			"	FROM STUDY_TECH " +
//			"	WHERE STUDY_ID IN " +
//			"	<foreach item=\"item\" collection=\"list\" open=\"(\" separator=\",\" close=\")\">" +
//			"	#{item}" +
//			"	</foreach>" +
//			"</script>")
	public List<Map<String, Object>> getTechListData(List<Integer> list);

	// 상세 페이지
	@Select("SELECT study_id,title,content,onoff,recruit,contact_type,contact_link,period,deadline "
			+ "FROM study "
			+ "WHERE study_id=#{study_id}")
	public StudyVO studyDetailData(int study_id);

	// 등록 페이지
	@Insert("INSERT INTO study VALUES((SELECT NVL(MAX(study_id)+1,1) FROM study),#{title},#{content},"
	      + "SYSDATE,0,#{deadline},'O',#{period},#{recruit},#{onoff},#{contact_type},#{contact_link},#{user_id},SYSDATE)")
	public void studyInsert(StudyVO vo);

}
