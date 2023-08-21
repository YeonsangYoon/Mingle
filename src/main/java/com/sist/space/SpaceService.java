package com.sist.space;

import java.util.*;


public interface SpaceService {
		public List<SpaceVO> spaceListByCategory(Map map);

		public SpaceVO spaceDetailData(int space_id);
		
		public int spaceTotalpage(Map map);
		
}
