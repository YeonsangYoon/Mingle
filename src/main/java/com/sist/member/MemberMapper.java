package com.sist.member;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MemberMapper {
    // login 검사
    @Select("SELECT password, NICKNAME FROM member WHERE user_id=#{id}")
    public List<MemberVO> getMembersByID(String id);

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
