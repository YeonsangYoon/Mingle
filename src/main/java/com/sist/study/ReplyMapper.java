package com.sist.study;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;


public interface ReplyMapper {

	@Select("SELECT no,study_id,user_id,nickname,msg,TO_CHAR(regdate,'yyyy-MM-dd hh24:mi:ss') as dbday " + 
			"FROM study_reply " + 
			"WHERE study_id=#{study_id} " + 
			"ORDER BY no DESC")
	public List<ReplyVO> replyListData(int study_id);
	
	@Insert("INSERT INTO study_reply VALUES("
			+ "sr_no_seq.nextval,#{study_id},#{user_id},#{nickname},#{msg},SYSDATE)")
	public void replyInsert(ReplyVO vo);
	
	@Delete("DELETE FROM study_reply WHERE no=#{no}")
	public void replyDelete(int no);
	
	@Update("UPDATE study_reply SET "
			+ "msg=#{msg} "
			+ "WHERE no=#{no}")
	public void replyUpdate(ReplyVO vo);
}
