package com.sist.Authentication;

import java.util.List;

public interface AuthenticationService {
    public List<MemberVO> getMembersByID(String id);
    public MemberVO getMemberByID(String id);
    public int getIDCount(String id);
    public int getNicknameCount(String nickname);

    public int addMember(MemberVO member);
}
