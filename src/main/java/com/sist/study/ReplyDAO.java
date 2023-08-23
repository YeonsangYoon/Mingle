package com.sist.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class ReplyDAO {
	@Autowired
	private ReplyMapper mapper;
	
	public List<ReplyVO> replyListData(int study_id)
	{
		return mapper.replyListData(study_id);
	}
	
	public void replyInsert(ReplyVO vo)
	{
		mapper.replyInsert(vo);
	}
	
	public void replyDelete(int no)
	{
		mapper.replyDelete(no);
	}
	
	public void replyUpdate(ReplyVO vo)
	{
		mapper.replyUpdate(vo);
	}
}
