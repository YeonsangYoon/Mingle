package com.sist.mento;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MentoDAO {
	
	@Autowired
	private MentoMapper mapper;
	
	public List<MentoVO> MentoListData(Map map){
		return mapper.MentoListData(map);
	}
	
	public int mentoTotalPage(Map map) {
		return mapper.mentoTotalPage(map);
	}
	
	public MentoVO mentoDetailData(int mento_no) {
		return mapper.mentoDetailData(mento_no);
	}
	
	public List<MentoVO> mentoEdit(){
		return mapper.mentoEdit();
	}
	public void mentoEditUpdate(Map map){
		mapper.mentoEditUpdate(map);
	}
	
	
	public void deleteMentoTimeByMentoNo(int mento_no){
		mapper.deleteMentoTimeByMentoNo(mento_no);
	}
	public void deleteMentoCounselByMentoNo(int mento_no){
		mapper.deleteMentoCounselByMentoNo(mento_no);
	}
	public void deleteMentoReviewByMentoNo(int mento_no){
		mapper.deleteMentoReviewByMentoNo(mento_no);
	}
	public void deleteMentoFollowByMentoNo(int mento_no){
		mapper.deleteMentoFollowByMentoNo(mento_no);
	}
	public int deleteMentoByMentoNo(int mento_no){
		return mapper.deleteMentoByMentoNo(mento_no);
	}
	
	public void mentoRegist(MentoVO vo) {
		mapper.mentoRegist(vo);
	}
	public void mentoContact(ContactVO vo) {
		mapper.mentoContact(vo);
	}
	
	public int regist_usercheck(String id) {
		return mapper.regist_usercheck(id);
	}
	
	// ���� �ȷο� ����
	public int getFollowerCountByMentoNo(int mento_no){
		return mapper.getFollowerCountByMentoNo(mento_no);
	}

	public void modifyMentoFollowerCount(int mento_no, int val){
		mapper.modifyMentoFollowerCount(mento_no, val);
	}

	public void insertMentoFollow(String user_id, int mento_no){
		mapper.insertMentoFollow(user_id, mento_no);
	}

	public void deleteMentoFollow(String user_id, int mento_no){
		mapper.deleteMentoFollow(user_id, mento_no);
	}

	public List<Integer> getfollowCheckListByUserId(Map<String, Object> params){
		return mapper.getfollowCheckListByUserId(params);
	}
}
