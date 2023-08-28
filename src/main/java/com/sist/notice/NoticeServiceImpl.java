package com.sist.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Primary
public class NoticeServiceImpl implements NoticeService{
    private final int PAGE_DATA_COUNT = 10;
    private NoticeDAO noticeDAO;
    @Autowired
    public NoticeServiceImpl(NoticeDAO noticeDAO) {
        this.noticeDAO = noticeDAO;
    }

    @Override
    public List<NoticeVO> visitNoticeListPage(int page){
        return noticeDAO.getNoticeList((page - 1) * PAGE_DATA_COUNT, page * PAGE_DATA_COUNT);
    }

    @Override
    public int getNoticeTotalPage() {
        return noticeDAO.getNoticeTotalPage(PAGE_DATA_COUNT);
    }

    @Override
    @Transactional
    public NoticeVO visitNoticeDetailPage(int notice_id) {
        noticeDAO.increaseHit(notice_id);
        return noticeDAO.getNoticeVO(notice_id);
    }

    @Override
    public NoticeVO getNoticeByNoticeId(int notice_id) {
        return noticeDAO.getNoticeVO(notice_id);
    }

    @Override
    public int insertNewNotice(NoticeVO vo) {
        return noticeDAO.insertNotice(vo);
    }

    @Override
    public void deleteNotice(int notice_id) {
        noticeDAO.deleteNotice(notice_id);
    }

    @Override
    public void updateNotice(NoticeVO vo) {
        noticeDAO.updateNotice(vo);
    }
}
