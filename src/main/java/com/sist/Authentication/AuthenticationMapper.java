package com.sist.Authentication;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface AuthenticationMapper {
    // login 검사
    @Select("SELECT password, NICKNAME FROM MEMBER WHERE user_id=#{id}")
    public List<MemberVO> getMembersByID(String id);

    @Select("SELECT USER_ID ,USER_NAME, NICKNAME, GENDER, PHONE, EMAIL, BIRTHDAY, ADDRESS, DETAIL_ADDRESS, REGDATE " +
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
}
