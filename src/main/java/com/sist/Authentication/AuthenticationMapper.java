package com.sist.Authentication;

import org.apache.ibatis.annotations.*;
import org.springframework.security.core.parameters.P;

import java.util.List;

public interface AuthenticationMapper {
    @Select("SELECT USER_ID, PASSWORD, USER_NAME, NICKNAME, GENDER, PHONE, EMAIL, BIRTHDAY, ADDRESS, DETAIL_ADDRESS, REGDATE " +
            "FROM MEMBER " +
            "WHERE USER_ID=#{id}")
    public MemberVO getMemberByID(String id); // 아이디로 회원정보 조회

    @Select("SELECT COUNT(*) FROM MEMBER WHERE USER_ID=#{id}")
    public int getIDCount(String id); // 아이디 중복 조회

    @Select("SELECT COUNT(*) FROM MEMBER WHERE NICKNAME=#{nickname}")
    public int getNicknameCount(String nickname); // 닉네임 중복 조회
    // 회원 join
    @Insert("INSERT INTO member VALUES (" +
            "#{user_id}," +
            "#{password}," +
            "#{user_name}," +
            "#{nickname}," +
            "#{gender}," +
            "#{phone}," +
            "#{email}," +
            "#{birthday}," +
            "#{address}," +
            "#{detail_address}," +
            "SYSDATE)")
    public int insertMember(MemberVO vo); // 회원가입

    @Update("UPDATE MEMBER SET " +
                "USER_NAME=#{user_name}," +
                "NICKNAME=#{nickname}," +
                "GENDER=#{gender}," +
                "PHONE=#{phone}," +
                "email=#{email}," +
                "BIRTHDAY=#{birthday}," +
                "ADDRESS=#{address}," +
                "DETAIL_ADDRESS=#{detail_address} " +
            "WHERE USER_ID=#{user_id}")
    public int updateMember(MemberVO vo); // 회원정보 수정


    /* 회원 탈퇴 구현 */
    // 스터디 관련
    @Delete("DELETE STUDY_FILE " +
            "WHERE STUDY_ID IN (SELECT STUDY_ID FROM STUDY WHERE USER_ID = #{user_id})")
    public void deleteStudyFile(@Param("user_id")String user_id); // 스터디 파일 삭제
    @Delete("DELETE STUDY_TECH " +
            "WHERE STUDY_ID IN (SELECT STUDY_ID FROM STUDY WHERE USER_ID = #{user_id})")
    public void deleteStudyTech(@Param("user_id")String user_id); // 스터디 기술스택 삭제

    @Delete("DELETE STUDY_LIKE " +
            "WHERE USER_ID = #{user_id} " +
            "OR STUDY_ID IN (SELECT STUDY_ID FROM STUDY S WHERE S.USER_ID = #{user_id})")
    public void deleteStudyLike(@Param("user_id")String user_id); // 스터디 좋아요 삭제

    @Delete("DELETE STUDY_REPLY " +
            "WHERE STUDY_ID IN (SELECT STUDY_ID FROM STUDY S WHERE S.USER_ID = #{user_id})")
    public void deleteStudyReply(@Param("user_id")String user_id); // 스터디 리뷰 삭제

    @Delete("DELETE STUDY WHERE USER_ID = #{user_id}")
    public void deleteStudy(@Param("user_id")String user_id); // 스터디 삭제

    // 공간 관련
    @Delete("DELETE SPACE_REVIEW WHERE USER_ID = #{user_id}")
    public void deleteSpaceReview(@Param("user_id")String user_id); // 공간리뷰 삭제

    @Delete("DELETE SPACE_ZZIM WHERE USER_ID = #{user_id}")
    public void deleteSpaceZzim(@Param("user_id")String user_id); // 공간 찜 삭제

    @Delete("DELETE SPACE_BOOKING WHERE USER_ID = #{user_id}")
    public void deleteSpaceBooking(@Param("user_id")String user_id); // 공간 예약 삭제

    // 멘토 관련
    @Delete("DELETE MENTO_FOLLOW " +
            "WHERE USER_ID = #{user_id} " +
            "OR MENTO_NO = (SELECT MENTO_NO FROM MENTO_REG M WHERE M.USER_ID = #{user_id})")
    public void deleteMentoFollow(@Param("user_id")String user_id); // 멘토 팔로우 삭제

    @Delete("DELETE MENTO_COUNSEL " +
            "WHERE USER_ID = #{user_id} " +
            "OR MENTO_NO = (SELECT MENTO_NO FROM MENTO_REG M WHERE M.USER_ID = #{user_id})")
    public void deleteMentoCounsel(@Param("user_id")String user_id); // 멘토 상담 삭제

    @Delete("DELETE MENTO_REVIEW " +
            "WHERE USER_ID = #{user_id} " +
            "OR MENTO_NO = (SELECT MENTO_NO FROM MENTO_REG M WHERE M.USER_ID = #{user_id})")
    public void deleteMentoReview(@Param("user_id")String user_id); // 멘토 리뷰 삭제

    @Delete("DELETE MENTO_TIME " +
            "WHERE MENTO_NO = (SELECT MENTO_NO FROM MENTO_REG M WHERE M.USER_ID = #{user_id})")
    public void deleteMentoTime(@Param("user_id")String user_id); // 멘토링 시간 삭제

    @Delete("DELETE MENTO_REG WHERE USER_ID = #{user_id}")
    public void deleteMento(@Param("user_id")String user_id); // 멘토 삭제

    // 유저 테이블 삭제
    @Delete("DELETE MEMBER WHERE USER_ID = #{user_id}")
    public int deleteMember(@Param("user_id")String user_id); // 유저 삭제
}
