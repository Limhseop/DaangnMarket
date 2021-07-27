package com.spring.service;



import java.util.List;

import com.spring.vo.NoticeVO;

public interface NoticeService {
	// �������� �ۼ� 
	boolean getInsertResult(NoticeVO vo);
	// �������� ����Ʈ ���
	public List<NoticeVO> list() throws Exception;
	// �������� �󼼺���
	NoticeVO getContent(String bno);
	//�������� ������Ʈ
	boolean getUpdateResult(NoticeVO vo);
	//�������� ���� 
	boolean getDeleteResult(NoticeVO vo);
}
