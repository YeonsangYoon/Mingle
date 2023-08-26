package com.sist.study;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudyDAO {
	private StudyMapper mapper;
	@Autowired
	public StudyDAO(StudyMapper mapper) {
		this.mapper = mapper;
	}

	// 스터디 목록
	public List<StudyVO> getStudyListByParams(Map<String, Object> params){
		return mapper.getStudyListByParams(params);
	}

	// 총 페이지
	public int getTotalPageByParams(Map<String, Object> params){
		return mapper.getTotalPageByParams(params);
	}

	// 기술 목록
	public List<Map<String, Object>> getTechListData(List<Integer> list) {
		return mapper.getTechListData(list);
	}
	
	// 상세 페이지
	public StudyVO studyDetailData(int study_id)
	{
		return mapper.studyDetailData(study_id);
	}
	public void increaseStudyHit(int study_id){
		mapper.increaseStudyHit(study_id);
	}
	
	// 등록 페이지
	public void studyInsert(StudyVO vo)
	{
		mapper.studyInsert(vo);
	}
	
	// 삭제 페이지
	public String studyDelete(int study_id, String pwd)
	{
		   String result="";
		   String db_pwd=mapper.getPassword(study_id);
		   if(db_pwd.equals(pwd))
		   {
			   result="yes";
			   mapper.studyDelete(study_id);
		   }
		   else
		   {
			   result="no";
		   }
		   return result;
	}

	/* 댓글 관련 */
	// 댓글 목록
	public List<ReplyVO> getReplyList(int study_id){
		return mapper.getReplyList(study_id);
	}

	// 삽입
	public int insertStudyReply(ReplyVO vo){
		return mapper.insertStudyReply(vo);
	}
	public int insertStudyRootReply(ReplyVO vo){
		return mapper.insertStudyRootReply(vo);
	}

	// 수정
	public int updateReply(int reply_id, String msg){
		return mapper.updateReply(reply_id, msg);
	}

	// 삭제관련
	public List<ReplyVO> getReplyBySameGroup(int reply_id){
		return mapper.getReplyBySameGroup(reply_id);
	}

	public int deleteReplys(List<Integer> replys){
		return mapper.deleteReplys(replys);
	}
}
