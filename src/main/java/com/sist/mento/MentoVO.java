package com.sist.mento;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

/*
 * MENTO_NO
USER_ID
JOB_CAT
KIND_CAT
CAREER
JOB
COST
TITLE
INTRO
REGDATE
IMAGE
FOLLOW
SUM_STAR
REV_CNT
CNT_STAR
dept
 */
@Getter
@Setter
public class MentoVO {
	private int mento_no, cost, follow, sum_star, rev_cnt, cnt_star ;
	private double avg_star;
	private String user_id, job_cat, job, title, intro, image, career, dept, user_name ;
	private Date dbday;
	private boolean isFollowed;
}
