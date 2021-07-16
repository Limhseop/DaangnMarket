package com.spring.service;

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
}
