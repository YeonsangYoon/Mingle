package com.sist.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Primary
public class MemberServiceImpl implements MemberService{
    private MemberDAO dao;

    @Autowired
    MemberServiceImpl(MemberDAO dao){
        this.dao = dao;
    }

    @Override
    public List<MemberVO> getMembersByID(String id) {
        return dao.getMembersByID(id);
    }
}
