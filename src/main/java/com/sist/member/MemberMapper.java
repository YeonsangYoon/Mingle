package com.sist.member;

import com.sist.Authentication.MemberVO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface MemberMapper {
    @Select("SELECT * FROM " +
            "( " +
            "   SELECT a.*, ROWNUM rn " +
            "   FROM " +
            "   (" +
            "       SELECT user_id, password, user_name, nickname, gender, phone, email, birthday, address, detail_address, TO_CHAR(REGDATE, 'yyyy-MM-dd') AS dbday" +
            "       FROM MEMBER " +
            "       ORDER BY USER_ID " +
            "   ) a " +
            "   WHERE ROWNUM <= #{end} " +
            ") " +
            "WHERE rn > #{start}")
    public List<MemberVO> getAllListMember(@Param("start")int start, @Param("end")int end);

    @Select("SELECT CEIL(COUNT(*)/12.0) FROM MEMBER")
    public int getMemberTotalPage();
}
