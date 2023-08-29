package com.sist.member;

import com.sist.Authentication.MemberVO;
import com.sist.mento.MentoVO;
import com.sist.space.BookingVO;

import java.util.List;
import java.util.Map;

public interface MemberService {
    public List<MemberVO> getAllListMember(int start, int end);

    public List<MentoVO> getAllListMento(int start, int end);

    public int getMentoTotalPage();
    public int getMemberTotalPage();

    public int deleteMentoByAdmin(int mento_no);

    public List<BookingVO> getBookingListByUserId(String page, String user_id);

    public int getSpaceBookingTotalPage(String user_id);
}
