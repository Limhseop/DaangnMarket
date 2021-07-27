package com.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.AdminDAO;
import com.spring.vo.MemberVO;
import com.spring.vo.NoticeVO;
import com.spring.vo.QuestionVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public ArrayList<MemberVO> getMemberList() {
		
		ArrayList<MemberVO> list = adminDAO.getMemberList();
		return list;
	}

	@Override
	public boolean question(String qtitle, String qcontent, String id) {
		
		return adminDAO.question(qtitle,qcontent,id);
	}

	@Override
	public ArrayList<QuestionVO> getQuestionList() {
		ArrayList<QuestionVO> qlist = adminDAO.getQuestionList();
		return qlist;
	}

	@Override
	public QuestionVO getQuestion(String title) {
		return adminDAO.getQuestion(title);
	}

	@Override
	public void insertAnswer(QuestionVO vo) {
		adminDAO.insertQuestion(vo);
	}

	@Override
	public ArrayList<NoticeVO> getNoticeList() {
		return adminDAO.getNoticeList();
	}

}
