package com.sist.member;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.Authentication.AuthenticationService;
import com.sist.Authentication.MemberVO;
import com.sist.mento.MentoVO;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class MemberRestController {
    private AuthenticationService authService;
    private MemberService memberService;
    private ObjectMapper objectMapper;

    @Autowired
    public MemberRestController(AuthenticationService authService, MemberService memberService) {
        this.authService = authService;
        this.memberService = memberService;
        objectMapper = new ObjectMapper();
    }

    @PostMapping("mypage/checkPassword.do")
    public String checkPassword(String pwd, HttpSession session){
        String user_id = (String)session.getAttribute("id");
        return authService.isValidPassword(user_id, pwd) ? "OK" : "NO";
    }

    @PostMapping("mypage/edit.do")
    public String editInfo(MemberVO vo, HttpSession session){
        String user_id = (String)session.getAttribute("id");
        String nickname = (String)session.getAttribute("nickname");

        vo.setUser_id(user_id);

        if(!nickname.equals(vo.getNickname()) && authService.getNicknameCount(vo.getNickname()) > 0){
            return "DUPNICKNAME";
        }
        else if(authService.updateMember(vo) == 1){
            session.setAttribute("nickname", vo.getNickname());
            return "OK";
        }
        return "FAIL";
    }

    @GetMapping(value = "admin/member_list.do", produces = "application/json;charset=UTF-8")
    public String getMemberListData(int page) throws JsonProcessingException {
        int totalpage = memberService.getMemberTotalPage();
        List<MemberVO> list = memberService.getAllListMember((page-1)*12, page*12);

        Map<String, Object> json = new HashMap<>();
        json.put("totalpage", totalpage);
        json.put("list", list);

        return objectMapper.writeValueAsString(json);
    }

    @GetMapping(value = "admin/mento_list.do", produces = "application/json;charset=UTF-8")
    public String getMentoListData(int page) throws JsonProcessingException {
        int totalpage = memberService.getMentoTotalPage();
        List<MentoVO> list = memberService.getAllListMento((page-1)*12, page*12);

        Map<String, Object> json = new HashMap<>();
        json.put("totalpage", totalpage);
        json.put("list", list);

        return objectMapper.writeValueAsString(json);
    }

    @PostMapping("admin/withdraw.do")
    public String withdrawMemberByAdmin(String user_id){
        int result = authService.withdrawByAdmin(user_id);
        return (result == 1) ? "OK" : "NO";
    }

    @PostMapping("admin/deleteMento.do")
    public String deleteMentoByAdmin(int mento_no){
        int result = memberService.deleteMentoByAdmin(mento_no);
        return (result == 1) ? "OK" : "NO";
    }
}
