package com.sist.study;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class ReplyVO {
	private int reply_id, study_id, group_id, parent_id, dept;
	private String user_id,nickname,msg,dbday,parent_nickname;
	private Date regdate;
}
