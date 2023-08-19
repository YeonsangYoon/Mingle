package com.sist.space;
import java.util.*;

import org.apache.ibatis.annotations.Select;
/*
private int space_id,avg_rate,cnt_rate,price,min_guest,max_guest,starttime,endtime,hit;
private String title,subject,phone,address,latitude,longitude,region_code,description,fcst_guides,cautions;
 */
import com.sist.space.*;
public interface SpaceMapper {
	@Select("SELECT space_id,title,subject,phone,address,description,fcst_guides,cautions,price,min_guest,max_guest,starttime,endtime "
		  + "FROM space_list WHERE space_id=#{space_id}")
	public SpaceVO spaceDetailData(int space_id);
	
	@Select("SELECT space_id,poster,title,price,max_guest,num "
			+ "FROM (SELECT space_id,poster,title,price,max_guest,rownum as num "
			+ "FROM (SELECT/*+INDEX_DESC(space_list PK_SPACE_LIST)*/ space_id,poster,title,price,max_guest "
			+ "FROM space_list)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<SpaceVO> spaceListData(Map map);
/*	@Select("SELECT space_id,title,price,max_guest,cnt_rate,region_code,num "
		  + "FROM (SELECT space_id,title,price,max_guest,cnt_rate,region_code,rownum as num "
		  + "FROM (SELECT space_id,title,price,max_guest,cnt_rate,region_code "
		  + "FROM space_list)) "
		  + "WHERE num BETWEEN #{start} AND #{end}")
	public List<SpaceVO> spaceListData(Map map);
*/	
	@Select("SELECT COUNT(*) FROM space_list")
	public int spaceTotalpage();
	
	
	
}
