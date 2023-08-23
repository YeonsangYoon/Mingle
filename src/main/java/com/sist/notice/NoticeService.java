package com.sist.notice;

import java.util.List;

public interface NoticeService {
    public List<NoticeVO> visitNoticeListPage(int page);
    public int getNoticeTotalPage();
    public NoticeVO visitNoticeDetailPage(int notice_id);
    public int insertNewNotice(NoticeVO vo);
}
