package com.sist.Authentication;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AuthenticationDAO {
    private AuthenticationMapper mapper;

    @Autowired
    AuthenticationDAO(AuthenticationMapper mapper){
        this.mapper = mapper;
    }

    // login check
    public MemberVO getMemberByID(String id){
        return mapper.getMemberByID(id);
    }

    public int getIDCount(String id){
        return mapper.getIDCount(id);
    }

    public int getNicknameCount(String nickname){
        return mapper.getNicknameCount(nickname);
    }

    public int insertMember(MemberVO vo){
        return mapper.insertMember(vo);
    }

    public int updateMember(MemberVO vo){
        return mapper.updateMember(vo);
    }

    /* 회원 탈퇴 관련 */
    // 스터디 관련
    public void deleteStudyFile(String user_id){
        mapper.deleteStudyFile(user_id);
    }
    public void deleteStudyTech(String user_id){
        mapper.deleteStudyTech(user_id);
    }
    public void deleteStudyLike(String user_id){
        mapper.deleteStudyLike(user_id);
    }
    public void deleteStudyReply(String user_id){
        mapper.deleteStudyReply(user_id);
    }
    public void deleteStudy(String user_id){
        mapper.deleteStudy(user_id);
    }
    // 공간 관련
    public void deleteSpaceReview(String user_id){
        mapper.deleteSpaceReview(user_id);
    }
    public void deleteSpaceZzim(String user_id){
        mapper.deleteSpaceZzim(user_id);
    }
    public void deleteSpaceBooking(String user_id){
        mapper.deleteSpaceBooking(user_id);
    }
    // 멘토 관련
    public void deleteMentoFollow(String user_id){
        mapper.deleteMentoFollow(user_id);
    }
    public void deleteMentoCounsel(String user_id){
        mapper.deleteMentoCounsel(user_id);
    }
    public void deleteMentoReview(String user_id){
        mapper.deleteMentoReview(user_id);
    }
    public void deleteMentoTime(String user_id){
        mapper.deleteMentoTime(user_id);
    }
    public void deleteMento(String user_id){
        mapper.deleteMento(user_id);
    }
    // 맴버 삭제
    public int deleteMember(String user_id){
        return mapper.deleteMember(user_id);
    }
}
