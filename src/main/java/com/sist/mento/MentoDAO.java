package com.sist.mento;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MentoDAO {
	
	@Autowired
	private MentoMapper mapper;
	
	public List<MentoVO> MentoListData(){
		return mapper.MentoListData();
	}
	
	public int mentoTotalPage() {
		return mapper.mentoTotalPage();
	}

}
