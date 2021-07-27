package com.spring.service;

import java.util.ArrayList;

import com.spring.vo.MemberVO;
import com.spring.vo.NoticeVO;
import com.spring.vo.QuestionVO;

public interface AdminService {
	ArrayList<MemberVO> getMemberList();
	boolean question(String qtitle,String qcontent,String id);
	ArrayList<QuestionVO> getQuestionList();
	QuestionVO getQuestion(String title);
	void insertAnswer(QuestionVO vo);
	ArrayList<NoticeVO> getNoticeList();
}
