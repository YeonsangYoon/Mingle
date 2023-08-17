package com.sist.Authentication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public Map<String, String> isValidLogin(String id, String pwd) {
        MemberVO member = dao.getMemberByID(id);

        Map<String, String> ret = new HashMap<String, String>();
        if(member != null){
            if(pwdEncoder.matches(pwd, member.getPassword())){
                ret.put("result", "OK");
                ret.put("nickname", member.getNickname());
            }
            else{
                ret.put("result", "NOPWD");
            }
        }
        else{
            ret.put("result", "NOID");
        }

        return ret;
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

    @Override
    public boolean isValidPassword(String user_id, String pwd) {
        MemberVO member = dao.getMemberByID(user_id);
        return pwdEncoder.matches(pwd, member.getPassword());
    }
}
