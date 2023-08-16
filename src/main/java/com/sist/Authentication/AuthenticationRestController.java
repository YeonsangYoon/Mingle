package com.sist.Authentication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("auth/")
public class AuthenticationRestController {
    private AuthenticationService service;
    private BCryptPasswordEncoder encoder;

    @Autowired
    AuthenticationRestController(AuthenticationService service, BCryptPasswordEncoder encoder){
        this.service = service;
        this.encoder = encoder;
    }

    @PostMapping("login.do") // login 수행
    public String loginCheck(String id, String pwd, HttpSession session){
        List<MemberVO> members = service.getMembersByID(id);

        if(members.size()==1){
            MemberVO member = members.get(0);
            if(encoder.matches(pwd, member.getPassword())){
                session.setAttribute("id", id);
                session.setAttribute("nickname", member.getNickname());
                return "OK";
            }
            else{
                return "NOPWD";
            }
        }
        else {
            return "NOID";
        }
    }

    @PostMapping("dupIdCheck.do")
    public String duplicate_userid_check(String userid){
        int count = service.getIDCount(userid);
        return (count==0) ? "OK" : "NO";
    }

    @PostMapping("dupNicknameCheck.do")
    public String duplicate_nickname_check(String nickname){
        int count = service.getNicknameCount(nickname);
        return (count==0) ? "OK" : "NO";
    }
}
