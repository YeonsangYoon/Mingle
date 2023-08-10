package com.sist.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberDAO {
    private MemberMapper mapper;

    @Autowired
    MemberDAO(MemberMapper mapper){
        this.mapper = mapper;
    }

    // login check
    public List<MemberVO> getMembersByID(String id){
        return mapper.getMembersByID(id);
    }
}
