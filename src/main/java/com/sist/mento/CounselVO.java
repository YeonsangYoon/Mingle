package com.sist.mento;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CounselVO {
	
	private int counsel_no, mento_no, str_time, end_time, state, rep_state, regdate, hopedate ;
	private String user_id, content, image ;
}
