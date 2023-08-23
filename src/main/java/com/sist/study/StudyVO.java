package com.sist.study;

import java.util.*;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class StudyVO {
	private int study_id,hit,recruit;
	private String user_id,title,content,nickname,dbday,deadline,period,onoff,contact_type,contact_link;
	private Date regdate;
	private List<String> techs;
}
