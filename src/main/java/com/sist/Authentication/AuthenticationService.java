package com.sist.Authentication;

import java.util.List;
import java.util.Map;

public interface AuthenticationService {
    public Map<String, String> isValidLogin(String user_id, String pwd);
    public MemberVO getMemberByID(String id);
    public int getIDCount(String id);
    public int getNicknameCount(String nickname);
    public int addMember(MemberVO member);
    public boolean isValidPassword(String user_id, String pwd);
    public int updateMember(MemberVO member);
}
