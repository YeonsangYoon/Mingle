package com.sist.member;

import com.sist.Authentication.MemberVO;
import com.sist.mento.MentoVO;
import com.sist.space.BookingVO;
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

    @Select("SELECT * FROM " +
            "( " +
            "   SELECT a.*, ROWNUM rn " +
            "   FROM " +
            "   ( " +
            "       SELECT MR.*, M.USER_NAME as USER_NAME" +
            "       FROM MENTO_REG MR, MEMBER M " +
            "       WHERE MR.USER_ID = M.USER_ID " +
            "       ORDER BY MENTO_NO " +
            "   ) a " +
            "   WHERE ROWNUM <= #{end} " +
            ") " +
            "WHERE rn > #{start}")
    public List<MentoVO> getAllListMento(@Param("start")int start, @Param("end")int end);

    @Select("SELECT CEIL(COUNT(*)/12.0) FROM MENTO_REG")
    public int getMentoTotalPage();

    @Select("SELECT CEIL(COUNT(*)/12.0) FROM MEMBER")
    public int getMemberTotalPage();

    @Select("SELECT * FROM " +
            "(" +
            "   SELECT a.*, ROWNUM rn " +
            "   FROM " +
            "   ( " +
            "       SELECT * " +
            "       FROM SPACE_BOOKING " +
            "       WHERE USER_ID = #{user_id} " +
            "       ORDER BY BK_ID " +
            "   ) a" +
            "   WHERE ROWNUM <= #{end} " +
            ") " +
            "WHERE rn > #{start}")
    public List<BookingVO> getSpaceBookingListByUserName(Map<String, Object> params);
}
