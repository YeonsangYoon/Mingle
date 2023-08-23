package com.sist.space;
import java.util.*;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class ReviewVO {
	private int review_id, ratings;
	private String content, dbday,user_id,nickname;
	private Date regdate;
}
