package com.sist.Authentication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Primary
public class AuthenticationServiceImpl implements AuthenticationService {
    private AuthenticationDAO dao;

    @Autowired
    AuthenticationServiceImpl(AuthenticationDAO dao){
        this.dao = dao;
    }

    @Override
    public List<MemberVO> getMembersByID(String id) {
        return dao.getMembersByID(id);
    }

    @Override
    public MemberVO getMemberByID(String id){
        MemberVO member = dao.getMemberByID(id);

        // 성별 전환
        if(member.getGender().equals("m")){
            member.setGender("남자");
        }
        else{
            member.setGender("여자");
        }

        return member;
    }
}
