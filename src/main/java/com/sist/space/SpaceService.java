package com.sist.space;

import java.util.*;

public interface SpaceService {
		public List<SpaceVO> spaceListByCategory(Map<String, Object> map);
		public int spaceTotalpage(String category);

		public List<SpaceVO> spaceDetailData(int space_id);

		public void spaceZzimInsert(Map map);
	 	public void spaceZzimCancel(Map map);
}
