package com.sist.space;

import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface SpaceMapper {
    /* --------------------- List ------------------------*/
    public List<SpaceVO> spaceListByCategory(Map<String, Object> map);

    public int spaceTotalpage(@Param("category") String category);

    /* --------------------- Detail ------------------------*/
    // 공간 전체정보
    @Select("SELECT * FROM space_list sl "
            + "JOIN space_images si ON sl.space_id = si.space_id "
            + "WHERE sl.space_id=#{space_id}")
    public List<SpaceVO> spaceDetailData(int space_id);

    @Select("SELECT sr.*, TO_CHAR(sr.REGDATE, 'yyyy-MM-dd') AS dbday, nickname "
            + "FROM space_review sr, MEMBER m WHERE space_id=#{user_id} AND sr.USER_ID = m.USER_ID")
    public List<ReviewVO> spaceReviewData(int space_id);

    @Update("UPDATE space_list SET "
            + "hit=hit+1 WHERE space_id=#{space_id}")
    public void hitIncrement(int space_id);

    @Select("SELECT * " +
    		"FROM SPACE_BOOKING " +
    		"WHERE SPACE_ID=#{space_id} AND TO_CHAR(BK_DATE, 'yyyy-fmmm-dd') = #{regdate}")
    public List<BookingVO> getBookingListByIdAndRegdate(@Param("space_id")int space_id, @Param("regdate")String regdate);
    
    /* --------------------- zzim ------------------------*/
    // 좋아요
    @Select("SELECT CASE WHEN COUNT(*) > 0 THEN 1 ELSE 0 END AS isFavorited FROM space_zzim WHERE user_id=#{user_id} AND space_id=#{space_id}")
    public boolean spaceIsFavorited(Map map);
    
    @Insert("INSERT INTO space_zzim VALUES("
            + "spz_id_seq.nextval,#{user_id},#{space_id})")
    public void spaceZzimInsert(Map map);

    @Delete("DELETE space_zzim WHERE space_id=#{space_id} AND user_id=#{user_id}")
    public void spaceZzimCancel(Map map);


    /* --------------------- Review ------------------------*/
    // 이용 이력 확인 (유저번호와 공간번호를 조합하여 List<bookingVO>예약번호를 조회한다) => 만일 예약 내역이 있는 경우, 예약번호 중 선택/ 없는 경우, 예약 후 리뷰를 남길 수 있다는 문구 출력
    /*@Select("SELECT COUNT(*) FROM space_booking WHERE user_id=#{user_id} AND space_id=#{space_id}")
    public int isReviewExisted(Map map);*/

    // 리뷰작성 => rv_id, ratings,regdate,user_id,space_id,content (+예약 한 건당 리뷰 한 번/추후 디벨롭)
    @Insert("INSERT INTO space_review VALUES("
            + "spr_id_seq.nextval,#{ratings},SYSDATE,#{user_id},#{space_id},#{content})")
    public void createReview(ReviewVO vo);


}
