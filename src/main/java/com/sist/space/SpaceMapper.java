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

    @Select("SELECT * FROM space_list "
            + "WHERE space_id=#{space_id}")
    public SpaceVO spaceBookingData(int space_id);
    
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
    
    public List<SpaceVO> listingNearby(int region_code);
    
    @Select("SELECT SUBSTR(region_code, 1, 5) FROM space_list WHERE space_id=#{space_list}")
    public int substrRegionCode (int space_id);
    
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
    // 리뷰작성 => RATINGS REGDATE USER_ID SPACE_ID CONTENT REVIEW_ID (+예약 한 건당 리뷰 한 번/추후 디벨롭)
    @Insert("INSERT INTO space_review VALUES("
            + "#{ratings},SYSDATE,#{user_id},#{space_id},#{content},spr_id_seq.nextval)")
    public void createReview(ReviewVO vo);

    @Delete("DELETE space_review WHERE REVIEW_ID=#{review_id}")
    public void deleteReview(int review_id);
    
    // 최근 리뷰순
    public List<ReviewVO> spaceTop3RecentReview();
    
    // 예약내역 추가하기
    @Insert("INSERT INTO space_booking VALUES("
    	  + "spb_id_seq.nextval,TO_DATE(#{bk_date}, 'yyyy-MM-dd'),#{startsAt},#{endsAt},#{person},#{purpose},#{bookingrequest},#{user_id},#{space_id},#{amount})")
    public void spaceBookingSubmit(Map map);
    
    
}
