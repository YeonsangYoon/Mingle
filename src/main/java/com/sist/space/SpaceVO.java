package com.sist.space;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SpaceVO {
	private int space_id,avg_rate,cnt_rate,price,min_guest,max_guest,starttime,endtime,hit;
	private String title,subject,phone,address,latitude,longitude,region_code,description,fcst_guides,cautions;
}
