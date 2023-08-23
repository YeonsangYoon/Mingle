package com.sist.study;

import java.util.List;
import java.util.Map;

public interface StudyService {
	public Map<String, Object> getStudyListData(Map<String, Object> params);
	public List<Map<String, Object>> getTechListData(List<Integer> list);
	public StudyVO studyDetailData(int study_id);
}
