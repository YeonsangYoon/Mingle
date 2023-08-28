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
	public void studyInsert(Map<String, Object> params)
	{
		mapper.studyInsert(params);
	}
	public void studyTechInsert(int study_id, String tech){
		mapper.studyTechInsert(study_id, tech);
	}
	public int getMaxStudy_id(){
		return mapper.getMaxStudy_id();
	}
	
	// 스터디 삭제
	public String getUserIdByStudyId(int study_id){
		return mapper.getUserIdByStudyId(study_id);
	}
	public void deleteStudyReplyByStudyId(int study_id){
		mapper.deleteStudyReplyByStudyId(study_id);
	}
	public void deleteStudyFileByStudyId(int study_id){
		mapper.deleteStudyFileByStudyId(study_id);
	}
	public void deleteStudyLikeByStudyId(int study_id){
		mapper.deleteStudyLikeByStudyId(study_id);
	}
	public void deleteStudyTechByStudyId(int study_id){
		mapper.deleteStudyTechByStudyId(study_id);
	}
	public int deleteStudyByStudyId(int study_id){
		return mapper.deleteStudyByStudyId(study_id);
	}

	// 스터디 수정
	public void studyUpdate(Map<String, Object> params) {
		mapper.studyUpdate(params);
	}
	public void deleteTechsByStudyId(int study_id){
		mapper.deleteTechsByStudyId(study_id);
	}
	
	//스터디 좋아요
	public boolean studyLiked(Map map) {
		return mapper.studyLiked(map);
	}
	
	public int studyLikeOn(int study_id, String user_id) {
		return mapper.studyLikeOn(study_id, user_id);
	}
	
	public int studyLikeOff(int study_id, String user_id) {
		return mapper.studyLikeOff(study_id, user_id);
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

	// 마감 임박 관련
	public List<StudyVO> getFourDeadlineStudy(){
		return mapper.getFourDeadlineStudy();
	}
}
