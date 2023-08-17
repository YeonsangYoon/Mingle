package com.sist.main;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageVO {
	private int curpage;
	private int totalpage;
	private int startPage,endPage;
	private String count;
}
