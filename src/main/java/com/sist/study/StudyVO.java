package com.sist.study;

import java.util.*;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class StudyVO {
	private int study_id,hit;
	private String title,content,nickname,dbday,deadline;
	private Date regdate;
	private String[] techs;
}
