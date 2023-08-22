package com.sist.member;

import com.sist.Authentication.AuthenticationService;
import com.sist.Authentication.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("mypage/")
public class MemberRestController {
    private AuthenticationService service;

    @Autowired
    public MemberRestController(AuthenticationService service) {
        this.service = service;
    }

    @PostMapping("checkPassword.do")
    public String checkPassword(String pwd, HttpSession session){
        String user_id = (String)session.getAttribute("id");
        return service.isValidPassword(user_id, pwd) ? "OK" : "NO";
    }

    @PostMapping("edit.do")
    public String edit_info(MemberVO vo, HttpSession session){
        String user_id = (String)session.getAttribute("id");
        String nickname = (String)session.getAttribute("nickname");

        vo.setUser_id(user_id);

        if(!nickname.equals(vo.getNickname()) && service.getNicknameCount(vo.getNickname()) > 0){
            return "DUPNICKNAME";
        }
        else if(service.updateMember(vo) == 1){
            session.setAttribute("nickname", vo.getNickname());
            return "OK";
        }
        return "FAIL";
    }
}
