package com.sist.mento;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ContactVO {
	private int end_time, str_time, mento_no, state, rep_state;
	private String  content, user_id, hope_date;
}
