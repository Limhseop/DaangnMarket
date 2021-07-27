package com.spring.service;



import java.util.List;

import com.spring.vo.NoticeVO;

public interface NoticeService {
	// 공지사항 작성 
	boolean getInsertResult(NoticeVO vo);
	// 공지사항 리스트 출력
	public List<NoticeVO> list() throws Exception;
	// 공지사항 상세보기
	NoticeVO getContent(String bno);
	//공지사항 업데이트
	boolean getUpdateResult(NoticeVO vo);
	//공지사항 삭제 
	boolean getDeleteResult(NoticeVO vo);
}
