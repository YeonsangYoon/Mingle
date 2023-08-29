package com.sist.member;

import com.sist.Authentication.MemberVO;
import com.sist.mento.MentoVO;
import com.sist.space.BookingVO;
import com.sist.study.StudyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class MemberDAO {
    private MemberMapper mapper;

    @Autowired
    public MemberDAO(MemberMapper mapper) {
        this.mapper = mapper;
    }

    public List<MemberVO> getAllListMember(int start, int end){
        return mapper.getAllListMember(start, end);
    }

    public List<MentoVO> getAllListMento(int start, int end){
        return mapper.getAllListMento(start, end);
    }

    public int getMentoTotalPage(){
        return mapper.getMentoTotalPage();
    }

    public int getMemberTotalPage(){
        return mapper.getMemberTotalPage();
    }

    public List<BookingVO> getSpaceBookingListByUserName(Map<String, Object> params){
        return mapper.getSpaceBookingListByUserName(params);
    }
    public int getSpaceBookingTotalCount(String user_id){
        return mapper.getSpaceBookingTotalCount(user_id);
    }

    public List<StudyVO> getStudyListByUserId(String user_id, int start, int end){
        return mapper.getStudyListByUserId(user_id, start, end);
    }
    public int getStudyTotalCountByUserId(String user_id){
        return mapper.getStudyTotalCountByUserId(user_id);
    }
}
