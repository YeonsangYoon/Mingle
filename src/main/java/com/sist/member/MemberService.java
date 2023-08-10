package com.sist.member;

import java.util.List;

public interface MemberService {
    public List<MemberVO> getMembersByID(String id);
}
