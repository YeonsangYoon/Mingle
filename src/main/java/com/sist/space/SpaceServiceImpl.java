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


	
}
