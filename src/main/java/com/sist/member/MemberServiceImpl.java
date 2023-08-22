package com.sist.member;

import com.sist.Authentication.MemberVO;
import com.sist.mento.MentoDAO;
import com.sist.mento.MentoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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

    @Override
    @Transactional
    public int deleteMentoByAdmin(int mento_no) {
        mentoDao.deleteMentoTimeByMentoNo(mento_no);
        mentoDao.deleteMentoCounselByMentoNo(mento_no);
        mentoDao.deleteMentoReviewByMentoNo(mento_no);
        mentoDao.deleteMentoFollowByMentoNo(mento_no);
        return mentoDao.deleteMentoByMentoNo(mento_no);
    }
}
