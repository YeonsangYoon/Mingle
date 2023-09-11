package com.sist.notice;

import org.apache.ibatis.annotations.*;

import java.util.List;

public interface NoticeMapper {
    @Select("SELECT * FROM " +
            "( " +
            "   SELECT /*+ INDEX_DESC(N NOTICE_NOTICE_ID_IDX) */ " +
            "       NOTICE_ID, TITLE, CONTENT, HIT, TO_CHAR(REGDATE, 'yyyy-MM-dd HH24:mm') AS REGDATE, ROWNUM AS NUM" +
            "   FROM NOTICE N " +
            "   WHERE ROWNUM <= #{end} " +
            ") " +
            "WHERE NUM > #{start}")
    public List<NoticeVO> getNoticeList(@Param("start")int start, @Param("end")int end);

    @Select("SELECT NOTICE_ID, TITLE, CONTENT, HIT, TO_CHAR(REGDATE, 'yyyy-MM-dd HH24:mm') AS REGDATE " +
            "FROM NOTICE " +
            "   WHERE NOTICE_ID = #{notice_id}")
    public NoticeVO getNoticeVO(@Param("notice_id")int notice_id);

    @Select("SELECT CEIL(COUNT(*)/#{data_count}) FROM NOTICE")
    public int getNoticeTotalPage(@Param("data_count")int data_count);

    @Update("UPDATE NOTICE SET " +
            "HIT = HIT + 1 " +
            "WHERE NOTICE_ID = #{notice_id}")
    public void increaseHit(@Param("notice_id")int notice_id);

    @Insert("INSERT INTO NOTICE VALUES( " +
            "   NOTICE_NOTICE_ID_SEQ.nextval," +
            "   #{title}," +
            "   #{content}," +
            "   0," +
            "   SYSDATE" +
            ")")
    public int insertNotice(NoticeVO vo);

    @Delete("DELETE FROM NOTICE WHERE NOTICE_ID = #{notice_id}")
    public void deleteNotice(int notice_id);

    @Update("UPDATE NOTICE SET " +
            "   TITLE = #{title}, " +
            "   CONTENT = #{content} " +
            "WHERE NOTICE_ID = #{notice_id}")
    public void updateNotice(NoticeVO vo);
}
