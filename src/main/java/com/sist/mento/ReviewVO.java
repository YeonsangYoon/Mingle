package com.sist.mento;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewVO {
	private int review_no, star, mento_no, counsel_no,rep_state;
	private String regdate, user_id, content, nickname;
}
