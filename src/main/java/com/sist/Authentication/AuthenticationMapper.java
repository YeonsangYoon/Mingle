package com.sist.Authentication;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface AuthenticationMapper {
    @Select("SELECT USER_ID, PASSWORD, USER_NAME, NICKNAME, GENDER, PHONE, EMAIL, BIRTHDAY, ADDRESS, DETAIL_ADDRESS, REGDATE " +
            "FROM MEMBER " +
            "WHERE USER_ID=#{id}")
    public MemberVO getMemberByID(String id);

    @Select("SELECT COUNT(*) FROM MEMBER WHERE USER_ID=#{id}")
    public int getIDCount(String id);

    @Select("SELECT COUNT(*) FROM MEMBER WHERE NICKNAME=#{nickname}")
    public int getNicknameCount(String nickname);
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
    public int insertMember(MemberVO vo);

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
    public int updateMember(MemberVO vo);
}
