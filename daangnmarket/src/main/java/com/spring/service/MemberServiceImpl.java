package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.MemberDAO;
import com.spring.vo.MemberVO;
import com.spring.vo.SessionVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDAO dao;
	
	public SessionVO loginCheck(String id, String pass) {
		return dao.loginCheck(id, pass);
	}
	public boolean idCheck(String id) {
		return dao.idCheck(id);
	}
	public boolean join_proc(MemberVO vo) {
		return dao.join_proc(vo);
	}
	public String findIdCheck(MemberVO vo) {
		return dao.findIdCheck(vo);
	}
}
