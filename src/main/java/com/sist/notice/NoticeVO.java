package com.sist.notice;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeVO {
    int notice_id, hit;
    String title, content, regdate;
}
