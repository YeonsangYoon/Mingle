package com.sist.member;

import com.sist.Authentication.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@Primary
public class MemberServiceImpl implements MemberService{
    private MemberDAO dao;
    @Autowired
    public MemberServiceImpl(MemberDAO dao) {
        this.dao = dao;
    }

    @Override
    public List<MemberVO> getAllListMember(int start, int end) {
        return dao.getAllListMember(start, end);
    }

    @Override
    public int getMemberTotalPage() {
        return dao.getMemberTotalPage();
    }
}
