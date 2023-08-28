package com.sist.mento;

import java.util.List;
import java.util.Map;

import com.sist.Authentication.MemberVO;

public interface MentoService {
    // dao => service�� ����
    public List<MentoVO> MentoListData(int page, String column, String fd, String user_id);

    public int mentoTotalPage(Map map);

    public MentoVO mentoDetailData(int mento_no);

    public List<MentoVO> mentoEdit();
    public void mentoEditUpdate(Map map);


    public void deleteMentoTimeByMentoNo(int mento_no);
    public void deleteMentoCounselByMentoNo(int mento_no);
    public void deleteMentoReviewByMentoNo(int mento_no);
    public void deleteMentoFollowByMentoNo(int mento_no);
    public int deleteMentoByMentoNo(int mento_no);

    public void mentoRegist(MentoVO vo);
    public int regist_usercheck(String id);
    public void mentoContact(ContactVO vo);

    // ���� ����
    public int followMentor(int mento_no, String user_id);
    public int unFollowMentor(int mento_no, String user_id);
    
    //멘토 정보 관련
    public MentoVO getMentoByID(String id);
    public void mentoUpdate(MentoVO vo);
    public void mentoDelete(int mento_no);
    
    public String validateMento(String id);
    
    //멘토링 리스트
    public List<CounselVO> MentoringListData(int page, String column, String user_id);
    public int mentoringTotalPage(Map map);

    // 팔로우 많은 3명
    public List<MentoVO> getMostFollowedMento();
    
    
    
    
}
