package com.sist.space;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

@Service
@Primary
public class SpaceServiceImpl implements SpaceService{
	private SpaceDAO dao;

	@Autowired
    SpaceServiceImpl(SpaceDAO dao){
        this.dao = dao;
    }
	
	@Override
	public List<SpaceVO> spaceListByCategory(Map<String, Object> map) {
		return dao.spaceListByCategory(map);
	}


	@Override
	public int spaceTotalpage(String category) {
		return dao.spaceTotalpage(category);
	}

	@Override
	public List<SpaceVO> spaceDetailData(int space_id) {
		return dao.spaceDetailData(space_id);
	}

	public List<BookingVO> getBookingListByIdAndRegdate(int space_id, String regdate){
		return dao.getBookingListByIdAndRegdate(space_id, regdate);
	}
	
	@Override
	public List<ReviewVO> spaceReviewData(int space_id) {
		return dao.spaceReviewData(space_id);
	}

	@Override
	public void spaceZzimInsert(Map map) {
		dao.spaceZzimInsert(map);
	}

	@Override
	public void spaceZzimCancel(Map map) {
		dao.spaceZzimCancel(map);
	}

	@Override
	public boolean spaceIsFavorited(Map map) {
		return dao.spaceIsFavorited(map);
	}

	@Override
	public SpaceVO spaceBookingData(int space_id) {
		return dao.spaceBookingData(space_id);
	}

	@Override
	public void spaceBookingSubmit(Map map) {
		String year = (String)map.get("year");
		String month = (String)map.get("month");
		String date = (String)map.get("date");
		map.put("bk_date", year + "-" + month + "-" + date);
		dao.spaceBookingSubmit(map);
	}

	@Override
	public void createReview(ReviewVO vo) {
		dao.createReview(vo);
	}

	@Override
	public void deleteReview(int review_id) {
		dao.deleteReview(review_id);
	}

	@Override
	public List<ReviewVO> spaceTop3RecentReview() {
		return dao.spaceTop3RecentReview();
	}

	@Override
	public List<SpaceVO> listingNearby(int region_code) {
		return dao.listingNearby(region_code);
	}

	@Override
	public int substrRegionCode(int space_id) {
		return dao.substrRegionCode(space_id);
	}
	
}
