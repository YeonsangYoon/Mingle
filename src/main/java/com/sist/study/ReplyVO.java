package com.sist.study;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class ReplyVO {
	private int no, study_id;
	private String user_id,nickname,msg,dbday;
	private Date regdate;
}
