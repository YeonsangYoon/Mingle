package com.sist.space;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
public class BookingVO {
    private int bk_id, startsat, endsat, person, space_id, amount;
    private String purpose, bookingrequest, user_id, regdate, poster, title, category;
    private Date bk_date;
}
