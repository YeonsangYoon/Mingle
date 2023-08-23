package com.sist.space;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface SpaceMapper {
	/* --------------------- List ------------------------*/
	public List<SpaceVO> spaceListByCategory(Map<String, Object> map);

	public int spaceTotalpage(@Param("category") String category);
	/* --------------------- List ------------------------*/

	
	/* --------------------- Detail ------------------------*/
	// 공간 전체정보 
	@Select("SELECT * FROM space_list sl "
	      + "JOIN space_images si ON sl.space_id = si.space_id "
	      + "WHERE sl.space_id=#{space_id}")
	public List<SpaceVO> spaceDetailData(int space_id);
	
	/* --------------------- Detail ------------------------*/
	
	// 좋아요 
	@Insert("INSERT INTO space_zzim VALUES("
 		   +"sqz_no_seq.nextval,#{user_id},#{space_id})")
	public void spaceZzimInsert(Map map);
 	@Delete("DELETE space_zzim WHERE space_id=#{space_id} AND user_id=#{user_id}")
 	public void spaceZzimCancel(Map map);
 	
 	
 	
}
