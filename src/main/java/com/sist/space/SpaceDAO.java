package com.sist.space;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;
@Repository
public class SpaceDAO {
	@Autowired
	private SpaceMapper mapper;
	
	public List<SpaceVO> spaceListData(Map map)
	{
		return mapper.spaceListData(map);
	}
	
	public int databoardTotalPage()
	{
		return mapper.databoardTotalPage();
	}
	
	
	public SpaceVO spaceDetailData(int space_id)
	{
		return mapper.spaceDetailData(space_id);
	}
	
	
}
