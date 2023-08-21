package com.sist.space;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;
@Repository
public class SpaceDAO {
	@Autowired
	private SpaceMapper mapper;
	
	public List<SpaceVO> spaceListByCategory(Map<String, Object> map)
	{
		return mapper.spaceListByCategory(map);
	}

	public int spaceTotalpage(String category)
	{
		return mapper.spaceTotalpage(category);
	}
	
	public SpaceVO spaceDetailData(int space_id)
	{
		return mapper.spaceDetailData(space_id);
	}
	
}
