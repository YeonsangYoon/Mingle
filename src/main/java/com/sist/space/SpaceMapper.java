package com.sist.space;
import java.util.*;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
/*
private int space_id,avg_rate,cnt_rate,price,min_guest,max_guest,starttime,endtime,hit;
private String title,subject,phone,address,latitude,longitude,region_code,description,fcst_guides,cautions;
 */
import com.sist.space.*;
public interface SpaceMapper {
	/* --------------------- List ------------------------*/
	public List<SpaceVO> spaceListByCategory(Map<String, Object> map);

	public int spaceTotalpage(@Param("category") String category);
	/* --------------------- List ------------------------*/

	
	/* --------------------- Detail ------------------------*/
	@Select("SELECT space_id,category,title,subject,phone,address,description,fcst_guides,cautions,price,min_guest,max_guest,starttime,endtime "
			+ "FROM space_list WHERE space_id=#{space_id}")
	public SpaceVO spaceDetailData(int space_id);
	
	/* --------------------- Detail ------------------------*/
	
}
