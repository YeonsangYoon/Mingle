package com.sist.study;

import java.util.List;
import java.util.Map;

public interface StudyService {
	public Map<String, Object> getStudyListData(Map<String, Object> params);
	public List<Map<String, Object>> getTechListData(List<Integer> list);

	public StudyVO studyDetailData(int study_id);
	public void insertStudy(Map<String, Object> params, String[] tech);
	public int deleteStudy(int study_id, String user_id);
	public void updateStudy(Map<String, Object> params, String[] tech);
	public boolean studyLiked(Map map);
	public int studyLikeOn(int study_id, String user_id);
	public int studyLikeOff(int study_id, String user_id);

	/* 댓글 관련 */
	// 출력
	public List<ReplyVO> getReplyList(int string_id);
	// 삽입
	public int insertStudyReply(ReplyVO vo);
	public int insertStudyRootReply(ReplyVO vo);
	// 수정
	public int updateReply(int reply_id, String msg);
	// 삭제
	public int deleteReply(int reply_id);

	// 마감 임박 관련
	public List<StudyVO> getFourDeadlineStudy();

	public List<Integer> getReplyListByUserId(String user_id);
}
