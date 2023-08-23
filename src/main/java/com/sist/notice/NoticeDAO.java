package com.sist.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NoticeDAO {
    private NoticeMapper mapper;
    @Autowired
    public NoticeDAO(NoticeMapper mapper) {
        this.mapper = mapper;
    }

    public List<NoticeVO> getNoticeList(int start, int end){
        return mapper.getNoticeList(start, end);
    }

    public int getNoticeTotalPage(int data_count){
        return mapper.getNoticeTotalPage(data_count);
    }

    public void increaseHit(int notice_id){
        mapper.increaseHit(notice_id);
    }

    public NoticeVO getNoticeVO(int notice_id){
        return mapper.getNoticeVO(notice_id);
    }

    public int insertNotice(NoticeVO vo){
        return mapper.insertNotice(vo);
    }
}
