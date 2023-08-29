package com.sist.space;

import java.util.*;

public interface SpaceService {
		public List<SpaceVO> spaceListByCategory(Map<String, Object> map);
		public int spaceTotalpage(String category);

		public List<SpaceVO> spaceDetailData(int space_id);
		public List<BookingVO> getBookingListByIdAndRegdate(int space_id, String regdate);
		public List<SpaceVO> listingNearby(int region_code);
	    public int substrRegionCode (int space_id);
		 
		public List<ReviewVO> spaceReviewData(int space_id);

		public SpaceVO spaceBookingData(int space_id);

		public boolean spaceIsFavorited(Map map);
		public void spaceZzimInsert(Map map);
	 	public void spaceZzimCancel(Map map);
	 	
	    public void spaceBookingSubmit(Map map);

	    public void createReview(ReviewVO vo);
	    public void deleteReview(int review_id);
	    public List<ReviewVO> spaceTop3RecentReview();
}
