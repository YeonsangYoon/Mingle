package com.sist.mento;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Primary
public class MentoServiceImpl implements MentoService{
    private MentoDAO dao;
    @Autowired
    public MentoServiceImpl(MentoDAO dao) {
        this.dao = dao;
    }

    public List<MentoVO> MentoListData(int page, String column, String fd, String user_id){
        int rowSize=12;
        int start=(rowSize*page)-(rowSize-1);
        int end=rowSize*page;

        Map<String, Object> map=new HashMap<>();
        map.put("start", start);
        map.put("end", end);
        map.put("column", column);
        map.put("fd", fd);

        List<MentoVO> list = dao.MentoListData(map);
        for(MentoVO vo:list) {
            double star = Math.round(((double)vo.getSum_star()/vo.getCnt_star())*10)/10.0;
            vo.setAvg_star(star);
        }

        // �ȷο� ���� �߰�
        for(MentoVO vo : list)
            vo.setFollowed(false);

        if(user_id != null) {
            List<Integer> noList = new ArrayList<>();
            for(MentoVO vo : list){
                noList.add(vo.getMento_no());
            }
            HashMap<String, Object> params = new HashMap<>();
            params.put("user_id", user_id);
            params.put("list", noList);

            List<Integer> followCheckList = dao.getfollowCheckListByUserId(params);

            for(MentoVO vo : list){
                for(int no : followCheckList){
                    if(vo.getMento_no() == no){
                        vo.setFollowed(true);
                        break;
                    }
                }
            }
        }

        return list;
    }

    public int mentoTotalPage(Map map) {
        return dao.mentoTotalPage(map);
    }

    public MentoVO mentoDetailData(int mento_no) {
        return dao.mentoDetailData(mento_no);
    }

    public List<MentoVO> mentoEdit(){
        return dao.mentoEdit();
    }
    public void mentoEditUpdate(Map map){
        dao.mentoEditUpdate(map);
    }


    public void deleteMentoTimeByMentoNo(int mento_no){
        dao.deleteMentoTimeByMentoNo(mento_no);
    }
    public void deleteMentoCounselByMentoNo(int mento_no){
        dao.deleteMentoCounselByMentoNo(mento_no);
    }
    public void deleteMentoReviewByMentoNo(int mento_no){
        dao.deleteMentoReviewByMentoNo(mento_no);
    }
    public void deleteMentoFollowByMentoNo(int mento_no){
        dao.deleteMentoFollowByMentoNo(mento_no);
    }
    public int deleteMentoByMentoNo(int mento_no){
        return dao.deleteMentoByMentoNo(mento_no);
    }

    public void mentoRegist(MentoVO vo) {
        dao.mentoRegist(vo);
    }

    public int regist_usercheck(String id) {
        return dao.regist_usercheck(id);
    }
    
    // ���� �ȷο� ����
    @Override
    @Transactional
    public int followMentor(int mento_no, String user_id) {
        dao.insertMentoFollow(user_id, mento_no);
        dao.modifyMentoFollowerCount(mento_no, 1);
        return dao.getFollowerCountByMentoNo(mento_no);
    }

    @Override
    @Transactional
    public int unFollowMentor(int mento_no, String user_id) {
        dao.deleteMentoFollow(user_id, mento_no);
        dao.modifyMentoFollowerCount(mento_no, -1);
        return dao.getFollowerCountByMentoNo(mento_no);
    }

	@Override
	public void mentoContact(ContactVO vo) {
		dao.mentoContact(vo);
		
	}
}
