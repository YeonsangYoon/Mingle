package com.sist.Authentication;

import java.util.List;

public interface AuthenticationService {
    public List<MemberVO> getMembersByID(String id);
    public MemberVO getMemberByID(String id);
}
