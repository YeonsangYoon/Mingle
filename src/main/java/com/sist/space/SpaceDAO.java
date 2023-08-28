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
	
	public List<SpaceVO> spaceDetailData(int space_id)
	{
		mapper.hitIncrement(space_id);
		return mapper.spaceDetailData(space_id);
	}
	
    public SpaceVO spaceBookingData(int space_id)
    {
    	return mapper.spaceBookingData(space_id);
    }
	
	public List<BookingVO> getBookingListByIdAndRegdate(int space_id, String regdate){
		return mapper.getBookingListByIdAndRegdate(space_id, regdate);
	}
	
	public List<ReviewVO> spaceReviewData(int space_id)
	{
		return mapper.spaceReviewData(space_id);
	}
	
	public void createReview(ReviewVO vo)
	{
		mapper.createReview(vo);
	}
    public void deleteReview(int review_id)
    {
    	 mapper.deleteReview(review_id);
    }
	
    public boolean spaceIsFavorited(Map map)
    {
    	return mapper.spaceIsFavorited(map);
    }
    
    public void spaceZzimInsert(Map map)
    {
    	mapper.spaceZzimInsert(map);
    }

    public void spaceZzimCancel(Map map)
    {
    	mapper.spaceZzimCancel(map);
    }
    
    public void spaceBookingSubmit(Map map)
    {
    	mapper.spaceBookingSubmit(map);
    }

}
