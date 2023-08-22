package com.sist.member;

import com.sist.Authentication.MemberVO;

import java.util.List;
import java.util.Map;

public interface MemberService {
    public List<MemberVO> getAllListMember(int start, int end);
    public int getMemberTotalPage();
}
