package com.sist.Authentication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Primary
public class AuthenticationServiceImpl implements AuthenticationService {
    private AuthenticationDAO dao;
    private BCryptPasswordEncoder pwdEncoder;

    @Autowired
    AuthenticationServiceImpl(AuthenticationDAO dao, BCryptPasswordEncoder encoder){
        this.dao = dao;
        this.pwdEncoder = encoder;
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

    @Override
    public int getIDCount(String id) {
        return dao.getIDCount(id);
    }

    @Override
    public int getNicknameCount(String nickname) {
        return dao.getNicknameCount(nickname);
    }

    @Override
    public int addMember(MemberVO member) {
        // password 인코딩
        member.setPassword(pwdEncoder.encode(member.getPassword()));

        return dao.insertMember(member);
    }
}
