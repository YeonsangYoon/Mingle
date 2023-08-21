package com.sist.space;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;
@Repository
public class SpaceDAO {
	@Autowired
	private SpaceMapper mapper;
	
	public List<SpaceVO> spaceListByCategory(Map map)
	{
		return mapper.spaceListByCategory(map);
	}

	public int spaceTotalpage(Map map)
	{
		return mapper.spaceTotalpage(map);
	}
	
	public SpaceVO spaceDetailData(int space_id)
	{
		return mapper.spaceDetailData(space_id);
	}
	
}
