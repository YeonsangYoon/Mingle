package com.sist.space;

import java.util.*;


public interface SpaceService {
		public SpaceVO spaceDetailData(int space_id);
		
		public List<SpaceVO> spaceListData(Map map);
		
		public int spaceTotalpage();
		
}
