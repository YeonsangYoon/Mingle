package com.sist.study;

import java.math.BigDecimal;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Primary
public class StudyServiceImpl implements StudyService{
	private final int PAGE_DATA_COUNT = 12;

	@Autowired
	private StudyDAO dao;


	public void setParameterValid(Map<String, Object> params){
		// page
		if(!params.containsKey("page")){
			params.put("page", 1);
		}
		else{
			int page = Integer.parseInt((String)params.get("page"));
			params.put("page", page);
		}
		int page = (Integer)params.get("page");
		params.put("start", (page - 1) * PAGE_DATA_COUNT);
		params.put("end", page * PAGE_DATA_COUNT);
		// tech
		if(!params.containsKey("tech")){
			params.put("tech", "");
		}
		// searchWord
		if(!params.containsKey("searchWord")){
			params.put("searchWord", "");
		}
		//wCheck
		if(!params.containsKey("wCheck")){
			params.put("wCheck", false);
		}
		else{
			boolean wCheck = Boolean.parseBoolean((String)params.get("wCheck"));
			params.put("wCheck", wCheck);
		}
		//tCheck
		if(!params.containsKey("tCheck")){
			params.put("tCheck", false);
		}
		else{
			boolean tCheck = Boolean.parseBoolean((String)params.get("tCheck"));
			params.put("tCheck", tCheck);
		}
		//cCheck
		if(!params.containsKey("cCheck")){
			params.put("cCheck", false);
		}
		else{
			boolean cCheck = Boolean.parseBoolean((String)params.get("cCheck"));
			params.put("cCheck", cCheck);
		}
		if(!(Boolean)params.get("wCheck") && !(Boolean)params.get("tCheck") && !(Boolean)params.get("cCheck")){
			params.put("wCheck", true);
			params.put("tCheck", true);
			params.put("cCheck", true);
		}
		if(!params.containsKey("onOffToggle")) {
			params.put("onOffToggle", false);
		}
		else {
			boolean onOffToggle = Boolean.parseBoolean((String)params.get("onOffToggle"));
			params.put("onOffToggle", onOffToggle);
		}	
	}

	@Override
	public Map<String, Object> getStudyListData(Map<String, Object> params) {
		setParameterValid(params);

		int totalpage = dao.getTotalPageByParams(params);
		List<StudyVO> list = dao.getStudyListByParams(params);

		if(!list.isEmpty()){
			List<Integer> idList = new ArrayList<>();
			for(StudyVO vo : list){
				idList.add(vo.getStudy_id());
			}
			List<Map<String, Object>> tech_list = getTechListData(idList);

			for(StudyVO vo : list){
				vo.setTechs(new ArrayList<>());

				for(Map<String, Object> tech : tech_list){
					int study_id = ((BigDecimal)tech.get("STUDY_ID")).intValue();
					String tech_name = (String)tech.get("TECH");

					if(study_id == vo.getStudy_id()){
						if(tech_name.equals(params.get("tech"))){
							vo.getTechs().add(0, tech_name);
						}
						else{
							vo.getTechs().add(tech_name);
						}
					}
				}
			}
		}
		
		for (StudyVO vo : list) {
            boolean isLiked = false;
            String user_id=(String) params.get("user_id");
            if(user_id!=null)
            {
            	Map<String, Object> map = new HashMap<>();
            	map.put("user_id", user_id);
            	map.put("study_id", vo.getStudy_id());
            	
            	isLiked = dao.studyLiked(map);
            	
            	vo.setIsLiked(isLiked);
            }
        }

		Map<String, Object> ret = new HashMap<>();
		ret.put("totalpage", totalpage);
		ret.put("list", list);
		return ret;
	}

	@Override
	public List<Map<String, Object>> getTechListData(List<Integer> list) {
		return dao.getTechListData(list);
	}

	@Override
	@Transactional
	public void insertStudy(Map<String, Object> params, String[] tech) {
		// 1. recruit 자료형을 String => int
		params.put("recruit", Integer.parseInt((String)params.get("recruit")));

		// 2. Study 하나 Insert
		dao.studyInsert(params);
		int study_id = dao.getMaxStudy_id();

		// 3. Tech 여러개 Insert
		for(String t : tech){
			dao.studyTechInsert(study_id, t);
		}
	}

	@Override
	@Transactional
	public int deleteStudy(int study_id, String user_id) {
		// 1. user_id와 study_id 매칭 확인
		if(!user_id.equals(dao.getUserIdByStudyId(study_id))){
			return -1;
		}
		// 2. 댓글 삭제
		dao.deleteStudyReplyByStudyId(study_id);
		// 3. 파일 삭제
		dao.deleteStudyFileByStudyId(study_id);
		// 4. 좋아요 삭제
		dao.deleteStudyLikeByStudyId(study_id);
		// 5. 기술 스택 삭제
		dao.deleteStudyTechByStudyId(study_id);
		// 6. 스터디 삭제
		return dao.deleteStudyByStudyId(study_id);
	}

	@Override
	@Transactional
	public void updateStudy(Map<String, Object> params, String[] tech) {
		// 매개변수 조정
		params.put("study_id", Integer.parseInt((String)params.get("study_id")));
		params.put("recruit", Integer.parseInt((String)params.get("recruit")));

		// 스터디 수정
		dao.studyUpdate(params);
		// tech 수정 => 일단 다 지우고 새로 삽입
		dao.deleteStudyTechByStudyId((Integer)params.get("study_id"));
		for(String t : tech){
			dao.studyTechInsert((Integer)params.get("study_id"), t);
		}
	}
	
	@Override
	@Transactional
	public StudyVO studyDetailData(int study_id) {
		dao.increaseStudyHit(study_id);
		return dao.studyDetailData(study_id);
	}

	
	// 좋아요
	@Override
	public boolean studyLiked(Map map) {
	return dao.studyLiked(map);
	}
	
	@Override
	public int studyLikeOn(int study_id, String user_id) {
	return dao.studyLikeOn(study_id, user_id);
	}
	
	@Override
	public int studyLikeOff(int study_id, String user_id) {
	return dao.studyLikeOff(study_id, user_id);
	}
	
	/* 댓글 관련 */
	// 댓글 목록
	@Override
	public List<ReplyVO> getReplyList(int study_id) {
		List<ReplyVO> list = dao.getReplyList(study_id);
		Map<Integer, ReplyVO> rMap = new HashMap<>();
		Map<Integer, List<Integer>> adjlist = new HashMap<>();

		// 아이디 보호
		for(ReplyVO vo : list){
			rMap.put(vo.getReply_id(), vo);
			adjlist.put(vo.getReply_id(), new ArrayList<>());
			String user_id = vo.getUser_id();
			vo.setUser_id(user_id.substring(0, 4) + user_id.substring(4).replaceAll(".", "*"));
		}

		// 재정렬
		List<Integer> roots = new ArrayList<>();
		for(ReplyVO vo : list){
			if(vo.getReply_id() == vo.getParent_id()){
				roots.add(vo.getReply_id());
			}
			else{
				adjlist.get(vo.getParent_id()).add(vo.getReply_id());
			}
		}

		List<ReplyVO> retval = new ArrayList<>();
		for(int root : roots){
			List<Integer> ordered = new ArrayList<>();
			dfs(root, ordered, adjlist);
			for(int i : ordered){
				retval.add(rMap.get(i));
			}
		}

		return retval;
	}

	void dfs(int cur, List<Integer> ordered, Map<Integer, List<Integer>> adjlist){
		ordered.add(cur);
		for(int child : adjlist.get(cur)){
			dfs(child, ordered, adjlist);
		}
	}

	// 삽입
	@Override
	public int insertStudyReply(ReplyVO vo) {
		return dao.insertStudyReply(vo);
	}

	@Override
	public int insertStudyRootReply(ReplyVO vo) {
		return dao.insertStudyRootReply(vo);
	}

	// 수정
	@Override
	public int updateReply(int reply_id, String msg) {
		return dao.updateReply(reply_id, msg);
	}

	// 삭제
	@Override
	public int deleteReply(int reply_id){
		List<ReplyVO> group = dao.getReplyBySameGroup(reply_id);

		// 연결리스트 생성
		Map<Integer, List<Integer>> adjlist = new HashMap<>();
		for(ReplyVO vo : group){
			int rid = vo.getReply_id();
			int pid = vo.getParent_id();

			if(rid == pid){
				continue;
			}
			else if(!adjlist.containsKey(pid)){
				adjlist.put(pid, new ArrayList<>());
			}
			adjlist.get(pid).add(rid);
		}

		List<Integer> deleteList = new ArrayList<>();
		Queue<Integer> queue = new ArrayDeque<>();
		queue.add(reply_id);

		while(!queue.isEmpty()){
			int cur = queue.poll();
			deleteList.add(cur);
			if(adjlist.containsKey(cur)){
				for(int next : adjlist.get(cur)){
					queue.add(next);
				}
			}
		}

		return dao.deleteReplys(deleteList);
	}

	// 마감 임박 관련
	public List<StudyVO> getFourDeadlineStudy(){
		List<StudyVO> list = dao.getFourDeadlineStudy();
		return list.subList(0, 4);
	}
}
