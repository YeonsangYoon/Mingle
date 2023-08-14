package com.sist.Authentication;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface AuthenticationMapper {
    // login 검사
    @Select("SELECT password, NICKNAME FROM member WHERE user_id=#{id}")
    public List<AuthenticationVO> getMembersByID(String id);

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
    public int insertMember(AuthenticationVO vo);
}
