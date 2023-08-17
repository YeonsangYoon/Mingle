package com.sist.Authentication;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AuthenticationDAO {
    private AuthenticationMapper mapper;

    @Autowired
    AuthenticationDAO(AuthenticationMapper mapper){
        this.mapper = mapper;
    }

    // login check
    public List<MemberVO> getMembersByID(String id){
        return mapper.getMembersByID(id);
    }

    public MemberVO getMemberByID(String id){
        return mapper.getMemberByID(id);
    }

    public int getIDCount(String id){
        return mapper.getIDCount(id);
    }

    public int getNicknameCount(String nickname){
        return mapper.getNicknameCount(nickname);
    }

    public int insertMember(MemberVO vo){
        return mapper.insertMember(vo);
    }
}
