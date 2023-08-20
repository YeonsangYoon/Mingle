package com.sist.study;

import java.util.List;
import java.util.Map;

public interface StudyService {
	public List<StudyVO> studyListData(int start, int end);
	public int studyTotalpage();
	public StudyVO studyDetailData(int study_id);
}
