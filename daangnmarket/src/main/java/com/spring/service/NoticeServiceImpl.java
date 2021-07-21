package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.NoticeDAO;
import com.spring.vo.NoticeVO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Override
	public boolean getInsertResult(NoticeVO vo) {
		return noticeDAO.getInsertResult((NoticeVO)vo);
	}
	@Override
	public List<NoticeVO> list() throws Exception {
		return noticeDAO.list();
	}
	@Override
	public NoticeVO getContent(String bno) {
		return noticeDAO.getContent(bno);
	}
	
}
