package com.sist.member;

import com.sist.Authentication.MemberVO;
import com.sist.mento.MentoDAO;
import com.sist.mento.MentoVO;
import com.sist.space.BookingVO;
import com.sist.study.StudyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Primary
public class MemberServiceImpl implements MemberService{
    private MemberDAO memberDao;
    private MentoDAO mentoDao;

    @Autowired
    public MemberServiceImpl(MemberDAO memberDao, MentoDAO mentoDao) {
        this.memberDao = memberDao;
        this.mentoDao = mentoDao;
    }

    @Override
    public List<MemberVO> getAllListMember(int start, int end) {
        return memberDao.getAllListMember(start, end);
    }

    @Override
    public List<MentoVO> getAllListMento(int start, int end) {
        return memberDao.getAllListMento(start, end);
    }

    @Override
    public int getMentoTotalPage() {
        return memberDao.getMentoTotalPage();
    }

    @Override
    public int getMemberTotalPage() {
        return memberDao.getMemberTotalPage();
    }


    public List<BookingVO> getBookingListByUserId(String page, String user_id){
        Map<String, Object> params = new HashMap<>();
        params.put("user_id", user_id);

        int curpage = (page == null) ? 1 : Integer.parseInt(page);
        params.put("start", (curpage-1) * 10);
        params.put("end", curpage * 10);

        return memberDao.getSpaceBookingListByUserName(params);
    }

    public int getSpaceBookingTotalPage(String user_id){
        int count = memberDao.getSpaceBookingTotalCount(user_id);
        return (int)(Math.ceil(count/10.0));
    }

    @Override
    @Transactional
    public int deleteMentoByAdmin(int mento_no) {
        mentoDao.deleteMentoCounselByMentoNo(mento_no);
        mentoDao.deleteMentoReviewByMentoNo(mento_no);
        mentoDao.deleteMentoFollowByMentoNo(mento_no);
        return mentoDao.deleteMentoByMentoNo(mento_no);
    }

    @Override
    public Map<String, Object> getStudyListByUserId(String page, String user_id) {
        int curpage = 1;
        try{
            curpage = Integer.parseInt(page);
        } catch (NullPointerException | NumberFormatException e){}

        int totalpage = (int)(Math.ceil(memberDao.getStudyTotalCountByUserId(user_id) / 10.0));
        List<StudyVO> list = memberDao.getStudyListByUserId(user_id, (curpage-1)*10, curpage*10);

        Map<String, Object> ret = new HashMap<>();
        ret.put("totalpage", totalpage);
        ret.put("list", list);
        return ret;
    }
}
