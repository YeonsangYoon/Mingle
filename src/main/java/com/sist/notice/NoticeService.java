package com.sist.notice;

import java.util.List;

public interface NoticeService {
    public List<NoticeVO> visitNoticeListPage(int page);
    public NoticeVO getNoticeByNoticeId(int notice_id);
    public int getNoticeTotalPage();
    public NoticeVO visitNoticeDetailPage(int notice_id);
    public int insertNewNotice(NoticeVO vo);
    public void deleteNotice(int notice_id);
    public void updateNotice(NoticeVO vo);
}
